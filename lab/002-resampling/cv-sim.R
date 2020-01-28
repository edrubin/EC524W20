
# Setup ----------------------------------------------------------------------------------
    # Install 'pacman' package
    #install.packages("pacman")
    # Load 'pacman'
    library(pacman)
    # Load other packages
    p_load(tidyverse, caret, parallel, tictoc, here, magrittr)

# Parameters -----------------------------------------------------------------------------
    # 0. Set seed
    set.seed(12345)
    # 1. Set simulation parameters
    N = 1000
    T = 50

# Generate population: Indices -----------------------------------------------------------
  # Create the indices of our population
  pop_df = expand_grid(
    i = 1:N,
    t = 1:T
  )
  # Check our population tibble's dimensions
  pop_df %>% dim()

# Generate population: Disturbances, covariates, response --------------------------------
  # Option 1: Generate disturbances and x with serial correlation
  # Disturbance for (i,t): Correlated within time (not across individuals)
  pop_df %<>%
    group_by(i) %>%
    mutate(
      x = arima.sim(model = list(ar = c(0.9)), n = T) %>% as.numeric(),
      e_it = arima.sim(model = list(ar = c(0.9)), n = T) %>% as.numeric()
    ) %>%
    ungroup()
  # Disturbance for (i): Constant within individual
  pop_df %<>%
    group_by(i) %>%
    mutate(e_i = runif(n = 1, min = -100, max = 100)) %>%
    ungroup()
  # # Option 2: Generate x_i, e_i, e_it without serial correlation
  # pop_df %<>% mutate(
  #   x = rnorm(T * N),
  #   e_i = runif(T * N, min = -100, max = 100),
  #   e_it = rnorm(T * N)
  # )
# NOTE: Continue here...
  # Calculate 'y'
  pop_df %<>% mutate(
    y = e_i + 3 * x - 2 * x^2 + 0.1 * x^4 + e_it
  )
  # Drop disturbances
  pop_df %<>% select(i, t, y, x)

  # Plot a few observations' time series
  ggplot(data = pop_df %>% filter(i < 5), aes(x = t, y = y, color = as.factor(i))) +
  geom_line() +
  geom_point() +
  theme_minimal(base_size = 16) +
  theme(legend.position = "none")

  # Plot x,y for t=1:3
  ggplot(data = pop_df %>% filter(i < 10 & t < 4), aes(x = x, y = y, color = as.factor(i))) +
  geom_line() +
  geom_point() +
  theme_minimal(base_size = 16) +
  theme(legend.position = "none")

# One iteration --------------------------------------------------------------------------
  # Define sample size
  n_i = 50
  # Draw sample (will be an input of our function)
  i_sampled = sample.int(N, size = n_i)
  # Draw a sample
  sample_df = pop_df %>% filter(i %in% i_sampled)

  # Define number of folds
  k_folds = 5
  # k-fold CV
  cv_output = train(
    # The relationship: y as a function of x
    y ~ .,
    # The method of estimating the model (linear regression)
    method = "knn",
    # The training data (which will be used for cross validation)
    data = sample_df %>% select(y, x),
    # Controls for the model training: k-fold cross validation
    trControl = trainControl(method = "cv", number = k_folds),
    # Allow cross validation to choose best value of K (# nearest neighbors)
    tuneGrid = expand.grid(k = seq(1, 500, by = 5))
  )

  # Check output from train()
  cv_output
  # And plot it
  ggplot(cv_output) + theme_minimal()

  # If you want the results as a data frame
  cv_output$results
  cv_output$resample

  # Subset to unseen data
  test_df = pop_df %>% filter(i %>% is_in(i_sampled) %>% not())
  # Make predictions on
  predictions = predict(
    cv_output,
    newdata = test_df
  )
  # Calculate RMSE in full population
  rmse_true = mean((test_df$y - predictions)^2) %>% sqrt()
  rmse_true

  # Plot the true test MSE against the estimated MSE
  ggplot(cv_output) +
  geom_segment(
    data = cv_output$results %>% filter(RMSE == min(RMSE)),
    aes(x = k, xend = k, y = RMSE, yend = rmse_true),
    color = "orange",
    linetype = "longdash",
    size = 0.3
  ) +
  geom_point(
    data = cv_output$results %>% filter(RMSE == min(RMSE)),
    aes(x = k, y = RMSE),
    color = "orange",
    size = 3
  ) +
  theme_minimal(base_size = 16) +
  geom_hline(yintercept = rmse_true, color = "blue") +
  scale_y_continuous("RMSE") +
  scale_x_continuous("K (# of nearest neighbors)")

# Function: One iteration ----------------------------------------------------------------
  # Our function for a single iteration of the simulation
  sim_fun = function(iter, n_i = 50, k_folds = 5) {
    # Draw sample
    i_sampled = sample.int(N, size = n_i)
    # Draw a sample
    sample_df = pop_df %>% filter(i %in% i_sampled)
    # k-fold CV
    cv_output = train(
      # The relationship: y as a function of w and x
      y ~ .,
      # The method of estimating the model (linear regression)
      method = "knn",
      # The training data (which will be used for cross validation)
      data = sample_df %>% select(y, x),
      # Controls for the model training: k-fold cross validation
      trControl = trainControl(method = "cv", number = k_folds),
      # Allow cross validation to choose best value of K (# nearest neighbors)
      tuneGrid = expand.grid(k = seq(1, 200, by = 10))
    )
    # Find the estimated MSE
    mse_est = mean(cv_output$resample$RMSE^2)
    # Subset to unseen data
    test_df = pop_df %>% filter(i %>% is_in(i_sampled) %>% not())
    # Make predictions on true test data
    predictions = predict(
      cv_output,
      newdata = test_df
    )
    # Calculate RMSE in full population
    mse_true = mean((test_df$y - predictions)^2)
    # Output results
    data.frame(
      iter,
      k = cv_output$bestTune$k,
      mse_est,
      mse_true
    )
  }

# # Example: Run the function once ---------------------------------------------------------
#   # Set seed
#   set.seed(1)
#   # Run (and time) one iteration
#   tic()
#   sim_fun(iter = 1)
#   toc()

# Run the simulation ---------------------------------------------------------------------
  # Set seed
  set.seed(123)
  # Run simulation 1,000 times in parallel (and time)
  tic()
  sim_df = mclapply(
    X = 1:1e3,
    FUN = sim_fun,
    mc.cores = 11
  ) %>% bind_rows()
  toc()
  # Save dataset
  # write_csv(x = sim_df, path = "cv-sim-knn.csv")
  write_csv(x = sim_df, path = "cv-sim-knn-uncorrelated.csv")

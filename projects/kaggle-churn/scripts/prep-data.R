
# Notes ----------------------------------------------------------------------------------
#   Goal: Prep data for in-class competition
#   Source: https://www.kaggle.com/blastchar/telco-customer-churn

# Setup ----------------------------------------------------------------------------------
  # Packages
  library(pacman)
  p_load(tidyverse, data.table, magrittr, here)

# Load and process original data ---------------------------------------------------------
  # Load data
  full_dt = here("data", "churn-full.csv") %>% fread(na.strings = c("NA", "?", ""))
  # Change names
  setnames(full_dt,
    old = c("customerID", "gender", "tenure"),
    new = c("CustomerID", "Gender", "Tenure")
  )

# Sample data: Training and testing subsets ----------------------------------------------
  # Set seed
  set.seed(123)
  # Sample 15% of the full dataset
  i_test = sample.int(nrow(full_dt), size = nrow(full_dt) %/% (1/0.15), replace = F)
  i_train = setdiff(1:nrow(full_dt), i_test)
  # Create training and testing datasets
  train_dt = full_dt[i_train]
  test_dt = full_dt[i_test]

# # Save data ------------------------------------------------------------------------------
#   # Save training data
#   write_csv(
#     x = train_dt,
#     path = here("data", "train.csv")
#   )
#   # Save test data (for submissions)
#   write_csv(
#     x = test_dt[, -"Churn"],
#     path = here("data", "test.csv")
#   )
#   # Save solutions
#   write_csv(
#     x = test_dt[, .(CustomerID, Churn)],
#     path = here("data", "test-solution.csv")
#   )
#   # Save example solution file
#   write_csv(
#     x = test_dt[, .(CustomerID, Churn = rep(c("Yes", "No")))],
#     path = here("data", "test-example.csv")
#   )

# # Train a GBM tree model -----------------------------------------------------------------
#   p_load(caret, gbm)
#   # Create cleaned versions of the dataset
#   clean_train = copy(train_dt)
#   clean_test = copy(test_dt[,-"Churn"])
#   # Clean the dataset (NAs)
#   median_charge = median(c(train_dt[,TotalCharges], test_dt[,TotalCharges]), na.rm = T)
#   clean_train[is.na(TotalCharges), TotalCharges := median_charge]
#   clean_test[is.na(TotalCharges), TotalCharges := median_charge]
#   # CV a boosted tree model
#   est_gbm = train(
#     Churn ~ .,
#     data = clean_train[,-"CustomerID"],
#     method = "gbm",
#     trControl = trainControl(
#       method = "cv",
#       number = 10
#     ),
#     tuneGrid = expand.grid(
#       "n.trees" = 290,
#       "interaction.depth" = 1,
#       "shrinkage" = 0.1,
#       "n.minobsinnode" = 10
#     )
#   )
#   # Save submission
#   gbm_dt = data.table(
#     CustomerID = clean_test[,CustomerID],
#     Churn = predict(est_gbm, newdata = clean_test)
#   )
#   write_csv(
#     x = gbm_dt,
#     path = here("data", "test-gbm.csv")
#   )

# # Train a random forest ------------------------------------------------------------------
#   p_load(caret, ranger)
#   # Create cleaned versions of the dataset
#   clean_train = copy(train_dt)
#   clean_test = copy(test_dt[,-"Churn"])
#   # Clean the dataset (NAs)
#   median_charge = median(c(train_dt[,TotalCharges], test_dt[,TotalCharges]), na.rm = T)
#   clean_train[is.na(TotalCharges), TotalCharges := median_charge]
#   clean_test[is.na(TotalCharges), TotalCharges := median_charge]
#   # CV a boosted tree model
#   est_rf = train(
#     Churn ~ .,
#     data = clean_train[,-"CustomerID"],
#     method = "ranger",
#     num.trees = 1e4,
#     trControl = trainControl(
#       method = "oob",
#     ),
#     tuneGrid = expand.grid(
#       "mtry" = 5,
#       "splitrule" = "hellinger",
#       "min.node.size" = 30
#     )
#   )
#   # Save submission
#   rf_dt = data.table(
#     CustomerID = clean_test[,CustomerID],
#     Churn = predict(est_rf, newdata = clean_test)
#   )
#   write_csv(
#     x = rf_dt,
#     path = here("data", "test-rf.csv")
#   )

# # Train a logistic elasticnet ------------------------------------------------------------
#   p_load(caret, glmnet)
#   # Create cleaned versions of the dataset
#   clean_train = copy(train_dt)
#   clean_test = copy(test_dt[,-"Churn"])
#   # Clean the dataset (NAs)
#   median_charge = median(c(train_dt[,TotalCharges], test_dt[,TotalCharges]), na.rm = T)
#   clean_train[is.na(TotalCharges), TotalCharges := median_charge]
#   clean_test[is.na(TotalCharges), TotalCharges := median_charge]
#   # CV a boosted tree model
#   est_net = train(
#     Churn ~ .,
#     data = clean_train[,-"CustomerID"],
#     method = "glmnet",
#     family = "binomial",
#     trControl = trainControl(
#       method = "cv",
#       number = 5
#     ),
#     tuneGrid = expand.grid(
#       alpha = 0.1,
#       lambda = 0.1
#     )
#   )
#   # Save submission
#   net_dt = data.table(
#     CustomerID = clean_test[,CustomerID],
#     Churn = predict(est_net, newdata = clean_test)
#   )
#   write_csv(
#     x = net_dt,
#     path = here("data", "test-net.csv")
#   )

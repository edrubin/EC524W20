
# Load packages
library(pacman)
p_load(tidyverse, janitor, caret, magrittr)

# Create dummy variables
iris_clean = dummyVars(~ ., iris) %>%
  predict(iris) %>%
  as_tibble() %>%
  clean_names()
# Drop one of the dummies to avoid linear dependence
iris_clean %<>% select(-species_virginica)

# Create train and test data
set.seed(1234)
train_df = iris_clean %>% sample_frac(0.8)
test_df = setdiff(iris_clean, train_df)

# Train forward-selection model
est_forward = train(
  sepal_length ~ .,
  data = train_df,
  trControl = trainControl(method = "cv", number = 5),
  method = "leapForward",
  tuneGrid = expand.grid(nvmax = 1:5)
)
# Predict
predict(est_forward, newdata = test_df)

# Train backward-selection model
est_backward = train(
  sepal_length ~ .,
  data = train_df,
  trControl = trainControl(method = "cv", number = 5),
  method = "leapBackward",
  tuneGrid = expand.grid(nvmax = 1:5)
)
# Predict
predict(est_backward, newdata = test_df)

# You can see which variables were selected by
est_forward$finalModel %>% summary()
est_backward$finalModel %>% summary()

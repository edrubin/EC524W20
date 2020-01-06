
# Setup ----------------------------------------------------------------------------------
  # Options
  options(stringsAsFactors = F)
  # Packages
  library(pacman)
  # devtools::install_github("tidymodels/parsnip")
  p_load(
    tidyverse, data.table, lubridate,
    ranger, parsnip,
    magrittr, here
  )

# Load data ------------------------------------------------------------------------------
  # Training data
  train_dt = here("data", "train.csv") %>% fread()
  # Testing data
  test_dt = here("data", "test.csv") %>% fread()

# Data work ------------------------------------------------------------------------------
  # Replace "NA" in alley with "No"
  train_dt[is.na(Alley), Alley := "No"]
  test_dt[is.na(Alley), Alley := "No"]
  # Same with fence
  train_dt[is.na(Fence), Fence := "No"]
  test_dt[is.na(Fence), Fence := "No"]
  # and MSZoning
  train_dt[is.na(MSZoning), MSZoning := "No"]
  test_dt[is.na(MSZoning), MSZoning := "No"]
  # and Utilities
  train_dt[is.na(Utilities), Utilities := "No"]
  test_dt[is.na(Utilities), Utilities := "No"]
  # and MiscFeature
  train_dt[is.na(MiscFeature), MiscFeature := "No"]
  test_dt[is.na(MiscFeature), MiscFeature := "No"]
  # and LotFrontage
  train_dt[is.na(LotFrontage), LotFrontage := 0]
  test_dt[is.na(LotFrontage), LotFrontage := 0]
  # and MasVnrArea
  train_dt[is.na(MasVnrArea), MasVnrArea := 0]
  test_dt[is.na(MasVnrArea), MasVnrArea := 0]
  # and MasVnrType
  train_dt[is.na(MasVnrType), MasVnrType := "None"]
  test_dt[is.na(MasVnrType), MasVnrType := "None"]
  # and SaleType
  train_dt[is.na(SaleType), SaleType := "?"]
  test_dt[is.na(SaleType), SaleType := "?"]
  # and Exterior1st
  train_dt[is.na(Exterior1st), Exterior1st := "?"]
  test_dt[is.na(Exterior1st), Exterior1st := "?"]
  # and Exterior2nd
  train_dt[is.na(Exterior2nd), Exterior2nd := "?"]
  test_dt[is.na(Exterior2nd), Exterior2nd := "?"]
  # and KitchenQual
  train_dt[is.na(KitchenQual), KitchenQual := "?"]
  test_dt[is.na(KitchenQual), KitchenQual := "?"]
  # Drop PoolQC
  train_dt[, PoolQC := NULL]
  test_dt[, PoolQC := NULL]
  # Drop FireplaceQu
  train_dt[, FireplaceQu := NULL]
  test_dt[, FireplaceQu := NULL]

# Train a model --------------------------------------------------------------------------
  # Train the model
  model_trained = rand_forest(mode = "regression", mtry = 12, trees = 10000) %>%
    set_engine("ranger", seed = 12345, num.threads = 10) %>%
    fit_xy(
      y = train_dt[,SalePrice],
      x = train_dt[,-c("Id", "SalePrice")] %>%
        select(MSSubClass:Foundation, KitchenQual, PoolArea:SaleCondition)
    )
  # Predict onto testing data
  new_predictions = predict(
    model_trained,
    new_data = test_dt
  )
  # Data to submit
# NOTE: Names and capitalization matter
  to_submit = data.frame(
    Id = test_dt$Id,
    SalePrice = new_predictions$.pred
  )
  # File to submit
  write_csv(
    x = to_submit,
    path = here("data", "to-submit-001.csv")
  )

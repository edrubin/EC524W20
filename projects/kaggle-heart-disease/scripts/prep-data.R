
# Notes ----------------------------------------------------------------------------------
#   Goal: Prep data for in-class competition
#   Source: https://archive.ics.uci.edu/ml/datasets/Heart+Disease

# Setup ----------------------------------------------------------------------------------
  # Packages
  library(pacman)
  p_load(tidyverse, data.table, magrittr, here)

# Load and process original data ---------------------------------------------------------
  # Load data
  full_dt = here("data", "heart-full.csv") %>% fread(na.strings = c("NA", "?", ""))
  # Change names
  setnames(
    full_dt,
    c(
      "age", "sex", "chest_pain", "resting_bp", "cholestoral",
      "high_sugar", "ecg", "max_rate", "exercise_angina", "st_depression", "slope",
      "vessels", "thalium_scan", "heart_disease"
    )
  )
  # Convert heart_disease to binary
  full_dt[, heart_disease := 1 * (heart_disease > 0)]
  # Add 'id'
  full_dt[, id := 1:.N]
  # Put 'id' first
  setcolorder(full_dt, c(15, 1:14))

# Sample data: Training and testing subsets ----------------------------------------------
  # Set seed
  set.seed(123)
  # Sample
  i_test = sample.int(nrow(full_dt), size = 75, replace = F)
  i_train = setdiff(1:nrow(full_dt), i_test)
  # Create training and testing datasets
  train_dt = full_dt[i_train]
  test_dt = full_dt[i_test]

# Save data ------------------------------------------------------------------------------
  # Save training data
  write_csv(
    x = train_dt,
    path = here("data", "train.csv")
  )
  # Save test data (for submissions)
  write_csv(
    x = test_dt[, 1:14],
    path = here("data", "test.csv")
  )
  # Save solutions
  write_csv(
    x = test_dt[, c(1,15)],
    path = here("data", "test-solution.csv")
  )
  # Save example solution file
  write_csv(
    x = test_dt[, .(id, heart_disease = rep(0:1))],
    path = here("data", "test-example.csv")
  )

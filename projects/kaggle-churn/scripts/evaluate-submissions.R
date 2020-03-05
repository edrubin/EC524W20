
# Notes ----------------------------------------------------------------------------------
#   Goal: Evaluate submissions from in-class classification exercise
#   Source: https://www.kaggle.com/blastchar/telco-customer-churn

# Setup ----------------------------------------------------------------------------------
  # Packages
  library(pacman)
  p_load(tidyverse, janitor, data.table, magrittr, here)

# Load test data -------------------------------------------------------------------------
  # Load data
  test_dt = here("data", "test-solution.csv") %>%
    fread() %>%
    clean_names() %>%
    select(id = contains("id"), truth = contains("churn"))

# Load submissions -----------------------------------------------------------------------
  # Find all files
  files_submitted = here("data", "submissions") %>% dir(full.names = T)
  # Load and evaluate files
  results_dt = lapply(X = files_submitted, FUN = function(f) {
    # Load data and select variables
    f_dt = f %>%
      read_csv() %>%
      clean_names() %>%
      select(id = contains("id"), pred = contains("churn")) %T>%
      setDT()
    # Fix '1/0'
    if (class(f_dt$pred) %in% c("numeric", "integer")) {
      f_dt[, pred := if_else(pred == 1, "Yes", "No")]
    }
    # Make sure capitalization is correct in submission
    f_dt[, pred := pred %>% str_to_title]
    # Join truth to prediction by 'id'
    f_dt %<>% merge(test_dt, by = "id")
    # Add 'correct'
    f_dt[, correct := pred == truth]
    # Precision
    f_precision = f_dt[pred == "Yes", mean(correct)]
    # Recall
    f_recall = f_dt[truth == "Yes", mean(correct)]
    # Return results with accuracy and F1 score
    data.table(
      submission = f %>% str_extract("(?<=submissions/)[A-z].*(?=\\.csv)"),
      accuracy = f_dt[,mean(correct)],
      precision = f_precision,
      recall = f_recall,
      f1 = 2 * f_precision * f_recall / (f_precision + f_recall)
    )
  }) %>% rbindlist()
  # Save results
  write_csv(
    x = results_dt,
    path = here("data", "submission-results.csv")
  )

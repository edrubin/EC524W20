# Data

These data come from the [Kaggle dataset *Telco Customer Churn*](https://www.kaggle.com/blastchar/telco-customer-churn).

The dataset that we will use to train has one outcome—`Churn`, a binary indicator for whether the customer left the company—and 20 predictors on 5,987 observations.

## Outcome

The outcome `Churn` takes on either a `"Yes"` (the customer left the company) or `"No"` (the customer remained with the company).

## Features

The features (according to the original documentation)

- `CustomerID` (`chr`): the customer's ID (*e.g.*, 7590-VHVEG)
- `Gender` (`chr`): the customer's gender (Female, Male)
- `SeniorCitizen` (`int`): whether the customer is a senior citizen (1, 0)
- `Partner` (`chr`): whether the cusomter has a partner (Yes, No)
- `Dependents` (`chr`): whether the cusomter has any dependents (Yes, No)
- `Tenure` (`int`): number of months the customer has been with the company
- `PhoneService` (`chr`): Does the customer have phone service? (Yes, No)
- `MultipleLines` (`chr`): Doe the customer have multiple phone lines? (Yes, No, No phone service)
- `InternetService` (`chr`) Customer’s internet service provider (DSL, Fiber optic, No)
- `OnlineSecurity` (`chr`) Does the customer have online security? (Yes, No, No internet service)
- `OnlineBackup` (`chr`) Does the customer have online backup? (Yes, No, No internet service)
- `DeviceProtection` (`chr`) Does the customer have device protection? (Yes, No, No internet service)
- `TechSupport` (`chr`) Does the customer have technical support? (Yes, No, No internet service)
- `StreamingTV` (`chr`) Does the customer have TV streaming? (Yes, No, No internet service)
- `StreamingMovies` (`chr`) Does the customer have movie streaming? (Yes, No, No internet service)
- `Contract` (`chr`) What are the terms of the contract? (Month-to-month, One year, Two year)
- `PaperlessBilling` (`chr`) Does the customer have paperless billing? (Yes, No)
- `PaymentMethod` (`chr`) he customer’s payment method (Electronic check, Mailed check, Bank transfer (automatic), Credit card (automatic))
- `MonthlyCharges` (`dbl`) The amount charged to the customer monthly
- `TotalCharges` (`dbl`) The total amount charged to the customer
- `Churn` (`chr`) (Yes, No)

## Note: Life decisions

Clearly you can just download the dataset from its original repository and make perfect predictions. This strategy is cheating.

# Classification

Today we're going to review what we've learned about classification methods—ranging from linear probability models to logistic regression (including elasticnet) to decision trees to ensemble methods.

More specifically: We are going to predict "customer churn", which is industry-speak for *whether customers leave a company* (think: leaving Netflix for DisneyPlus).

**Purpose** We have three main goals with this project.

- **Review** what you have learned about classification (and data cleaning).
- Continue to build your **R skills**.
- **Win** the competition and get a sweet prize.

## Steps

(Similar to our last in-class competition—but less work)

0. Form a small group (1 or 2 people).
1. Read about [the competition](https://www.kaggle.com/t/6b275809d36248e49d11bea483394c42).
2. [Download the data](https://www.kaggle.com/c/ec524-in-class-classification-competition/data) (Search the page for "Download All").
3. Load data into R. The competition's [website describes variables](https://www.kaggle.com/c/ec524-in-class-classification-competition/data).
4. Clean and process the data as needed. Make sure you process the training and testing data in the same way.
5. Fit at least three models that each use different algorithms—_e.g._, least-squares regression, KNN, subset-selection-based regression, lasso, ridge, elasticnet, logistic regression, decision trees, random forests, bagged trees, boosted trees...
   - Make sure you've processed the data in a way that makes sense for your method.
   - Use cross validation to train your models' key parameters.
6. Use your trained models to create a prediction for `Churn` in the testing data. Your prediction should be `"Yes"` (the customer *churned*) or `"No"` (the customer is still with the company). *Note:* You may need to transform this outcome to `1` and `0` for certain methods.
7. [Submit each model's predictions to the competition on Kaggle](https://www.kaggle.com/c/ec524-in-class-classification-competition/submit).
   - *Note:* Your submission should be a CSV with two columns: (1) `CustomerID` column and (2) `Churn` (your prediction).
   - *Hint:* You can see an example submission file (1) on Kaggle and (2) in the files you downloaded to get the training and testing data.

**Each group** should make at least three submissions.

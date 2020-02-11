# Classification

Today we're going to try to turn our attention to classification problems. Specifically, we are going to predict whether patients have heart disease, based upon a set of health-related features.

**Purpose** We have three main goals with this project.

- **Review the methods** that we have already covered.
- **Start thinking about classification**—how it differs from (and is similar to) from regression settings.
- Continue to hone your data prep and analysis **skills in R**.

## Steps

0. Form a small group (1 or 2 people).
1. Read about [the competition](https://www.kaggle.com/c/ec524-heart-disease/)
2. [Download the data](https://www.kaggle.com/c/ec524-heart-disease/data) (Search the page for "Download All")
3. Load data into R. The competition's [website describes variables](https://www.kaggle.com/c/ec524-heart-disease/data)
4. Clean and process the data as needed. Make sure you process the training and testing data in the same way.
5. Fit at least three models that each use different algorithms—_e.g._, least-squares regression, KNN, subset-selection-based regression, lasso, ridge, elasticnet.
   - Make sure you've processed the data in a way that makes sense for your method.
   - Use cross validation to train your models' key parameters.
6. Use your trained models to create a prediction for `heart_disease` in the testing data. Your prediction should be `1` (heart disease) or `0` (no heart disease). You may need to `round()`.
7. [Submit each model's predictions to the competition on Kaggle](https://www.kaggle.com/c/ec524-heart-disease/submit).
   - *Note:* Your submission should be a CSV with only an `id` column and a `heart_disease` column that has your predicted binary variable for the presence of heart disease.
   - *Hint:* You can see an example submission file (1) on Kaggle and (2) in the files you downloaded to get the training and testing data.
8. Create a fourth model that uses the results from the other three models to "vote" on the outcome. Submit this one too.

## To turn in

9. How did you do? Report your (1) TeamName, (2) Ranks (#), and (3) Scores.
10. What seems to be working? What wasn't working?
11. Write a one-paragraph description of your data-processing methods.
12. Write a one-paragraph description of your cross validation and prediction methods.
13. How does classification differ from what we've covered so far?

**Each person** should submit (electronically on Canvas) a short write up with answers to questions 9–13 (above).

Even if you worked in a group, I want you to write your **individual reflections** (questions 9–13). Don't be lazy. Don't copy other people's work.

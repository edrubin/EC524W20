# EC 524/424 final exam

## Instructions

**Timing** You have from Monday (16 March 2020) morning at 8 AM (PST) until Wednesday (18 March 2020) night at 11:59 PM (PST) to complete this exam. **We will not accept late exams.**

**Submission** You must submit your answers through [Canvas](https://canvas.uoregon.edu/) in some sort of typed document—_e.g._, a PDF from RMarkdown, an .ipynb notebook, or a Word document.

**Resources** You may use any resources from this class, books, or online sources. You cannot speak to your classmates or anyone else about the exam until Thursday morning.

However, the point of this exam was *supposed* to emulate an interview setting. Thus, it may be helpful for you to see how well you can answer the questions *before* opening other resources.

**Cheating** If we suspect you of cheating, you will receive an F for this entire course. Your answers **must be your own words.**

- *Cheating* includes sharing your answers with other people.
- *Cheating* also includes copying text from books, slides, and websites.

## Section 1: Short-answer, conceptual questions

**Section instructions:** Each question's answer should not exceed one paragraph (at most: 5 sentences). Your answers should be succinct, which may require you to briefly edit your first attempts. Bulleted answers (lists with bullet points) are fine, but you should still use full sentences.

**Q01–Q02** Imagine your boss is an economist who knows nothing about machine learning or any of the related tools. Your boss thinks prediction and inference are the same thing, and prediction should just be done with OLS-based regression.

**Q01.** Explain the challenges unique to prediction (not found in causal inference).

**Q02.** Explain why standard linear (OLS) regression may not always be the best tool for prediction.

**Q03.** How does cross validation differ from the validation-set approach? What are the strengths and weaknesses of each approach?

**Q04.** In a binary-classification setting, explain why an error in predicting one class (1) may or (2) may not be the same as an error classifying the second class. Provide examples.

**Q05.** Define the *null classifier*. In particular, explain why it tells us something about a classifier's performance.

**Q06.** What is the bias-variance tradeoff?

**Q07.** Define, compare, and contrast *precision* and *recall*.

**Q08.** Imagine you have three models—elastic net, ridge regression, and the lasso. Which of the models implicitly perform variable selection?

**Q09.** Why is cross validation important?

**Q10.** How do the L1 and L2 norms (cost functions) differ? Why is this difference meaningful?

**Q11.** Imagine you have a dataset with many variables, and each variable has many missing values. You've already split the data into training and testing samples. Describe what you would do to finish cleaning your data—_i.e._, how do you deal with the missing values?

**Q12.** Describe the key differences between random forests and boosted decision trees.

**Q13.** Explain how *entropy* and the *gini index* are more nuanced that *accuracy*.

**Q14.** For this problem, write your answer as though you are speaking to someone who has never taken a machine-learning course. Explain what the confusion matrix is—and walk me through each of its components.

**Q15.** Explain the differences between a training set, a validation set, and a testing set.

**Q16.** For prediction, why might someone prefer a logistic regression model to an ordinary least squares (OLS) linear regression model?

**Q17.** What are the advantages of expanding our predictor space with SVMs?

**Q18.** What is the single most important thing you learning in this course? Explain why you think it is the most important concept of the course.

**Q19.** What is your favorite machine-learning algorithm? Why?

**Q20.** Describe your experience, understanding, and expertise in machine learning.

## Section 2: Case studies

**Section instructions:** Answer each prompt with at most two paragraphs (10 sentences). We will not read longer answers.

**Q21.** Imagine you are working as a consultant. Your new job is to write an algorithm that determines whether the government should take a suspected criminal to trial. You have data on historical case outcomes: the verdict (the outcome of the case), the judge, the location, the type of crime, attributes of the defendant, attributes of the victim, the strength of the evidence (categorical), and whether the trial used a jury.

Describe how you would approach this prediction problem. Your answer should include:

- Which algorithm you would use and why?
- How would you test your model's success?

**Q22.** In 5 sentences are less, answer: Are false positives and false negatives here equally bad? If not, how might you take this difference into account when training your algorithm in **Q21**?

**Q23.** In 5 sentences or fewer, comment on the potential ethical and empirical challenges to using an algorithm in **Q21**'s setting.

**Q24.** New scenario: You work for a "startup" that buys stuff using Craigslist ads and sells it on eBay. You have data on millions of eBay transactions: the price, the number of bids, the date of the auction, the type of item, age, condition, color, _etc._ Explain how you would go about predicting the potential profit you could make on eBay from listings on Craigslist.

**Q25.** In 5 sentences or less: Explain important shortcomings (or key assumptions) of your methods in **Q24**.

## Section 3: R programming test

**Section instructions:** Submit R code that successfully answers the following question.

**Q26.** Write a custom function that takes five numeric arguments (_e.g._, `a`, `b`, `c`, `d`, `e`) and returns a vector whose values are the sums of each possible 2-element combination (_e.g._, `a+b`, `a+c`, `a+d`, `a+e`, `b+c` and so on). Elements cannot be repeated.

*Hint:* There are 10 unique two-element combinations of 5 arguments (because `b+c` is the same as `c+b`).

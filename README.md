# EC 524, Winter 2020

Welcome to Economics 524 (424): Prediction and machine-learning in econometrics, taught by [Ed Rubin](https://edrub.in).

## Schedule

**Lecture** Tuesday and Thursday, 10:00am–11:50am, 105 Peterson Hall

**Lab** Friday, 12:00pm–12:50pm, 102 Peterson Hall

**Office hours**

- **Ed Rubin** (PLC 519): Thursday (2pm–3pm); Friday (1pm–2pm)
- **Connor Lennon** (PLC 430): Monday (1pm-2pm)

## Syllabus

[**Syllabus**](https://raw.githack.com/edrubin/EC524W20/master/syllabus/syllabus.pdf)

## Books

### Required books

- [Introduction to Statistical Learning](https://www-bcf.usc.edu/~gareth/ISL/)
- [The Hundred-Page Machine Learning Book](http://themlbook.com/)
- [Data Visualization](https://socviz.co/)

### Suggested books

- [R for Data Science](https://r4ds.had.co.nz/)
- [Introduction to Data Science](https://www.springer.com/us/book/9783319500164) (not available without purchase)
- [The Elements of Statistical Learning](http://web.stanford.edu/~hastie/ElemStatLearn/)

## Lecture notes

[**000 - Overview (Why predict?)**](https://raw.githack.com/edrubin/EC524W20/master/lecture/000/000-slides.html)

1. Why do we have a class on prediction?
2. How is prediction (and how are its tools) different from causal inference?
3. Motivating examples

**Formats** [.html](https://raw.githack.com/edrubin/EC524W20/master/lecture/000/000-slides.html) | [.pdf](https://raw.githack.com/edrubin/EC524W20/master/lecture/000/000-slides.pdf) | [.Rmd](https://raw.githack.com/edrubin/EC524W20/master/lecture/000/000-slides.Rmd)

[**001 - Statistical learning foundations**](https://raw.githack.com/edrubin/EC524W20/master/lecture/001/001-slides.html)

1. Why do we have a class on prediction?
2. How is prediction (and how are its tools) different from causal inference?
3. Motivating examples

**Formats** [.html](https://raw.githack.com/edrubin/EC524W20/master/lecture/001/001-slides.html) | [.pdf](https://raw.githack.com/edrubin/EC524W20/master/lecture/001/001-slides.pdf) | [.Rmd](https://raw.githack.com/edrubin/EC524W20/master/lecture/001/001-slides.Rmd)

[**002 - Model accuracy**](https://raw.githack.com/edrubin/EC524W20/master/lecture/002/002-slides.html)

1. Model accuracy
1. Loss for regression and classification
1. The variance bias-tradeoff
1. The Bayes classifier
1. KNN

**Formats** [.html](https://raw.githack.com/edrubin/EC524W20/master/lecture/002/002-slides.html) | [.pdf](https://raw.githack.com/edrubin/EC524W20/master/lecture/002/002-slides.pdf) | [.Rmd](https://raw.githack.com/edrubin/EC524W20/master/lecture/002/002-slides.Rmd)

[**003 - Resampling methods**](https://raw.githack.com/edrubin/EC524W20/master/lecture/003/003-slides.html)

1. Review
1. The validation-set approach
1. Leave-out-out cross validation
1. k-fold cross validation
1. The bootstrap

[*In-class:* Validation-set exercise (Kaggle)](https://www.kaggle.com/edwardarubin/ec524-lecture-003/)

**Formats** [.html](https://raw.githack.com/edrubin/EC524W20/master/lecture/003/003-slides.html) | [.pdf](https://raw.githack.com/edrubin/EC524W20/master/lecture/003/003-slides.pdf) | [.Rmd](https://raw.githack.com/edrubin/EC524W20/master/lecture/003/003-slides.Rmd)

[**004 - Linear regression strikes back**](https://raw.githack.com/edrubin/EC524W20/master/lecture/004/004-slides.html)

1. Returning to linear regression
1. Model performance and overfit
1. Model selection—best subset and stepwise
1. Selection criteria

**Formats** [.html](https://raw.githack.com/edrubin/EC524W20/master/lecture/004/004-slides.html) | [.pdf](https://raw.githack.com/edrubin/EC524W20/master/lecture/004/004-slides.pdf) | [.Rmd](https://raw.githack.com/edrubin/EC524W20/master/lecture/004/004-slides.Rmd)

[**005 - Shrinkage methods**](https://raw.githack.com/edrubin/EC524W20/master/lecture/005/005-slides.html)

1. Ridge regression
1. Lasso
1. Elasticnet

**Formats** [.html](https://raw.githack.com/edrubin/EC524W20/master/lecture/005/005-slides.html) | [.pdf](https://raw.githack.com/edrubin/EC524W20/master/lecture/005/005-slides.pdf) | [.Rmd](https://raw.githack.com/edrubin/EC524W20/master/lecture/005/005-slides.Rmd)

[**006 - Classification intro**](https://raw.githack.com/edrubin/EC524W20/master/lecture/006/006-slides.html)

1. Introduction to classification
1. Why not regression?
1. But also: Logistic regression
1. Assessment: Confusion matrix, assessment criteria, ROC, and AUC

**Formats** [.html](https://raw.githack.com/edrubin/EC524W20/master/lecture/006/006-slides.html) | [.pdf](https://raw.githack.com/edrubin/EC524W20/master/lecture/006/006-slides.pdf) | [.Rmd](https://raw.githack.com/edrubin/EC524W20/master/lecture/006/006-slides.Rmd)

## Projects

**Intro** [Predicting sales price in housing data (Kaggle)](https://github.com/edrubin/EC524W20/tree/master/projects/kaggle-house-prices)

**001** [KNN and loss (Kaggle notebook)](https://www.kaggle.com/edwardarubin/ec524-knn-loss)
<br>
You will need to sign into you Kaggle account and then hit "Copy and Edit" to add the notebook to your account.
<br>
*Due* 21 January 2020 before midnight.

**002** [Cross validation and linear regression (Kaggle notebook)](https://www.kaggle.com/edwardarubin/ec524-cross-validation)
<br>
*Due* 04 February 2020 before midnight.

**003** [Model selection and shrinkage (Kaggle notebook)](https://www.kaggle.com/edwardarubin/ec524-shrinkage/)
<br>
*Due* 13 February 2020 before midnight.

**004** [Predicting heart disease (Kaggle competition)](https://github.com/edrubin/EC524W20/tree/master/projects/kaggle-heart-disease)) | [Competition](https://www.kaggle.com/c/ec524-heart-disease/)

## Lab notes

[**000 - Workflow and cleaning**](https://raw.githack.com/edrubin/EC524W20/master/lab/000-cleaning/000-slides.html)

1. General "best practices" for coding
2. Working with RStudio
3. The pipe (`%>%`)

**Formats** [.html](https://raw.githack.com/edrubin/EC524W20/master/lab/000-cleaning/000-slides.html) | [.pdf](https://raw.githack.com/edrubin/EC524W20/master/lab/000-cleaning/000-slides.pdf) | [.Rmd](https://raw.githack.com/edrubin/EC524W20/master/lab/000-cleaning/000-slides.Rmd)

**001 - dplyr and Kaggle notebooks**

1. Finish [previous lab on `dplyr`](https://raw.githack.com/edrubin/EC524W20/master/lab/000-cleaning/000-slides.html#48)
2. [Working in (Kaggle) notebooks](https://www.kaggle.com/voodoojanus/ec524-jan-17-20)

[**002 - Cross validation and simulation**](https://raw.githack.com/edrubin/EC524W20/master/lab/002-resampling/002-slides.html)

1. Cross-validation review
1. CV and interdependence
1. Writing functions
1. Introduction to learning via simulation
1. Simulation: CV and dependence

**Formats** [.html](https://raw.githack.com/edrubin/EC524W20/master/lab/002-resampling/002-slides.html) | [.pdf](https://raw.githack.com/edrubin/EC524W20/master/lab/002-resampling/002-slides.pdf) | [.Rmd](https://raw.githack.com/edrubin/EC524W20/master/lab/002-resampling/002-slides.Rmd)

**Additional** [R script for simulation](https://raw.githack.com/edrubin/EC524W20/master/lab/002-resampling/cv-sim.R)

**003**

**004**

**005**

**Additional** [Data cleaning in R](https://www.kaggle.com/edwardarubin/ec524-clean-data/) (with `caret`)

- Converting numeric variables to categorical
- Converting categorical variables to dummies
- Imputing missing values
- Standardizing variables (centering and scaling)

## Additional resources

### R

- [RStudio's recommendations for learning R](https://education.rstudio.com/learn/), plus cheatsheets, books, and tutorials
- [YaRrr! The Pirate’s Guide to R](https://bookdown.org/ndphillips/YaRrr/) (free online)
- [UO library resources/workshops](http://uoregon.libcal.com/calendar/dataservices/?cid=11979&t=g&d=0000-00-00&cal=11979,11173)
- [Eugene R Users](https://www.meetup.com/meetup-group-cwPiAlnB/)

### Data Science

- [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/) by Jake VanderPlas
- [Elements of AI](https://course.elementsofai.com/)
- [Caltech professor Yaser Abu-Mostafa: Lectures about machine learning on YouTube](https://www.youtube.com/user/caltech/search?query=Yaser+Abu-Mostafa)
- From Google:
  - [Machine-learning crash course](https://developers.google.com/machine-learning/crash-course/ml-intro)
  - [Google Cloud training for data and machine learning](https://cloud.google.com/training/data-ml)
  - [General Google education platform](https://ai.google/education/)

### Spatial data

- [Geocomputation with R](https://geocompr.robinlovelace.net) (free online)
- [Spatial Data Science](https://keen-swartz-3146c4.netlify.com) (free online)
- [Applied Spatial Data Analysis with R](https://asdar-book.org)

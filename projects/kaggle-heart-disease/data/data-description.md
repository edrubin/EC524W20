# Data

These data come from the [UCI Machine-Learning Repository](https://archive.ics.uci.edu/ml/index.php) (specifically from the [heart-disease dataset](https://archive.ics.uci.edu/ml/datasets/Heart+Disease).

The dataset that we will use has one outcome—`heart_disease`, an indicator for whether heart disease was present in the patient—and 13 features (predictors) on 303 patients.

## Outcome

The outcome `heart_disease` takes on either a `1` (heart disease is present) or `0` (not present). This variable is actually recoded from a variable that spanned 0 to 4, but we're going to focus on this recoding of 0/1.

## Features

The features (according to the original documentation)

1. `age`
2. `sex`
3. `chest_pain`: type of chest pain
- Value of 1: typical angina
- Value of 2: atypical angina
- Value of 3: non-anginal pain
- Value of 4: asymptomatic
4. `resting_bp`: resting blood pressure
5. `cholestoral`: serum cholestoral in mg/dl
6. `high_sugar`: an indicator for whether fasting blood sugar > 120 mg/dl  (1 = true; 0 = false)
7. `ecg`: resting electrocardiographic results
  - Value of 0: normal
  - Value of 1: having ST-T wave abnormality (T wave inversions and/or ST elevation or depression of > 0.05 mV)
  - Value of 2: showing probable or definite left ventricular hypertrophy by Estes' criteria
8. `max_rate`: maximum heart rate achieved
9. `exercise_angina`: exercise induced angina (1 = yes; 0 = no)
10. `st_depression`: ST depression induced by exercise relative to rest
11. `slope`: the slope of the peak exercise ST segment
  - Value of 1: upsloping
  - Value of 2: flat
  - Value of 3: downsloping
12. `vessels`: number of major vessels (0–3) colored by flourosopy
13. `thalium_scan`: thalium heart scan
  - Value of 3: normal
  - Value of 6: fixed defect
  - Value of 7: reversable defect

If you're wondering what *angina* is, [here is a description](https://www.heart.org/en/health-topics/heart-attack/angina-chest-pain) from the American Heart Association.

## Note: Life decisions

Clearly you can just download the dataset from its original repository and make perfect predictions. That strategy is pointless (why are you here?), stupid (you're wasting everyone's time), and cheating.

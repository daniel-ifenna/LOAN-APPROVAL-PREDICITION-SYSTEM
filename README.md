# AUTHOR: DANIEL IFENNA
## DATE: 7TH MAY 2025
## PROJECT TITLE: LOAN APPROVAL PREDICTION SYSTEM
### INTRODUCTION
The task of this project was to create an ML algorithm to predict loan approval based on various factors.

## Key Steps:
1. Data Loading: Load dataset with features: income, credit score, loan amount, DTI ratio, employment status, and loan purpose.

2. Data Preprocessing:

Handle missing values.
Encode categorical variables (e.g., employment status).
Scale numerical features.
Select key factors impacting approval
3. Model Training:

Split data into train/test (80/20)
Train a Random Forest classifier
4. Model Evaluation: Evaluate using metrics

## About Data
This dataset contains information about loan applications, including various attributes of the applicants and the approval status of the loan request, such as Text, Income, Credit Score, Loan Amount, DTI ratio, and employment status. The dataset contained no missing values or duplicates.

## Encoding categorical variables
The Employment_Status variable was converted to have 1 and 0 represent "Employed and Unemployed", as well as the Approval variable having 1 to reprsent Approved and 0 representing Rejected.

## Visualizing the distribution of categorical Features (Approval and Employment_status
Approval Distribution

Count: 0: 20067 1: 3933 Approval Distribution
Employment_Status Distribution

Count: 0: 12007 1: 11993
Employement_Status Distribution

## Balancing the Dataset
The Approval feature exhibited significant class imbalance, which could compromise the performance accuracy of the machine learning algorithm. To address this issue, I applied Random Over-Sampling Examples (ROSE) to balance the dataset. Initially, the class distribution was heavily skewed, with 83.6% of instances belonging to class 0 and 16.4% to class 1. After implementing ROSE, the dataset became more balanced, with a revised distribution of 50.6% for class 0 and 49.4% for class 1. Balanced Data

## Building Model
The dataset was split into training and testing sets, excluding the Text feature variable. Prior to splitting and sampling, the numeric features underwent scaling to optimize performance for machine learning modeling. The model was built and used to predict the outcome of Predicted Approval in the Test data.

## Performance of Model Accuracy: 0.9533 (95%)
P-Value [Acc > NIR] : < 2.2e-16
Kappa: 0.9067 (90.67%)
Sensitivity: 0.9316 (93.16%)
Specificity: 0.9756 (97.56%) The model demonstrates high accuracy, sensitivity, and specificity, indicating strong performance in classifying both positive and negative classes.
Analysis
After balancing the classes, the classification Model achieved High performance metrics. The P-value is less than 0.05. The accuracy achieved is 95% The Kappa value is 90.67%, indicating strong agreement between predicted and actual classes

## Conculsion
This strong performance suggests the model is both highly accurate and reliable for predicting loan approvals

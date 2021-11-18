# Ironhack Mid-Bootcamp Project - Bank Case Study

## Table of Contents
- [Project Brief](#Project-Brief)
- [Goals](#Goals)
- [Process and Tools](#Process-and-Tools)
- [Results](#Results)
- [Next Steps](#Next-Steps)


## Project Brief

We are working as a risk analysts with a bank. Apart from the other banking and loan services, the bank also provides credit card services which are a very important source of revenue. The bank wants to understand the demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card.


## Goals

Our main goals for the project were as follows:

- Identify the demographics and charateristics which most influence whether a credit card offer is accepted or rejected.
- Create a model to predict which customers are likely to accept an offer.


## Process and Tools

### Trello

We used Trello to organise the project. We created epics and broke those down into stories which were then further broken into individual tasks to complete. To be able to follow the steps we took in the project follow this **link**.

### Github

The project was stored and updated via Github. This allowed us to easily share the project over multiple devices and sync changes.

### SQL

We accessed the data in SQL in order to perform some preliminary analysis - link.

### Tableau

We used Tableau for some exploratory analysis which can be found here - link. We also used it to create an interactive dashboard to display some findings of the analysis.

### Python

**Import:**

We then imported the data into Python to begin exploring the data. The link to the jupyter notebook can be found [here] - link.

**Cleaning:**

The next step was to clean the data. This included:
- normalising column names
- dropping unneccesary columns
- filling in nulls with average values
- changing data types (some numerical columns were better processed as objects)

**Exploratory Analysis:**

We then investigated the data further. This included:
- checking for multicolinearity with a heatmap
- performing a chi-squared analysis, the results of which are discussed below

**Modelling:**

The final stage was to model the data using various methods. We then evaluated the model using different metrics to assess how well it was able to predict offer acceptance.

## Results

### Chi-Squared and Tableau Analysis

Using a chi-squared analysis, we performed a hypothesis test on all of the variables to see if they influenced offer acceptance. (A p-value of less than 0.05 means we can reject the null hypothesis that the variable has no effect.) Combining this with some analysis in Tableau we were able to identify the features which most impact whether a credit card offer is accepted or rejected.

**Credit rating** (p-value 5.97e-97)
- Customers with a low credit rating are more likely to accept a credit card offer.

**Mailer type** (p-value 4.19e-39)
- Customers who recieve a postcard are more likley to accept an offer as opposed to those who recieve a letter.

**Income level** (p-value 1.46e-25)
- Customers with medium and high income levels are more likely to accept the credit card. Those with a high income level are unlikley to accept an offer.

**Reward** (p-value 7.10e-23)
- Customers who receive 'air miles' are the most likely to accept the offer, followed by those who recieved 'points' and finally those who recieve 'cash back' are the least likely to accept.

### Models

We decided to highlight two machine learning models as we think that each could serve a different purpose for the bank.

Both models have a limited ability to predict offer acceptance. They are very good at predicting which customers don't accept creditcard offers (true negatives). However they predict rather poorly which customers accept the offer (true postives). We offer some ways to improve the models in the Next Steps section below.

#### Model 1 - Logistic Regression (using Smote and Tomek Links for sampling)
This model achieves an accuracy of 76%. It is relatively effective at identifying customers who will accept a credit card offer (true positives). However, it has a high false positive rate. This means that we will target more customers incorrectly, but overall reach more customers who will accept the credit card offer.

We think that this model is best used for low cost initiatives. If there is not a high cost associated with targeting customers identified with the model, then we can reach the most customers who are likely to accept a credit card with this model.

<img width="400" alt="Logistic Regression" src="https://user-images.githubusercontent.com/89530964/142390735-aadc0823-e892-458e-8be9-5b003fcda58b.png">

#### Model 2 - Random Forest (using Smote and Tomek Links for sampling)
Model 2 achieves an accuracy of 85%. It is less effective than the first model at identifying customers who will accept a credit card offer (true positives). However, it has a lower false positive rate. That means that we will target fewer customers incorrectly, but overall reach fewer customers who would accept the offer.

This model is therefore best for higher cost initiatives. If the bank wanted to target fewer customers but still be sure to target some who are likely to accept the offer, this model would be more effective.

<img width="400" alt="Random Forest" src="https://user-images.githubusercontent.com/89530964/142390590-a1139fd7-a8e6-4c8b-b3b5-073decf029f2.png">

## Next Steps

To further progress this study it would be useful to collect more information on customers...

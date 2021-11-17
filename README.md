# Ironhack Mid-Bootcamp Project - Bank Case Study

## Table of Contents
- [Project Brief](#Project-Brief)
- [Goals](#Goals)
- [Process & Tools](#Process-&-Tools)
- [Results](#Results)
- [Next Steps](#Next-Steps)


## Project Brief

We are working as a risk analysts with a bank. Apart from the other banking and loan services, the bank also provides credit card services which are a very important source of revenue. The bank wants to understand the demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card.

Usually, the observational data for these kinds of problems is somewhat limited in that often the company sees only those who respond to an offer. To get around this, the bank designs a focused marketing study, with 18,000 current bank customers. This focused approach allows the bank to know who does and does not respond to the offer, and to use existing demographic data that is already available on each customer.


## Goals

Our main goals for the project are as follows:

- Identify the demographics and charateristics which most influece creditcard offer acceptance.
- Create a model to predict which customers are likely to accept an offer.


## Process & Tools

### Github

The project was stored and updated via github.

### SQL

We accessed the data in SQL in order to perform some preliminary analysis - link.

### Tableau

We used Tableau for some exploratory analysis which can be found - link. We also used it to create an interactive dashboard to display some findings of the analysis.

### Python

**Import:**

We then imported the data into python to begin exploratory analysis. The link to the jupyter notebook can be found [here] - link.

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

Using a chi-squared analysis, we were able to perform a hypothesis test on all of the variables against offer acceptance. The features shown below are those which we can say for sure do not have an insignificant impact on offer acceptance. Combining this with some analysis in Tableau, we can see the direction of this impact on offer acceptance.

**Credit rating** (p-value 5.97e-97)
- customers with a low credit rating should be more likely to accept a credit card offer.

**Mailer type** (p-value 4.19e-39)
- customers who recieve a postcard are significantly more likley to accept an offer as opposed to those who recieve a letter.

**Income level** (p-value 1.46e-25)
- customers with medium and high income levels are more likely to accept. Those with a high income level and unlikley to accept an offer.

**Reward** (p-value 7.10e-23)
- customers who receive 'air miles' are the most likely to accept a credit card offer followed by 'points' and finally those who recieve 'cash back' are the least likely to accept

**Household size** (p-value 0.00046)
- households with only 1 person are more likley to accept a credit card offer.

### Models

After designing several iterations of the models

## Next Steps

The obvious next step would be to re-run the model having done some sampling techniques. If we were to over or under sample from the original data to even out the number of 'good' and 'bad' customers that the model recieves, we may be able to get fewer false negatives.

Having access to more data on the customers of the bank would also lead to a more accurate model.

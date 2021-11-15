# Ironhack Mid-Bootcamp Project - Bank Case Study

## Table of Contents
- [Project Brief](#Project-Brief)
- [Defining the Problem](#Defining-the-Problem)
- [Process & Tools](#Process-&-Tools)
- [Visualizations](#Visualizations)
- [Key Take Aways](#Key-Take-Aways)
- [Next Steps](#Next-Steps)


## Project Brief

We are working as a risk analysts with a bank. Apart from the other banking and loan services, the bank also provides credit card services which are a very important source of revenue. The bank wants to understand the demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card.

Usually, the observational data for these kinds of problems is somewhat limited in that often the company sees only those who respond to an offer. To get around this, the bank designs a focused marketing study, with 18,000 current bank customers. This focused approach allows the bank to know who does and does not respond to the offer, and to use existing demographic data that is already available on each customer.


## Defining the Problem

In order to tackle this issue, we had come up with a way of defining 'good' and 'bad' customers. We decided to define this using the 'Status' column within the data.

'Good' customers would have statuses of A: 'contract finished, no problems' or C: 'running contract, OK so far'. 

'Bad' customers would be have statuses of B: 'contract finished, loan not payed' or D: 'running contract, client in debt'.


## Process & Tools

### Github

The project was stored and updated via github.

### SQL

We started by accessing the bank data in SQL by running a [script](https://github.com/zachighton/example_layout/blob/main/SQL%20Files/bank_sql_dump_script.sql). Then wrote a [query](https://github.com/zachighton/example_layout/blob/main/SQL%20Files/bank_sql_query.sql) to access the relevant features which we would then use for the analysis.

### Python

**Import:**

We then imported the data into python to begin exploratory analysis. The link to the jupyter notebook can be found [here](https://github.com/zachighton/example_layout/blob/main/Juptyer%20Files/log_regression_bank.ipynb).

**Cleaning:**

The next step was to clean the data. This included:
- simplifying and combining columns
- correcting for typos
- filling in blanks with 'unknown'
- removing null values
- changing data types (some numerical data was better processed as objects)

**Normalisation:**

Once this was complete, we moved on to normalising the data so that it could be better processed by the model.

**Modelling:**

The final stage was to model the data using logistic regression. We then evaluated the model using various metrics to assess how well it was able to categorise customers.

## Visualizations

<img width="400" alt="Screenshot 2021-11-10 at 17 07 19" src="https://user-images.githubusercontent.com/89530964/141149155-d1e85682-f494-4696-aa82-d7e9dd15cd95.png">


<img width="400" alt="Screenshot 2021-11-10 at 17 06 34" src="https://user-images.githubusercontent.com/89530964/141149037-2a2d5e27-bcd7-4e48-8f4b-750ebdbf0d50.png">


The above images show a confusion matrix and AUC plot for the regression model we performed on the data. We discuss their implications below.

## Key Take Aways

With the data we currently have access to, we were  not able to accurately predict whether customers were 'good' or 'bad' for the bank.

Using the accuracy_score metric from sklearn, the model achieved a score of 88%. This appears to be a good result. However, when we look at the confusion matrix, we can see that although the model is good at predicting 'good' customers, it also often misassigns 'bad' customers as 'good' customers (a false positive).

This is reflected in the AUC score of 73%, which although not a very bad score, shows that there is room for improvement.

The issue here appears to be that since there are many more 'good' customers at the bank than 'bad' customers, the model is over prioritising that group.

## Next Steps

The obvious next step would be to re-run the model having done some sampling techniques. If we were to over or under sample from the original data to even out the number of 'good' and 'bad' customers that the model recieves, we may be able to get fewer false negatives.

Having access to more data on the customers of the bank would also lead to a more accurate model.

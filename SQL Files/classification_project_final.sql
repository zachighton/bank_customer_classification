#1. Create a database called credit_card_classification.
CREATE DATABASE IF NOT EXISTS  `credit_card_classification`;
USE credit_card_classification;

#2. Create a table credit_card_data with the same columns as given in the csv file. 
#Please make sure you use the correct data types for each of the columns.

DROP TABLE credit_card_data;
CREATE TABLE IF NOT EXISTS `credit_card_data` (
    Customer_Number INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Offer_Accepted VARCHAR(4),
    Reward VARCHAR(20),
    Mailer_Type VARCHAR(20),
    Income_Level VARCHAR(20),
    Bank_Accounts_Open INTEGER,
    Overdraft_Protection VARCHAR(20),
    Credit_Rating VARCHAR(20),
    No_Credit_Cards_Held INTEGER,
    No_Homes_Owned INTEGER,
    Household_Size INTEGER,
    Home_Owner VARCHAR(10),
    Average_Balance FLOAT,
    Q1_Balance FLOAT,
    Q2_Balance FLOAT,
    Q3_Balance FLOAT,
    Q4_Balance FLOAT);
 
 #3. Import data from CSV 
 -- Used the table import wizard for this operation 
 
 #4. Select all the data from table credit_card_data to check if the data was imported correctly.
SELECT 
    *
FROM
    credit_card_data;
 
 #5. Use the alter table command to drop the column q4_balance from the database, 
 -- as we would not use it in the analysis with SQL. 
 -- Select all the data from the table to verify if the command worked. Limit your returned results to 10.

ALTER TABLE `credit_card_data` DROP `Q4_Balance`;

SELECT 
    *
FROM
    credit_card_data
LIMIT 10;


#6. Use sql query to find how many rows of data you have.
SELECT 
    COUNT(customer_Number) AS no_of_rows
FROM
    credit_card_data;

#7. Now we will try to find the unique values in some of the categorical columns:
-- What are the unique values in the column Offer_accepted?

SELECT DISTINCT
    (Offer_accepted)
FROM
    credit_card_data;

-- What are the unique values in the column Reward?
SELECT DISTINCT
    (Reward)
FROM
    credit_card_data; 

-- What are the unique values in the column mailer_type?
SELECT DISTINCT
    (Mailer_Type)
FROM
    credit_card_data;

-- What are the unique values in the column credit_cards_held?
SELECT DISTINCT
    (No_Credit_Cards_Held)
FROM
    credit_card_data;

-- What are the unique values in the column household_size?
 SELECT DISTINCT
    (Household_Size)
FROM
    credit_card_data;
 
 #8. Arrange the data in a decreasing order by the average_balance of the house. 
 -- Return only the customer_number of the top 10 customers with the highest average_balances in your data.
 
SELECT 
    Customer_number
FROM
    credit_card_data
ORDER BY Average_Balance DESC
LIMIT 10;
 
 
 #9. What is the average balance of all the customers in your data?
SELECT 
    ROUND(AVG(Average_Balance), 2) AS Total_Avg_balance
FROM
    credit_card_data;
 
 #10. In this exercise we will use simple group by to check the properties of some of the categorical variables in our data. 
# Note wherever average_balance is asked, please take the average of the column average_balance:
-- What is the average balance of the customers grouped by Income Level? 
  #The returned result should have only two columns, 
   #income level and Average balance of the customers. 
   #Use an alias to change the name of the second column.

SELECT 
    Income_Level, ROUND(AVG(Average_Balance), 2) AS Avg_Balance
FROM
    credit_card_data
GROUP BY Income_Level;
   
   
-- What is the average balance of the customers grouped by number_of_bank_accounts_open?
   #The returned result should have only two columns, 
   #number_of_bank_accounts_open and Average balance of the customers. 
   #Use an alias to change the name of the second column.
   
SELECT 
    Bank_Accounts_Open,
    ROUND(AVG(Average_Balance), 2) AS Avg_Balance
FROM
    credit_card_data
GROUP BY Bank_Accounts_Open;


-- What is the average number of credit cards held by customers for each of the credit card ratings? 
   #The returned result should have only two columns, rating and average number of credit cards held. 
   #Use an alias to change the name of the second column.
   
SELECT 
    Credit_Rating AS Rating,
    ROUND(AVG(No_Credit_Cards_Held), 2) AS avg_no_cc_held
FROM
    credit_card_data
GROUP BY Credit_Rating;

-- Is there any correlation between the columns credit_cards_held and number_of_bank_accounts_open? 
   #You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column.
 
 SELECT 
    No_Credit_Cards_Held, COUNT(Bank_Accounts_Open)
FROM
    credit_card_data
GROUP BY No_Credit_Cards_Held
ORDER BY COUNT(Bank_Accounts_Open);
   
-- Visually check if there is a positive correlation 
#or negative correlation or no correlation between the variables.
 
SELECT 
    No_Credit_Cards_Held, COUNT(Bank_Accounts_Open)
FROM
    credit_card_data
GROUP BY No_Credit_Cards_Held
ORDER BY COUNT(Bank_Accounts_Open);
 
 #There is some level of negative correlation between the 2 vairables 
 
 
#11. Your managers are only interested in the customers with the following properties:
-- Credit rating medium or high
-- Credit cards held 2 or less
-- Owns their own home
-- Household size 3 or more
# For the rest of the things, they are not too concerned. 
# Write a simple query to find what are the options available for them? 
# Can you filter the customers who accepted the offers here?

SELECT 
    Customer_Number,
    Credit_Rating,
    No_credit_Cards_Held AS No_Of_Cards,
    Home_Owner AS HomeOwner,
    Offer_Accepted,
    Household_Size
FROM
    credit_card_data
WHERE
    Credit_Rating IN ('medium' , 'high')
        AND (No_Credit_Cards_Held <= 2)
        AND (Home_Owner = 'Yes')
        AND (Household_Size >= 3)
        AND (Offer_Accepted = 'Yes');

#12. Your managers want to find out the list of customers whose average balance is less than 
-- the average balance of all the customers in the database. 
-- Write a query to show them the list of such customers. 
-- You might need to use a subquery for this problem. 

SELECT 
    Customer_Number, Average_Balance
FROM
    credit_card_data
WHERE
    Average_Balance < (SELECT 
            AVG(Average_Balance)
        FROM
            credit_card_data);


#13. Since this is something that the senior management is regularly interested in, create a view of the same query.

CREATE VIEW Less_than_Avg_Bal AS
    SELECT 
        Customer_Number, Average_Balance
    FROM
        credit_card_data
    WHERE
        Average_Balance < (SELECT 
                AVG(Average_Balance)
            FROM
                credit_card_data);

#14. What is the number of people who accepted the offer vs number of people who did not?

SELECT 
    Offer_Accepted, COUNT(Offer_Accepted) AS No_Clients
FROM
    credit_card_data
GROUP BY Offer_Accepted;

#15. Your managers are more interested in customers with a credit rating of high or medium. 
-- What is the difference in average balances of the customers with high credit card rating and low credit card rating?
SELECT 
    Credit_Rating, ROUND(AVG(Average_Balance), 2) as Avg_Balance
FROM
    credit_card_data
WHERE
    Credit_Rating IN ('low' , 'high')
GROUP BY Credit_Rating;


#16. In the database, which all types of communication (mailer_type) were used and with how many customers?
SELECT DISTINCT
    (Mailer_Type) AS Mailer_Type,
    COUNT(Customer_Number) AS No_Of_Clients
FROM
    credit_card_data
GROUP BY Mailer_Type;


#17. Provide the details of the customer that is the 11th least Q1_balance in your database.
SELECT * FROM credit_card_data
WHERE Customer_Number = 
(SELECT Customer_Number FROM
(SELECT *, ROW_NUMBER() OVER (ORDER BY Q1_Balance ASC) AS rownumber
FROM credit_card_data
ORDER BY Q1_Balance)s1
WHERE rownumber = 11);


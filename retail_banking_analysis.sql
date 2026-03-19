--Which profession brings most customers
SELECT job , COUNT(*) AS total_customers
FROM `retail-banking-490411.retail_banking_dataset.banking_table`
GROUP BY job
ORDER BY total_customers DESC


--Loan Vs Subscription
SELECT loan, y AS subscribed, COUNT(*) AS total
FROM `retail-banking-490411.retail_banking_dataset.banking_table`
GROUP BY loan, y
ORDER BY total DESC


--Contacts needed per conversion
SELECT campaign, COUNT(*) AS total_customers
FROM `retail-banking-490411.retail_banking_dataset.banking_table`
GROUP BY campaign
ORDER BY campaign;


--Subscription rate
SELECT 
  COUNTIF(y = 'yes') * 100.0 / COUNT(*) AS subscription_rate
FROM `retail-banking-490411.retail_banking_dataset.banking_table`


--Which segment converts best
SELECT education,
       COUNTIF(y = 'yes') AS subscribed,
       COUNT(*) AS total,
       COUNTIF(y = 'yes') * 100.0 / COUNT(*) AS conversion_rate
FROM `retail-banking-490411.retail_banking_dataset.banking_table`
GROUP BY education
ORDER BY conversion_rate DESC


--Age group analysis
SELECT 
  CASE 
    WHEN age < 30 THEN 'Young'
    WHEN age BETWEEN 30 AND 50 THEN 'Middle'
    ELSE 'Senior'
  END AS age_group,
  COUNTIF(y = 'yes') AS subscribed,
  COUNT(*) AS total
FROM `retail-banking-490411.retail_banking_dataset.banking_table`
GROUP BY age_group
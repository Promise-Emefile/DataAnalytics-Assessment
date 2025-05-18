select * from users_customuser;
select * from savings_savingsaccount;
select * from plans_plan;


SELECT u.id, u.first_name, u.last_name,
       COUNT(s.id) / COUNT(DISTINCT DATE_FORMAT(s.transaction_date, '%Y-%m')) AS avg_transactions_per_month,
       CASE 
           WHEN COUNT(s.id) / COUNT(DISTINCT DATE_FORMAT(s.transaction_date, '%Y-%m')) >= 10 THEN 'High Frequency'
           WHEN COUNT(s.id) / COUNT(DISTINCT DATE_FORMAT(s.transaction_date, '%Y-%m')) BETWEEN 3 AND 9 THEN 'Medium Frequency'
           ELSE 'Low Frequency'
       END AS transaction_category
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
WHERE s.transaction_date IS NOT NULL
GROUP BY u.id, u.first_name, u.last_name
ORDER BY avg_transactions_per_month DESC;

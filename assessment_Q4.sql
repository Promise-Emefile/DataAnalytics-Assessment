select * from plans_plan;
select * from savings_savingsaccount;
select * from users_customuser;



SELECT u.id, concat( first_name,' ',last_name) as name,
       TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS account_tenure_months,
       COUNT(s.id) AS total_transactions,
       ROUND((COUNT(s.id) / TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE())) * 12 * 0.001 * SUM(s.confirmed_amount), 2) AS estimated_clv
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
WHERE u.date_joined IS NOT NULL
GROUP BY u.id, u.first_name, u.last_name, u.date_joined
ORDER BY estimated_clv DESC;

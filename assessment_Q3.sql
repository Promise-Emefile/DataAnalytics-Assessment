select * from plans_plan;
select * from savings_savingsaccount;
select * from users_customuser;


select 
s.plan_id as plan_id, 
c.id as owner_id,
case 
 when p.is_regular_savings = 1 then 'Savings'
 when p.is_a_fund = 1 then 'Investment'
end as 'type',
s.transaction_date as last_transaction_date,
min(datediff(CURRENT_DATE, s.transaction_date)) as inactivity_day
from users_customuser c
inner join savings_savingsaccount s on s.owner_id = c.id
inner join plans_plan p on p.id = s.plan_id
where s.transaction_date > DATE_ADD(CURDATE(), INTERVAL -365 DAY)
and (
	p.is_regular_savings = 1 or p.is_a_fund = 1 -- or p.is_a_goal = 1
) AND c.is_active = false
AND c.is_superuser = false
AND c.is_staff = false
AND c.is_admin = false
GROUP BY s.plan_id, c.id, p.is_regular_savings, p.is_a_fund, s.transaction_date;




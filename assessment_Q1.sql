select * from plans_plan;
select * from savings_savingsaccount;
select * from users_customuser;

select p.owner_id, concat( first_name,' ',last_name) as name, savings_count, investment_count,sum_savings + sum_investment as total_deposit
from users_customuser u
Join (
select owner_id, count(*) as savings_count, sum(amount) as sum_savings from savings_savingsaccount
group by owner_id) p on u.id = p.owner_id
join(
select owner_id, count(*) as investment_count, sum(amount) as sum_investment from plans_plan
group by owner_id
having sum(amount) > 0) s on u.id = s.owner_id
order by total_deposit desc;
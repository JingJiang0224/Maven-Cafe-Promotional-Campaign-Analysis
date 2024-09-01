# Analysis: 
# offer_completed: age, gender, income, become_member_on

/*select 
case when age <= 24 then "<=24"
when age <=34 then "25-34"
when age <=54 then "35-54"
else ">=55" end
as age_group, 
count(1) as pv,
count(distinct customer_id) as uv
from `maven_coffee_campaign.merged_table`
where event = "offer completed"
group by case when age <= 24 then "<=24"
when age <=34 then "25-34"
when age <=54 then "35-54"
else ">=55" end
*/

/*select gender, 
count(1) as pv,
count(distinct customer_id) as uv
from `maven_coffee_campaign.merged_table`
where event = "offer completed"
group by gender
*/

/*
-- 完成情况：隔多久完成
select ceil(time/24) as day, 
count(1) as pv,
count(distinct customer_id) as uv
from `maven_coffee_campaign.merged_table`
where event = "offer completed" 
group by ceil(time/24) 
*/

-- 完成情况：隔多久完成,分类型
select value, offer_type, 
difficulty, reward, duration,channels, 
ceil(time/24) as day, 
count(1) as pv,
count(distinct customer_id) as uv
from `maven_coffee_campaign.merged_table`
where event = "offer completed" 
group by value, offer_type, 
difficulty, reward, duration,channels, ceil(time/24) 
select *
from
(select value, count(1) as pv, count(distinct customer_id) as uv
from `maven_coffee_campaign.merged_table`
where event = "offer completed"
group by value
) as t1
left join
(select value, count(1) as pv, count(distinct customer_id) as uv 
from `maven_coffee_campaign.merged_table`
where event = "offer received"
group by value
) as t2
on t1.value = t2.value
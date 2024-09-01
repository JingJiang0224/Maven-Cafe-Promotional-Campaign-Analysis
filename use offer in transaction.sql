select count(1) as pv,
  count(distinct t1.customer_id) as uv
from
(select *
from `maven_coffee_campaign.merged_table`
where event = "transaction"
) t1
join
(select *
from `maven_coffee_campaign.merged_table`
where event = "offer completed"
) t2
on t1.customer_id = t2.customer_id
and t1.time = t2.time

select offer_id, sum(cast(trans as float64))
from
(select t2.*, t2.value as offer_id, t1.value as trans
from
(select *
from `maven_coffee_campaign.merged_table`
where event = "transaction"
) as t1
left join
(select * 
from `maven_coffee_campaign.merged_table`
where event = "offer completed"
) as t2
on t1.customer_id = t2.customer_id
and t1.time = t2.time
where t2.customer_id is not null
) tt
group by offer_id
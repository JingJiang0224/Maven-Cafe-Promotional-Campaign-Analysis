/*select offer_type, 
count(1) as pv,
count(distinct customer_id) as uv
from `maven_coffee_campaign.merged_table`
where event = "offer completed"
group by offer_type
*/

select value as offer_id, 
offer_type,
count(1) as pv,
count(distinct customer_id) as uv
from `maven_coffee_campaign.merged_table`
where event = "offer completed"
group by value, offer_type
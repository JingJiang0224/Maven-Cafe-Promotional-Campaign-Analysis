--select sum(cast(value as float64))
--from `maven_coffee_campaign.merged_table`
--where event = "transaction"


select sum(cast(reward as float64))
from `maven_coffee_campaign.merged_table`
where event = "offer completed"

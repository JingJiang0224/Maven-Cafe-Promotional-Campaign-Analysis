select *, completed_time-viewed_time as complete_duration
from 
(select completed.customer_id, 
completed.event,
completed.value,
completed.time as completed_time,
completed.offer_type,
completed.difficulty, 
completed.reward, 
completed.duration,
completed.channels,
completed.became_member_on,
completed.gender,
completed.age,
completed.income,
max(viewed.time) as viewed_time
from
(select *
from `maven_coffee_campaign.merged_table`
where event = "offer completed"
) as completed
left join
(select * 
from `maven_coffee_campaign.merged_table`
where event = "offer received"
) as viewed
on viewed.customer_id = completed.customer_id
and viewed.value = completed.value
and viewed.offer_type = completed.offer_type
and completed.time >= viewed.time

group by completed.customer_id, 
completed.event,
completed.value,
completed.time,
completed.offer_type,
completed.difficulty, 
completed.reward, 
completed.duration,
completed.channels,
completed.became_member_on,
completed.gender,
completed.age,
completed.income
) t

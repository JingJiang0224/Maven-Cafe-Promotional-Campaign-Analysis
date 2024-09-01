select *, t.viewed_time - received_time as view_duration 
from
(select viewed.customer_id, 
viewed.event,
viewed.value,
viewed.time as viewed_time,
viewed.offer_type,
viewed.difficulty, 
viewed.reward, 
viewed.duration,
viewed.channels,
viewed.became_member_on,
viewed.gender,
viewed.age,
viewed.income,
max(received.time) as received_time
from
(select *
from `maven_coffee_campaign.merged_table`
where event = "offer viewed"
) as viewed
left join
(select * 
from `maven_coffee_campaign.merged_table`
where event = "offer received"
) as received
on viewed.customer_id = received.customer_id
and viewed.value = received.value
and viewed.offer_type = received.offer_type
and viewed.time >= received.time

group by viewed.customer_id, 
viewed.event,
viewed.value,
viewed.time,
viewed.offer_type,
viewed.difficulty, 
viewed.reward, 
viewed.duration,
viewed.channels,
viewed.became_member_on,
viewed.gender,
viewed.age,
viewed.income
) t

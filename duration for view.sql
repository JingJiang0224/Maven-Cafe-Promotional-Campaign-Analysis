select t1.customer_id, 
t1.value as offer_id,
t1.offer_type,
t1.time as t1,
t2.time as t2,
t2.time-t1.time as time,
t1.difficulty, 
t1.reward, 
t1.duration,
t1.channels,
t1.became_member_on,
t1.gender, 
t1.age,
t1.income 
from 
(select *
from `maven_coffee_campaign.merged_table`
where event = "offer received"
) t1
left join
(select *
from `maven_coffee_campaign.merged_table`
where event = "offer viewed"
) t2
on t1.customer_id = t2.customer_id
and t1.value = t2.value
and t1.offer_type = t2.offer_type
and t2.time >= t1.time -- 勉强用t2. time > t1.time来匹配没两条数据

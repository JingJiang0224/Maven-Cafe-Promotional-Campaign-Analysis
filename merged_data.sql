SELECT  
  events.customer_id,
  event, 
  value, 
  time,
  offer_type,
  difficulty,
  reward,
  duration,
  channels,
  became_member_on,
  gender,
  age,
  income
FROM
  (SELECT 
    customer_id,
    event, 
    REPLACE(JSON_EXTRACT(value, '$.offer id'), '"', '') AS value, 
    time
  FROM `maven_coffee_campaign.events`
  WHERE event IN ('offer received', 'offer viewed')
  UNION ALL 
  SELECT 
    customer_id,
    event, 
    REPLACE(JSON_EXTRACT(value, '$.offer_id'), '"', '') AS value, 
    time
  FROM `maven_coffee_campaign.events`
  WHERE event IN ('offer completed')
  UNION ALL
  SELECT 
    customer_id,
    event, 
    JSON_EXTRACT(value, '$.amount') AS value, 
    time
  FROM `maven_coffee_campaign.events`
  WHERE event = 'transaction'
  ) AS events
LEFT JOIN
  (SELECT 
    offer_id, 
    offer_type,
    difficulty,
    reward,
    duration,
    channels
  FROM `maven_coffee_campaign.offers`
  ) AS offers
ON events.value = offers.offer_id 
LEFT JOIN 
  (SELECT 
    customer_id,
    became_member_on,
    gender,
    age,
    income
  FROM `maven_coffee_campaign.customers`
  ) AS customers
ON events.customer_id = customers.customer_id


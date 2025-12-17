# Write your MySQL query statement below
with cte as (
    select event_date,player_id , lag(event_date) over (partition by player_id order by event_date) as lg ,dense_rank() 
    over (partition by player_id order by event_date) as dr 
    from Activity
)
select ROUND(count(*)/(select count(distinct player_id) from Activity ),2) as fraction from cte where DATEDIFF(event_date,lg)=1 and dr=2

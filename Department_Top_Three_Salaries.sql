# Write your MySQL query statement below
with rmprnk as (
    select d.name Department  ,e.name Employee,  e.Salary Salary , dense_rank() over (partition by d.id order by salary desc) as rksal
    FROM Department d
    JOIN Employee e
    ON d.id = e.departmentId
)
select Department,Employee,Salary from rmprnk where rksal <=3

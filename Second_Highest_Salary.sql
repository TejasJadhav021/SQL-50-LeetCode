select ( SELECT distinct salary from
employee order by salary desc limit 1,1) as SecondHighestSalary 

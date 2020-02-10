--order 1

Select *
from TEAMS
Order by startdate DESC --because date starts with oldest
;

--order 2
Select firstname,lastname,salary,bonus,gender
from members
order by gender,salary
;

--order 3
Select firstname,lastname,salary,bonus,gender
from members
order by gender,salary DESC
;

--order 4
select lastname,firstname,coalesce(bonus,0) AS TotalComp
  from members
  order by TotalComp DESC --can use TheBonus aliaas because that is where the value change happens

;

--order 5
select lastname,firstname,coalesce(bonus,0) AS TotalComp
  from members
  order by TotalComp ASC --can use TheBonus aliaas because that is where the value change happens

;


--order 6
select saledate,qty,unitprice
from sales
order by saledate desc,qty,unitprice
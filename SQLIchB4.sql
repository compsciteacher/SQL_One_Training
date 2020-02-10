--SQL I B04

--Ascending is by default
Select lastname,firstname,salary
From members
Order by lastname
;

--need to specify descending (desc)
Select lastname,firstname,salary
From members
Order by lastname DESC
;

--you can sort by non-selected column
--but hard for user to see any organization

--specify multiple columns in different ways
select lastname,firstname,salary
from members
order by lastname,firstname desc
;

--nulls mess it all up, NULL is last in ascending, first on descending (IN ORACLE!)
--coalesce could help fix with default values, but coalesce is for what is SHOWN not what is calc'd
--the sorting happens before the value change

select lastname,firstname,coalesce(bonus,0) AS TheBonus
  from members
  order by coalesce(bonus,0) DESC --do the coalesce at the ordering
;

select lastname,firstname,coalesce(bonus,0) AS TheBonus
  from members
  order by TheBonus DESC --can use TheBonus aliaas because that is where the value change happens

;


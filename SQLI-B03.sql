--SQL I B3
Select LastName,FirstName,Salary
From members
Where gender ='F' --literal values ARE Case sensitive in Oracle
;

Select LastName,FirstName,Salary,Gender
From members
Where (gender ='F' AND salary>30000) OR
  (gender='M' AND salary >35000)
;

Select LastName,FirstName,Bonus
From members
Where bonus IS NULL --null is lack of value, so = will not work, nor values of 0
;


Select LastName,FirstName,Bonus
From members
Where bonus IS NOT NULL --there is some valid value
;


Select LastName,FirstName,Salary
From members
Where salary BETWEEN 30000 AND 50000 --tbetween operator is inclusive
;


Select LastName,FirstName,Salary
From members
Where salary >=30000 AND salary<=50000 --like python column must repeated
;

--B3 --
--can cause performance issues, be careful
Select lastname,firstname
from members
where firstname LIKE 'J%' --case sensitive, % is wildcard branch, note single quotes
;

Select lastname,firstname
from members
where firstname LIKE '%o%' --with a large amount of records this could take forever and take a lot of mem
;

-- for _ wildcard, single character, a character must be there


--regular expression searches
Select productid,name
from products
Where REGEXP_LIKE(name,'p','i') --will find anything in name column that has p case insensitive
;


Select productid,name
from products
Where REGEXP_LIKE(name,'video|scanner','i') --will find video or scanner case insensitive
;


Select productid,name
from products
Where REGEXP_LIKE(name,'n{2}','i') --will find anything in name column that has n twice case insensitive
;

--IN will look for same column but will accept multiple values (like python list search)
Select lastname,firstname,salary --with this option must repeat column each time
From members
Where salary = 30000 OR
  salary=10000 OR
  salary=50000 OR
  salary=1
;

Select lastname,firstname,salary --with this option can use comma delimited list
From members
Where salary IN (30000,40000,50000,10000)
;
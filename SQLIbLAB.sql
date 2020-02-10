--HCD Lab 1
/* just starting SQL so I know some of my semantics is off, will correct
these are from 
Oracle Database 12c: SQL & PL/SQL Programming
SQL Expert Series from Sideris
ora12c020-ver2-v2

*/

select qty, unitprice, --use quotes for alias
  qty*unitprice AS "Transaction",
  (qty*unitprice)*1.10 AS "IncreasedRevenue"
from sales
;

select lname,fname,salary,
  salary*.95 AS "Proposed"
from Employee
;

select name ||'-'|| location AS Combined
from Products
;

select DISTINCT saledate --UNIQUE is specific to Oracle
from sales
;

select teamid as "TEAM", --double quotes neededd for case sensitivity and spaces
name as "FULLNAME",
startdate as "StartDate2", --couldn't use START since keyword
leaderid AS "LEADER"
from Teams
;


select T.teamid as "TEAM",
T.name as "FULLNAME",
T.startdate as "StartDate2",
T.leaderid AS "LEADER"
from Teams T
;

select DISTINCT Coalesce(MentorID,0) --must be same data type!
  from Members
;
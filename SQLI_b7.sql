--ch7 set operators


--show all team id's
select teamid
from teams
;

--show team id's being used in members
select distinct teamid
from members
where teamid is not null
;

/*
using a SET operator "Minus" we can find TeamIDs NOT assigned to any members.
This does not involve joins and wherre clause
*/

--comparing tables, finding out which is in one and not the other
select teamid
from teams
  MINUS --ORACLE ONLY, standard SQL is EXCEPT

select distinct teamid
from members
where teamid is not null
;

/*
restrictions with set operators;
1. all the queries must produce the same number of columns
2. corresponding columns must have compatibile data types
3. only the last query terminates with ;
4. order by can only be in last query

*/

--intersect finds what is in common for found in all result sets

select teamid
from teams
  Intersect

select distinct teamid
from members
where teamid is not null
;

--union combines the result sets and auto eliminates duplicates
select teamid
from teams
  UNION

select distinct teamid
from members
where teamid is not null
;

--union all; combines result sets keeps duplicates

select teamid
from teams
  UNION ALL

select distinct teamid
from members
where teamid is not null
;

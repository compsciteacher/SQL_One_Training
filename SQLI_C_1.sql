--data definition language, changing tables not just data
/*create table statement defines a database table
*/
create table teamscopy as
(select *
  from teams
  )
;

select *
from teamscopy
;

--create a table structure only no rows, using a subquery
create table teamscopy2 as
  (select *
  from teams
  where 0=1) --no row can pass this test, so they aren't created
;

--only specific columns
create table teamscopy3 as
  (select teamid,name
  from teams
  where teamid in (400,402,403)
  )
;

select *
from teamscopy3
;

--every column must have a data type, no standardized name of types really

drop table teamscopy2
;
--alter 

alter table teams
  modify (name not null)
;
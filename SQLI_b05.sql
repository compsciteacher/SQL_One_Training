--SQL B05 lots of it is oracle specific
--direct logical adress for every row in db
select lastname,firstname,rowid
from members
;

--ora_rowscn is last time row was updated
select ora_rowscn,lastname, scn_to_timestamp(ora_rowscn) as Converted --converts scn to timestamp
from members
;

/* old way to obtain top results from query, rownum. better solutions are row_number() or offset... fetch
offset... fetch requires 12c or newer
rownum is oracle specific
*/

seelct lastname,firstname,salary
from members
where rownum<=3 --does not do what you want, row numbers happen before order
order by salary desc
;

--sysdate gives current dateTime on Oracle server
select sysdate
from dual --a 1 row, 1 column table available to ALL Oracle logons [maybe research, seems interesting]
;

select name, user,uid
from teams;

-- top-n query
select lastname,firstname,salary
from members
  order by salary desc --this gives us top salaries first
  fetch first 3 rows only --fetch is the key here
;

select lastname,firstname,salary
from members
order by salary desc
  fetch first 10 percent rows only --can do by different than just set num of rows
  
;

select lastname,firstname,salary
from members
where firedate is null
order by salary
  fetch first 3 rows with ties --note ties so we don't miss
;

--offset allows us to skip certain rows
--show 3rd-4th highest paid active employees
select lastname,firstname,salary
from members
where firedate is null
order by salary desc
offset 2 rows --this skips the row
fetch first 2 rows with ties
;

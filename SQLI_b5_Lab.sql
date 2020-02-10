--pseudo 1
select name,rowid
from products
;

--pseudo 2
select name,rowid
from products
where rowid='AAAWxFAAGAAAADuAAC'
;

--pseudo 3
select lastname,firstname,salary,gender
from members
order by gender
fetch first 2 rows only
;

select lastname,firstname,salary,gender
from members
where salary>50000
order by gender desc,salary

fetch first 1 row only
;

--pseudo 4
select sysdate,user,uid
from dual
;

--summary 1
select sum(salary),
  max(salary),
  min(salary),
  avg(salary)

from members
;

--summary 2
select  count(*)

from members
;

--summary 3
select count(teamid)
from members
where teamid=401
;

--summary 4
select sum(salary),
  max(salary),
  min(salary),
  avg(salary)

from members
where teamid=401
;
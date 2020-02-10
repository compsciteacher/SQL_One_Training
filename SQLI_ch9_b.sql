--ch9, correlated   subqueries, inline views, aka virtual tables

/*how does an active members salary compare to highest salary for team
to which member is assigned
*/

select m.firstname,m.lastname,m.teamid,m.salary,
--no table as list of highest salary per team
--we can compute it
--correlated subquery needs a value that it doesnt have, value supplied by parent query
(select max(m2.salary)
  from members m2
  where m2.teamid = m.teamid) as MaxTeamSalary,
  m.salary - (select max(m2.salary)
    from members m2
    where m2.teamid=m.teamid) as salarydiff
    
from members m
where m.firedate is null --must be active worker
;

--a subquery in the from clause creates a derived/virtua/inline view
--this will be a standard, selfcontained sub but not scalar
--every column must have a name


select m.firstname,m.lastname,m.teamid,m.salary,
teamsals.teamhi,m.salary-teamsals.teamhi as saldiff

from members m inner join
    (select teamid, max(salary) as teamhi
    from members
    where firedate is null
    group by teamid)
    teamsals --table alias

on m.teamid=teamsals.teamid

;


-- EXISTS operator which team has not assigned people
select name, teamid
from teams t
where not exists (select *
        from members m
        where m.teamid=t.teamid)
        
;

--whih team has members assigned
select name,teamid
from teams t
where exists(select *
            from members m
            where m.teamid=t.teamid)
            
;

--chb9 subquery

--what team is ms lindoe on?
select teamid
from members
where lastname='Lindboe' --401 is returned

;

--who works on same team as lindboe


select firstname,lastname
from members
where teamid=(select teamid
              from members
              where lastname='Lindboe')--self contained, scalar subquery
;

/* the location of the subquery in the parent or containing statement
determines whether or not the subquery has to be scalar = return 1 or 0 values
*/
--ex the = operator requires a single scalar



--IN operator can handle multiple values
select firstname,lastname
from members
where teamid in (select teamid
                 from members
                 where lastname='Jones')
;
--subquery operator list pg 247

--do not user order by in sub, use parent to sort

-- a computer/derived colummn must be a scalar value
select firstname,lastname,teamid,salary,
    (select max(salary)
    from members
    where teamid=402) as maxsal402,
    salary - (select max (salary)
        from members
        where teamid=402) as saldiff
from members
;


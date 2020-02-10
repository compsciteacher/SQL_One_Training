
--create a view (kind of temp table), stores a select statement
CREATE VIEW HiSalView AS
  Select Teamid, MAX(Salary) as TeamHi
  from members
  WHERE firedate is NULL
  Group by Teamid
;
--use view as table tto create query
select m.firstname,m.lastname,m.teamid,m.salary,
    hisalview.teamhi,m.salary -hisalview.teamhi as SallDiff
From members  m inner join hisalview
    on m.teamid=hisalview.teamid
Where m.firedate is null
;

--rollup and cube
select productid,
    count(*) as orders,
    Sum(sales.qty*sales.unitprice)
    
--grouping sets

select customerid, productid,
    count(*) as Orders,
    Sum(sales.qty*sales.unitprice)as total
from sales
group by
    grouping sets (
    (), --1 big group
    (CustomerID),
    (ProductID),
    (CustomerID,ProductID) --?
)
ORDER BY Total
;

--rollup, breaks down by each column given in rollup function, it basically does the grouping from above
select customerid, productid,
    count(*) as Orders,
    Sum(sales.qty*sales.unitprice)as total
from sales
group by rollup(customerid,productid)
ORDER BY customerid,productid
;

--a4 case expression
/* selector or single case looks at specific column(expresssion) then evaluates
an enumerated list of possible values. it takes action on the value which matches
the column. option default exists if no match found
*/

--simple/selector case
select firstname,lastname,gender,
    case gender --column/exoressuib ti examine
        when 'M' then 'male'
        when 'F' then 'female'
        else '??'
    end as TheGender--must finish if(case) statement
from members
;


--search case more like if/elif/else statement
--optional default case possible

select firstname,lastname,salary,gender,
    CASE --note no column, that is diff
        WHEN gender = 'F' THEN 'female'
        WHEN lastname='Jones' THEN 'Hello Mr. Jones'
        WHEN Salary<45000 THEN 'raise coming'
        ELSE '??'
    end as SearchedCase
from members
;

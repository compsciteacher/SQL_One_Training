--sub 1
select m.lastname,m.firstname,t.name,m.hiredate
from teams t, members m

where m.teamid=t.teamid
and m.hiredate=(select max(hiredate)
                from members)
and m.firedate is null
;

--sub 2
select m.lastname,m.firstname,m.salary
from teams t, members m

where m.teamid=t.teamid
and m.salary=(select max(salary)
                from members)
;

--sub 3
select m.lastname,m.firstname,t.name
from teams t, members m

where m.memberid=t.leaderid
and t.startdate=(select max(startdate)
                from teams)
;

--sub 4
select c.name, s.saledate, s.productid, p.name
from customers c, sales s, products p

where s.customerid=c.customerid
and s.productid=p.productid
and s.saledate=(select min(saledate)
                from sales)
;

--sub 5
select s.*

from sales s
where qty*unitprice =
    (select max(qty*unitprice)
    from sales)

;

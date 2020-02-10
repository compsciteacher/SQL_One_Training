--ch7 lab


select distinct p.name,p.listprice
from products p, sales s, customers c
where p.productid=s.productid
and s.customerid=c.customerid
and c.name='The Camera Store'

UNION

select p.name,p.listprice
from products p,members m, teams t
where p.memberid=m.memberid
and m.teamid=t.teamid
and t.name='Engineering'
;


--set 2

select distinct p.name,p.listprice
from products p, sales s, customers c
where p.productid=s.productid
and s.customerid=c.customerid
and c.name='The Camera Store'

INTERSECT

select p.name,p.listprice
from products p,members m, teams t
where p.memberid=m.memberid
and m.teamid=t.teamid
and t.name='Engineering'
;

--set 3


select distinct p.name,p.listprice
from products p, sales s, customers c
where p.productid=s.productid
and s.customerid=c.customerid
and c.name='The Camera Store'

MINUS

select p.name,p.listprice
from products p,members m, teams t
where p.memberid=m.memberid
and m.teamid=t.teamid
and t.name='Engineering'
;

--set 4
select p.name,p.listprice
from products p,members m, teams t
where p.memberid=m.memberid
and m.teamid=t.teamid
and t.name='Engineering'

MINUS

select distinct p.name,p.listprice
from products p, sales s, customers c
where p.productid=s.productid
and s.customerid=c.customerid
and c.name='The Camera Store'

;
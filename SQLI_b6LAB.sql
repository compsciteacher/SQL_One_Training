--b06 Lab
--join 1

Select m.firstname,m.lastname,m.hiredate
FROM teams t, members m
where t.teamid=m.teamid
AND t.teamid=401

;

--join 2

select p.name
from sales s, customers c, products p
where c.Name='Hi Tech Supply' --string literals must be single quotes
  and c.customerid=s.customerid
  and s.productid = p.productid
;

--join 3
select p.name as Product,t.name as Team,c.name as Customer
from sales s,products p, customers c,teams t, members m
where p.memberid=m.memberid
  and m.teamid=t.teamid
  and p.productid=s.productid
  and s.customerid = c.customerid
;

--join 4

select p.name as Product,t.name as Team,c.name as Customer
from sales s,products p, customers c,teams t, members m
where p.memberid=m.memberid
  and m.teamid=t.teamid
  and p.productid=s.productid
  and s.customerid = c.customerid
  and c.name='The Camera Store'
;

--join 9

Select distinct t.name
FROM teams t, members m --gives alias
Where t.teamid=m.teamid --the (+) is the outer join, it only applies to the table you applied the + too
Order by t.name
;

--join 10
Select t.name
FROM teams t, members m --gives alias
Where t.teamid=m.teamid(+) --the (+) is the outer join, it only applies to the table you applied the + too
  and m.teamid is null

;
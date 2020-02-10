--ch10

--group1
select productid,count(*),avg(unitprice),
sum(qty*unitprice) as total

from sales
group by productid
order by productid
;

--group 2
select p.productid,p.name,p.listprice,
count(*),
round(avg(s.unitprice),2)as average,
sum(s.qty*s.unitprice) as total

from sales s,products p
where s.productid = p.productid
group by p.productid,p.name,p.listprice
order by productid
;

--group 3
select p.productid,p.name,p.listprice,
count(*),avg(s.unitprice),
sum(s.qty*s.unitprice) as total

from sales s inner join products p
on s.productid = p.productid
inner join customers c
on s.customerid=c.customerid
where s.productid = p.productid
and c.Type!='Retail'
group by p.productid,p.name,p.listprice

;

--group 4
select p.productid,p.name,p.listprice,
count(*),avg(s.unitprice),
sum(s.qty*s.unitprice) as total

from sales s,products p
where s.productid = p.productid
group by p.productid,p.name,p.listprice
having count(*)>3
order by total DESC
;

--group 5
select gender, avg(salary)
from members
group by gender
order by gender
;

--group 6
select married, avg(salary)
from members
where firedate is null
group by married
order by married;

--group 7

select mentor.lastname,mentor.firstname,count(*)

from members mentor, members trainee
where trainee.mentorid=mentor.memberid
group by mentor.lastname,mentor.firstname
order by count(*) desc
;
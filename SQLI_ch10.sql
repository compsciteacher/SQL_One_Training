--ch10

/* group by clause organizes the rows into diff groups, based on rows having same valude in
the colum or columns you specify
the aggregate function is carried out on each group
*/

select location,
count(*) as totrows,
  min(productid) as lowprod
  
from products
group by location
;

/* when using aggregate function, every column in the select column must
1. be contained inside an aggregate function OR
2. be listed in the group clause
else error
*/
select location,name,count(*) as totrows, --name is not agg or group
min(productid) as lowprod
from products
group by location
;

/* group by clause can contain multiple columns, comma separate
but this is an implied and, the rows in the group must have the
same value for every column listed. this may produce a lot of groups
*/
select location,name,
count(*) as totrows,
min(productid) as lowprod
from products
group by location,name --and implied AND, so they would have to BOTH be the same to be a group
;

/*FROM AND WHERE ALWAYS TAKE PLACE BEFORE GROUPING*/

select location,
count(*) as totrows,
min(productid) as lowprod
from products
where location in ('Chicago','Miami')
group by location
;

/*having clause filters groups where clause filters rows and happens before groups are formed
having clause filters groups so takes place after groups formed
*/
select location,
count(*) as totrows,
min(productid) as lowprod
from products
where location in ('Chicago','Miami')
group by location
  having count(*) >=2
;


--with groups you lose visibility to the individ rows
--analytic functions offer an alternative so you aggregate but still see
--individ rows


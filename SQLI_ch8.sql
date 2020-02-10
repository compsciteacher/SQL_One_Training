--b08
/*without group by clause all the rows for an aggregate function are treated as a single group
*/
--how many rows are in sales
select count(*) as TotalRows --the * is for all rows/columns
from sales
;

--show count earliest sale date, total sales, highest customer id
select count(*) as totalrows,
  min(saledate) as EarliestSale,
  sum(qty*unitprice) as TotalSales,
  max(customerid) as HighestCust
  
from sales
;

/*
aggregate functions are smart enough to ignore rows where cell is null;
count(*) is the exception
*/

select count(*) as totalrows,
   count(bonus) as totalbonus
from members
;

--inside an aggregate function distinct ignores duplicate rows
select count(*) as totalrows,
  count(gender) as totgender,
  count(distinct gender) as distcodes
from members
;
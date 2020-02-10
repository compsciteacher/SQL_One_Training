--B06
--show the team name and the members assigned to that team
--1:m is one to many, m:m is many to many

Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t, members m --gives alias
Where t.teamid=m.teamid --can't use column alias, this is the PK -> FK join
--this is old style syntax of specifying the join condition in the where clause
Order by t.teamid
;
/*
in a 1:m relationship we typically need to id:
  1. the PK (primary key) from the 1 side of the relationship
  2. the FK (foreign key) from the many side of that relationship

in order to link/connect/assoc/join the related rows from the two tables
PK is never null, it identifies the row

If a row on many side: members, is null in foreign key column, ex:joseph smith teamid
then that row is NOT participating in the relationship 
that row will NEVER appearl in an inner join

if you do not see a row from the 1 side of 1:m (advertising is not showing up), that means
NO rows are linked/assigned/referenced/join
EX: no one has FK that points to that PK (advertising)

an inner join will only show rows where there is match of PK-FK, if one is not on other, it will not show
*/

/*
Look up PK and FK constraints for SQL+ or use devloper, a decent amount of info/instructions needed

*/

--where clause still allows us to filter rows before joining

Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t, members m --gives alias
Where t.teamid=m.teamid --can't use column alias, this is the PK -> FK join
--this is old style syntax of specifying the join condition in the where clause
AND t.teamid IN (400,402)
Order by t.teamid
;

--show 1 customer name 2 the sales date 3 product name

select c.name as custname, s.saledate, p.name AS prodname
FROM customers c, sales s, products p
where c.customerid = s.customerid --pk to fk, note two tables at a time
  and p.productid = s.productid --pk to fk
  --a table has only one pk, but can have multiple fk
order by custname,prodname
;

/*
if all rows in 1 table pair with all rows in 2nd table, this produces cross product
aka cartesian table
*/

Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t, members m --gives alias
Order by t.teamid
;


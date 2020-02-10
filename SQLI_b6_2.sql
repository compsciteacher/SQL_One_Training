--Proper syntax
--where clause (old method)
Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t, members m --gives alias
Where t.teamid(+)=m.teamid --the (+) is the outer join, it only applies to the table you applied the + too
--this is old style syntax of specifying the join condition in the where clause
Order by t.teamid
;

--preferred syntax
--from clause specifies the condition
Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t INNER JOIN members m --inner join instead of where
  ON t.teamid=m.teamid --ON gives the condition, required, and avoids cartesian

Order by t.teamid
;


--where can still be used to filter

-- inner join or join are both oooook

Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t JOIN members m --inner join instead of where
  ON t.teamid=m.teamid --ON gives the condition, required, and avoids cartesian

Order by t.teamid
;


--OUTER JOIN syntax
--oracle specific uses (+)
--preferred syntax
Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t Right OUTER JOIN members m --right outer join gives all results (including nulls)
  --right means return all results to the right
  ON t.teamid=m.teamid --ON gives the condition, required, and avoids cartesian

Order by t.teamid
;


Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t LEFT OUTER JOIN members m --left outer join gives all results (including nulls)
  --left means return all results to the left
  ON t.teamid=m.teamid --ON gives the condition, required, and avoids cartesian

Order by t.teamid
;


Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t FULL OUTER JOIN members m --full outer join gives all results (including nulls)
  --full means return all resultsfrom both tables
  ON t.teamid=m.teamid --ON gives the condition, required, and avoids cartesian

Order by t.teamid
;


--show 1 customer name 2 the sales date 3 product name
--combining multiple tables using inner join syntax
select c.name as custname, s.saledate, p.name AS prodname
FROM customers c inner join sales s
  on c.customerID=s.customerid --PK to FK, forms a sort of temp table
    Inner Join Products p
      ON p.productid = s.productid -- PK to FK

order by custname,prodname
;

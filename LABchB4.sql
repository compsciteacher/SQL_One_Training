--order 1

SELECT *
  FROM TEAMS
  ORDER BY startdate DESC --because date starts with oldest
;

--order 2
SELECT firstname,lastname,salary,bonus,gender
  FROM members
  ORDER BY gender,salary
;

--order 3
SELECT firstname,lastname,salary,bonus,gender
  FROM members
  ORDER BY gender,salary DESC
;

--order 4
select lastname,firstname,coalesce(bonus,0) AS TotalComp
  FROM members
  ORDER BY TotalComp DESC --can use TheBonus aliaas because that is where the value change happens

;

--order 5
SELECT lastname,firstname,coalesce(bonus,0) AS TotalComp
  FROM members
  ORDER BY TotalComp ASC --can use TheBonus aliaas because that is where the value change happens

;


--order 6
SELECT saledate,qty,unitprice
  FROM sales
  ORDER BY saledate desc,qty,unitprice

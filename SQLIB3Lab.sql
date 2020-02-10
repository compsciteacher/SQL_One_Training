Select UnitPrice
from Sales
Where UnitPrice=2900
;
Select *
From Sales
Where UnitPrice = 2900 AND customerid!=103
;
Select *
from Sales
Where UnitPrice BETWEEN 500 AND 1000
;

Select *
from Sales
Where QTY<10 AND (QTY*UnitPrice>5000)

;

--Where 2
Select Name, Address
From Customers
Where telephone LIKE '212%'
;

--Where 3
Select firstname,lastname
from members
where firedate IS NULL
;

--Where 4
Select *
from Customers
Where TYPE = 'Retail' or TYPE = 'Distributor'
;
Select *
from Customers
Where TYPE IN ('Retail','Distributor')
;

--Where 5
Select firstname,lastname,mentorid
from members
Where mentorid IS NOT NULL
;

--Where 6
Select lastname,firstname,salary,bonus
from members
Where firstname||lastname='JohnJones'
;

--Where 7
Select *
from products
Where REGEXP_LIKE(name,'video|scan|photo','i') --will find video,photo,or scan case insensitive
;

Select *
from products
Where REGEXP_LIKE(name,'^video|^scan|^photo','i') --will find when name STARTS with video,photo,scan case insensitive
--Where REGEXP_LIKE(name,'^(video|scan|photo'),'i') option 2, notice ^ before comma delimited list
; 
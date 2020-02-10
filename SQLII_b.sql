--SQLII b
--string functions

select upper('abc'),' ',
    lower('ABC'),' ',
    initcap('abcABC'),' '
from dual
;

select to_char(7)
from dual
;

--
--b2
--
--numeric functions

--NULL IF returns NULL if the two args are =, else returns arg

select nullif(100,10) as OneHundred,' ',
nullif(100,100) as aNull
from dual
;

select hiredate, ' ',
to_char(hiredate,'MM/DD/YYYY hh24:mi:ss') as OurFormat
from members
;

--set default date/time format
alter session
    set nls_date_format='MM/DD/YYYY hh24:mi:ss'
;

select sysdate
from dual
;

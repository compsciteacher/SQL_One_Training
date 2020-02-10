select name, listprice
from products
where listprice>1000 --restrict rows returned
;

select lastname,firstname,bonus
from members
;

/* NULL does not play nicely
anything combined/calculated with NULL returns NULL
*/

select lastname,firstname,salary,bonus,
  salary+bonus --spacing not necessary, seems to be ignored by sql
  --salary+bonus is derived/calculated/computed column that doesn't have to be created (using existing data)
from members
;



select lastname,firstname,salary,bonus,
  salary+Coalesce(bonus,0) AS TotalComp--replace null with 0 w/o changing table data using Coalesce (look for NULL, replacement)
from members
;



select lastname,firstname,salary,bonus,
  salary+Coalesce(bonus,0) AS TotalComp--replace null with 0 w/o changing table data using Coalesce (look for NULL, replacement)
  --AS allows column to be renamed
from members
;

--combine last name and first name--
select lastname||','||firstname AS CombinedName,
salary,bonus,
salary+Coalesce(bonus,0) AS TotalComp
from members
;

select lastname||','||firstname AS CombinedName,
salary,bonus,
salary+Coalesce(bonus,0) AS TotalComp
from members
;

--table alias
select lastname||','||firstname AS CombinedName,
salary,bonus,
salary+Coalesce(bonus,0) AS TotalComp
from members mem --simmply give alias after table name in from statement
;


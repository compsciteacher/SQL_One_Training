--outer join
Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t, members m --gives alias
Where t.teamid=m.teamid --can't use column alias, this is the PK -> FK join
--this is old style syntax of specifying the join condition in the where clause
Order by t.teamid
;

--want to see all the members even if member is not assigned to a team
--outer join gives all inner joins and missing rows
--oracle specific syntax!!!
Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t, members m --gives alias
Where t.teamid(+)=m.teamid --the (+) is the outer join, it only applies to the table you applied the + too
--this is old style syntax of specifying the join condition in the where clause
Order by t.teamid
;


Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t, members m --gives alias
Where t.teamid=m.teamid(+) --the (+) is the outer join, it only applies to the table you applied the + too
--this is old style syntax of specifying the join condition in the where clause
Order by t.teamid
;

--show only the rows that have nothing assigned, show teams with no one assigned
Select t.name,t.teamid as TTID,  --notice alias for teamid since in both tables
  m.teamid as MTID, m.firstname,m.lastname
FROM teams t, members m --gives alias
Where t.teamid=m.teamid(+) --the (+) is the outer join, it only applies to the table you applied the + too
  and m.teamid is null
Order by t.teamid
;

--self or reflexive join, both pk and fk are in same table
--special case of both inner and outer join
Select PK.lastname||' '||PK.firstname as Mentor,
' mentors ',
FK.lastname as Surname
from members PK, members FK
where pk.memberid(+)=fk.mentorid --pk to fk
Order by Mentor,Surname
;
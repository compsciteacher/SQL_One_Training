/*DML
Data Management Language first time changing data (not the table itself)
insert,update,delete,about,rollback,commit

*/

INSERT INTO Teams (leaderid,name,teamid)
VALUES(500,'SQL Team',500)
;
COMMIT
;

SELECT *
FROM teams
;
--create tablecopy9 for dml
CREATE TABLE TeamsCopy9 AS
  SELECT *
  FROM Teams
  Where 0=1
;
SELECT *
FROM TeamsCopy9
;

--insert rows using subq
INSERT INTO TeamsCopy9
  Select *
  FROM Teams
  ;
COMMIT
;

SELECT *
FROM TeamsCopy9
;

--get rid of rows
--delete and update are 'greedy', w/o use of WHERE clause, these 2 will effect every row and table

delete from TeamsCopy9
WHERE TeamID >450
;
COMMIT
;
SELECT * FROM TeamsCopy9
;

--delete all data, keep table
TRUNCATE TABLE TeamsCopy9 --Truncate does not need COMMIT
;
Select * FROM TeamsCopy9
;

--standard RDBMS does NOT allow you to remove rows if there is
--a reference (FK) pointing to that row. Referential integrity

DELETE FROM
teams
WHERE teamid=400
;

--update
UPDATE TeamsCopy9
  SET leaderid=501
  WHERE leaderid=500 --without WHERE all rows would change
;
COMMIT
;

SELECT *
FROM TeamsCopy9
;

--Transaction ends with commit
--Doiing two tasks before commit, insures both have to run before either one takes place
INSERT INTO TeamsCopy9 (leaderid,name,teamid)
VALUES (501,'dba',600)
;
Update TeamsCopy9
  SET name=UPPER(Name)
;
commit
;

SELECT * FROM TeamsCopy9
;

--ROLLBACK essentially an undo
DELETE FROM TeamsCopy9
;
SELECT * from TeamsCopy9
;
--Fix that

ROLLBACK
;
Select * FROM TeamsCopy9
;

--Transactions end at commit, rollback, or termination (seen as rollbak)
--create, alter, drop (DDL statements) are seen as commits
--SQL+ closure is a COMMIT



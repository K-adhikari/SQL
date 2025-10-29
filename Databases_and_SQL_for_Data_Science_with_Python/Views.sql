-- Question 1. Create a view 'EMP_DEPT' which has the 'EMP_ID', 'FIRST_NAME', 'LAST_NAME', and 'DEP_ID' from EMPLOYEES table.

CREATE VIEW EMP_DEPT AS SELECT EMP_ID, FIRST_NAME, LAST_NAME, DEP_ID FROM EMPLOYEES


-- Question 2. Using select, query the EMP_DEPT view to retrieve all the records.

SELECT * FROM EMP_DEPT


-- Question 3. Modify 'EMP_DEPT' such that it displays Department names instead of Department IDs. Pull the information from EMPLOYEES and DEPARTMENTS table.

CREATE OR REPLACE VIEW EMP_DEPT AS
SELECT EMP_ID, FIRST_NAME, LAST_NAME, DEP_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEP_ID = DEPARTMENTS.DEPT_ID_DEP
  

-- Question 4. Drop the view 'EMP_DEPT'.

DROP VIEW EMP_DEPT

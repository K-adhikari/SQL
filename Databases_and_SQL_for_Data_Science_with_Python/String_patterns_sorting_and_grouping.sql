-- Question 1. Retrieve the list of all employees, first and last names, whose first names start with ‘S’.

SELECT F_NAME, L_NAME FROM EMPLOYEES WHERE F_NAME LIKE 'S%'


-- Question 2. Arrange all the records of the EMPLOYEES table in ascending order of the date of birth.

SELECT * FROM EMPLOYEES ORDER BY B_DATE


-- Question 3. Group the records in terms of the department IDs and filter them of ones that have average salary more than or equal to 60000. Display the department ID and the average salary.

SELECT DEP_ID, AVG(SALARY) AS AVG_SAL FROM EMPLOYEES GROUP BY (DEP_ID) HAVING AVG_SAL>=60000


-- Question 4. For the problem above, sort the results for each group in descending order of average salary.

SELECT DEP_ID, AVG(SALARY) AS AVG_SAL FROM EMPLOYEES GROUP BY (DEP_ID) HAVING AVG_SAL>=60000 ORDER BY AVG_SAL DESC
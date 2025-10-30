-- Question 1. Retrieve the names, job start dates, and job titles of all employees who work for department number 5.


SELECT E.F_NAME,E.L_NAME, JH.START_DATE, J.JOB_TITLE FROM EMPLOYEES AS E
 INNER JOIN JOB_HISTORY AS JH ON E.EMP_ID = JH.EMPL_ID
  INNER JOIN JOBS AS J ON E.JOB_ID = J.JOB_IDENT
   WHERE E.DEP_ID ='5'


-- Question 2. Retrieve employee ID, last name, and department ID for all employees but department names for only those born before 1980.

SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME FROM EMPLOYEES AS E  
 LEFT OUTER JOIN DEPARTMENTS AS D
  ON E.DEP_ID = D.DEPT_ID_DEP 
   AND YEAR(E.B_DATE) < 1980;


-- Question 3. Retrieve the first name and last name of all employees but department ID and department names only for male employees (Use full outer join).

SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME FROM EMPLOYEES AS E
 LEFT OUTER JOIN DEPARTMENTS AS D
  ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M'

   UNION

    SELECT E.F_NAME, E.L_NAME, D.DEPT_ID_DEP, D.DEP_NAME from EMPLOYEES AS E
     RIGHT OUTER JOIN DEPARTMENTS AS D
      ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M';
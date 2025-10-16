-- Question 1. Retrieve only the list of employees whose JOB_TITLE is Jr. Designer using subqueries.

SELECT * FROM EMPLOYEES
 WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS WHERE JOB_TITLE = "Jr. Designer")


 -- Question 2. Use implicit joins for above question.

 SELECT * FROM EMPLOYEES E, JOBS J
  WHERE E.JOB_ID = J.JOB_IDENT AND J.JOB_TITLE = "Jr. Designer"


-- Question 3. Retrieve JOB information and a list of employees whose birth year is after 1976 using subqueries.

SELECT * FROM JOBS WHERE JOB_IDENT IN (SELECT JOB_ID FROM EMPLOYEES WHERE YEAR(B_DATE) > 1976)


-- Question 4. Use implicit joins for above question

SELECT J.JOB_TITLE, J.MIN_SALARY, J.MAX_SALARY, J.JOB_IDENT 
FROM JOBS J, EMPLOYEES E 
WHERE J.JOB_IDENT = E.JOB_ID AND YEAR(E.B_DATE)>1976
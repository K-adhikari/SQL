-- Question 1. Usingthe ICUSTAYS table, how many types of FIRST_CAREUNIT are there?

SELECT distinct FIRST_CAREUNIT FROM ICUSTAYS


-- Question 2. Using the D_ITEMS table, how many unique values in LABEL have the word "weight" in them?

SELECT distinct LABEL FROM D_ITEMS WHERE lower(LABEL) LIKE "%weight%"


-- Question 3. Using the ICUSTAYS table, how many ICU Stays are in the database?

SELECT count(*) FROM ICUSTAYS


-- Question 4. What is the earliest INTIME from the ICUSTAYS table?  

SELECT min(INTIME) FROM ICUSTAYS


-- Question 5. What is the latest OUTTIME from the ICUSTAYS table?    

SELECT max(OUTTIME) FROM ICUSTAYS


-- Question 6. How many distinct patients are in the ICUSTAYS table?  

SELECT distinct SUBJECT_ID FROM ICUSTAYS


-- Question 7. What is the maximum number of ICU stays for any individual patient?   

SELECT SUBJECT_ID, COUNT(DISTINCT HADM_ID) AS ADMISSION_COUNT FROM ICUSTAYS 
   GROUP BY SUBJECT_ID
   ORDER BY ADMISSION_COUNT DESC


-- Question 8. Write a query to perform an inner join of DIAGNOSES_ICD and D_ICD_DIAGNOSES that included the values for ROW_ID from both tables?  

SELECT * FROM DIAGNOSES_ICD a INNER JOIN D_ICD_DIAGNOSES b using (ICD9_CODE)


-- Question 9. How many rows in DIAGNOSES_ICD have an ICD9 code that contains the word "hypertension"? 

SELECT count(ICD9_CODE) FROM DIAGNOSES_ICD a INNER JOIN D_ICD_DIAGNOSES b using (ICD9_CODE) where lower(LONG_TITLE) like "%hypertension%"


-- Question 10. How many records in PATIENTS have an entry in INPUTEVENTS_MV?  

SELECT * FROM PATIENTS WHERE SUBJECT_ID in (SELECT SUBJECT_ID FROM INPUTEVENTS_MV GROUP BY SUBJECT_ID)


-- Question 11. How many records had an ADMISSION_LOCATION of "EMERGENCY ROOM ADMIT"?

SELECT count(ADMISSION_LOCATION) FROM ADMISSIONS where ADMISSION_LOCATION = "EMERGENCY ROOM ADMIT"


-- Question 12. What is the maximum number of prescription records that any individual patient has in their record?

SELECT SUBJECT_ID, count(ROW_ID) as times FROM PRESCRIPTIONS
     GROUP BY SUBJECT_ID 
     ORDER BY times desc

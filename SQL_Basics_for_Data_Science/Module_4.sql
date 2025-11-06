-- Question 1. Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)

SELECT CustomerID, FirstName, LastName, Address, City, Country,
UPPER (City || ' ' || Country) AS New_address
FROM Customers


-- Question 2. Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.

SELECT FirstName, LastName,
(LOWER(substr(FirstName, 1,4))|| '' || LOWER(substr(LastName, 1,2))) AS userid
FROM Employees


-- Question 3. Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.

SELECT FirstName, LastName, HireDate, DATE('now'),
strftime('%Y', 'now' )- strftime ('%Y', HireDate) AS duration
FROM Employees
ORDER BY LastName ASC


-- Question 4. Profiling the Customers table, answer the following question. Are there any columns with null values? Indicate any below. Select all that apply. (Note: Code was written to test null values individually (one at a time) for columns listed in question)

SELECT *
FROM Customers
WHERE 
Phone IS NULL
--Fax is NULL
--PostalCode is NULL
--Company is NULL
--FirstName is NULL
--LastName is NULL


-- Question 5. Find the cities with the most customers and rank in descending order.

SELECT City, COUNT(City) AS number_of_constumers
FROM Customers
GROUP BY City
ORDER BY number_of_constumers DESC


-- Question 6. Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.

SELECT C.FirstName, C.LastName, I.InvoiceID,
C.FirstName|| '' ||C.LastName|| '' ||I.InvoiceID
FROM Customers C
JOIN Invoices I ON C.CustomerId = I.CustomerId
ORDER BY FirstName

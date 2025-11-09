-- All of the questions in this quiz refer to the open source Chinook Database.

-- Question 1. Find all the tracks that have a length of 5,000,000 milliseconds or more.

SELECT TrackID, Milliseconds
FROM Tracks
WHERE Milliseconds >= 5000000


-- Question 2. Find all the invoices whose total is between $5 and $15 dollars. How many total records are there?

SELECT InvoiceID, Total
FROM Invoices
WHERE Total BETWEEN 5 AND 15


-- Question 3. Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY. What company does Jack Smith work for?

SELECT FirstName, LastName, State, Company
FROM Customers
WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY')


-- Question 4. Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00. 
-- What was the invoice date for invoice ID 315?

SELECT CustomerID, InvoiceDate, InvoiceID, Total
FROM Invoices
WHERE CustomerID IN (56,58) AND
Total BETWEEN 1.00 AND 5.00


-- Question 5. Find all the tracks whose name starts with 'All'.

select
Name
from Tracks
where Name like 'All%'


-- Question 6. Find all the customer emails that start with "J" and are from gmail.com.

select
Email
from Customers
where Email like 'J%@gmail.com'


-- Question 7. Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
-- What is the total invoice amount of the first record returned?

select 
InvoiceID,
BillingCity,
Total
from Invoices
where BillingCity in ('Brasilia', 'Edmonton', 'Vancouver')
order by InvoiceID desc;


-- Question 8. Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.

select 
CustomerID,
count(*) as orders
from Invoices
group by CustomerID
order by orders desc;


-- Question 9. Find the albums with 12 or more tracks. How many total records there are?

select 
AlbumID,
count(*) as total_tracks
from Tracks
group by AlbumID
having count(*) >= 12




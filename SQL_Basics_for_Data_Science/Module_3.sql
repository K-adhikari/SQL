-- Question 1. Using a subquery, find the names of all the tracks for the album "Californication".

SELECT AlbumId, Name
FROM Tracks
WHERE AlbumId IN (SELECT
AlbumId
FROM Albums
WHERE Title = "Californication" )


-- Question 2. Find the total number of invoices for each customer along with the customer's full name, city and email. what is the correct customer information for the 5th person, František Wichterlová? Select the answer below.

SELECT CustomerID, FirstName, LastName, City, Email
FROM Customers
WHERE CustomerID IN (SELECT CustomerID
FROM Invoices)


-- Question 3. Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT t.name, t.trackID, a.title, a.ArtistID
FROM albums a
LEFT JOIN Tracks t ON t.AlbumId = a.AlbumId


-- Question 4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her. 

SELECT 
e1.FirstName || ' ' || e1.LastName
AS employeename,
e2.FirstName || ' ' || e2.LastName
AS managername
FROM Employees e1
LEFT JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID


-- Question 5. Find the name and ID of the artists who do not have albums. 

SELECT Ar.Name, Ar. ArtistID, Al.Title
FROM Artists Ar
LEFT JOIN Albums Al ON Ar.ArtistID = Al.ArtistID
WHERE Al.Title IS NULL


-- Question 6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

select FirstName, LastName
from Employees
union
select FirstName, LastName
from Customers
order by LastName desc;


-- Question 7. See if there are any customers who have a different city listed in their billing city versus their customer city.

select C.FirstName, C.LastName, C.City, I.BillingCity
from Customers C
left join Invoices I on C.CustomerID = I.CustomerID
where C.City <> I.BillingCity

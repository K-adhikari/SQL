/* Question 1. Using a subquery, find the names of all the tracks for the album "Californication". */

select 
AlbumId, Name
from Tracks
where AlbumId in (select
AlbumId
from Albums
where Title = "Californication" )


/* Question 2. Find the total number of invoices for each customer along with the customer's full name, city and email. what is the correct customer information for the 5th person, František Wichterlová? Select the answer below. */

select 
CustomerID, FirstName, LastName, City, Email
from Customers
where CustomerID in (select
CustomerID
from Invoices)


/* Question 3. Retrieve the track name, album, artistID, and trackID for all the albums. */

select t.name, t.trackID, a.title, a.ArtistID
from albums a
left join Tracks t on t.AlbumId = a.AlbumId


/* Question 4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her. */

select 
e1.FirstName || ' ' || e1.LastName
as employeename,
e2.FirstName || ' ' || e2.LastName
as managername
from Employees e1
left join Employees e2 on e1.ReportsTo = e2.EmployeeID


/* Question 5. Find the name and ID of the artists who do not have albums. */

select Ar.Name, Ar. ArtistID, Al.Title
from Artists Ar
left join Albums Al on Ar.ArtistID = Al.ArtistID
where Al.Title is NULL


/* Question 6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order. */

select FirstName, LastName
from Employees
union
select FirstName, LastName
from Customers
order by LastName desc;


/* Question 7. See if there are any customers who have a different city listed in their billing city versus their customer city. */

select C.FirstName, C.LastName, C.City, I.BillingCity
from Customers C
left join Invoices I on C.CustomerID = I.CustomerID
where C.City <> I.BillingCity

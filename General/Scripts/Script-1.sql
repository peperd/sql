

CREATE TABLE Customer_ AS
SELECT * 
FROM Customer;


CREATE TABLE Invoice_ AS
SELECT * 
FROM Invoice;


CREATE TABLE Playlist_ AS
SELECT * 
FROM Playlist;


CREATE TABLE Employee_ AS
SELECT * 
FROM Employee;


CREATE TABLE Album_ AS
SELECT * 
FROM Album;


CREATE TABLE Artist_ AS
SELECT * 
FROM Artist;


SELECT * 
	FROM Customer_;

SELECT Firstname, Lastname 
	FROM Customer_;

SELECT * 
	FROM Customer_ 
	WHERE Country = 'Germany';

SELECT * 
	FROM Customer_ 
	WHERE Company 
	IN ('Google Inc.', 'Apple Inc.');

SELECT * 
	FROM Customer_
	WHERE Company IS NOT NULL;

SELECT Firstname, Lastname, Phone 
	FROM Customer_ 
	WHERE City NOT IN ('Prague', 'Vienne') AND SupportRepId >3;

	SELECT * 
	FROM Customer_ 
	WHERE City IN ('Berlin', 'Paris') OR SupportRepId  = 4;

SELECT Company, COUNT(CustomerId) 
	FROM Customer_ 
	GROUP BY Company ;

SELECT Country , City , COUNT(CustomerId) 
	FROM Customer_ 
	GROUP BY Country , City ;

SELECT City , COUNT(CustomerId) 
	FROM Customer_
	WHERE Country  = 'USA' 
	GROUP BY City  ; 


SELECT * 
	FROM Invoice_ ;

SELECT CustomerId , SUM(Total), COUNT(Total) 
	FROM Invoice_ 
	GROUP BY CustomerId ;

SELECT BillingCity, COUNT(CustomerId) AS Number_of_clients 
	FROM Invoice_ 
	GROUP BY BillingCity ;

SELECT BillingCity , COUNT(CustomerId)
	FROM Invoice_ 
	GROUP BY BillingCity 
	HAVING COUNT(CustomerID) >7;

SELECT BillingCity , COUNT(CustomerID) AS Number_of_clients 
	FROM Invoice_ 
	WHERE  BillingState IS NOT NULL
	GROUP BY BillingCity 
	HAVING Number_of_clients >=7;

SELECT * 
	FROM Invoice_ 
	WHERE BillingAddress LIKE '%street%';

SELECT * 
	FROM Invoice_ 
	WHERE BillingAddress LIKE '_1%';


SELECT * 
	FROM Playlist_ 
	ORDER BY Name DESC ;


SELECT * 
	FROM Employee_;

SELECT FirstName , LastName , Title , Country , City 
	FROM Employee_ 
	ORDER BY Country , City ;

SELECT FirstName , LastName , Title , Country , City 
	FROM Employee_ 
	ORDER BY Title DESC  , City ;



SELECT * 
	FROM Album_ 
	JOIN Artist_ 
	ON Album_.ArtistId =Artist_.ArtistId ;


SELECT BillingAddress, Phone , Email  
	FROM Invoice_ 
	JOIN Customer_ 
	ON Invoice_.CustomerId =Customer_.CustomerId 
	WHERE Customer_.CustomerId>50 ;

SELECT CustomerId , BillingAddress 
	FROM Invoice_ 
	WHERE CustomerId BETWEEN 20 and 50;


SELECT * 
	FROM Invoice_;

SELECT City 
	FROM Customer_ 
	UNION ALL 
	SELECT BillingCity  
		FROM Invoice 
	ORDER BY City ;

SELECT * 
	FROM Invoice_
	WHERE EXISTS
		(SELECT City 
		FROM Customer 
		WHERE State IS NOT NULL);

SELECT DISTINCT CustomerId, BillingAddress  
	FROM Invoice_;

SELECT InvoiceId, MAX (Total), BillingAddress 
	FROM Invoice_;
	
SELECT * 
	FROM Invoice_
	LIMIT 5 ;

SELECT * 
	FROM Invoice_
	LIMIT 5, 10 ;

use IKEA_SalesToCustomerDB;

/*Team SQL:Phil Liu, Stella Tang and Diana Bui for MIS-3545 Group Project */
/*Multiple SELECT * queries to display all the records from each table. (Suppose the database has 4 tables, you should create 4 queries for this requirement.)*/

/*Find out info of all the customers*/
Select * 

From Customer;

/*Find out info of all the sales orders*/
Select * 

From Sales;


/*Find out info of all the products*/
Select * 

From Product;

/*Find out info of all the shipments*/
Select * 

From Shipment;

/*Find out info of all the vendors*/
Select * 

From Vendor;

/*A query that uses aggregate function.*/ 
/*This query uses the aggregate function to find the Total purchases in dollor amount by Customer. It's grouped by the first name and last name of each customer.*/ 
Select C.FirstName, C.LastName, SUM(S.SalesPrice) as Total_Purchases_in_dollor
From Customer as C
Join Sales as S 
On C.CustomerID = S.CustomerID
Group by C.FirstName, C.LastName
Go 

/*A query that selects records from two (or multiple) tables using INNER JOIN*/
/*This query uses the inner join to select all rows from the Sales, Product and Shipment Table as long as there is a shipment ID (meaning this needs to be shiped instead of store pick up */ 
/* This gives the managemnt team of what product need to be shipped to where at what time, and which vendor is responsible for the shipping */
Select P.ProductName, S.ShipmentID, Ship.ShipmentAddress, Ship.ScheduledShippingDate, V.VendorName
From Sales as S
Inner Join Product as P 
On S.ProductID = P. ProductID
Inner Join Shipment as Ship
On S.ShipmentID=Ship.ShipmentID 
Inner Join Vendor as V
On V.VendorID = S.VendorID
Order By ShipmentID ASC
Go 

/*A query that selects records from two (or multiple) tables using FULL OUTER JOIN*/ 
/*This query uses outer join to coonect shipment table and sales table and select customer ID between 50 to 60 to see what product they
purchased and if there's any shipping required.
A outer join is necessary because a customer may need shipping from some product but not all. A inner join will exclude the 
product brought by a customer with no need of shipping */
/* Ex. Customer Glinda Hart has part of her purchase need to be shipped and part of her purchase not require shipping. A inner
join will exclude part of her purchases.*/

Select P.ProductName, C.FirstName, C.LastName, S.ShipmentID, Ship.ShipmentAddress
From Sales as S
Join Product as P 
On S.ProductID = P. ProductID 
FULL OUTER JOIN Shipment as Ship
On Ship.ShipmentID= S.ShipmentID
Join Customer as C
on C.CustomerID=S.CustomerID
WHERE C.CustomerID Between 50 and 60
Order By C.CustomerID ASC, S.ShipmentID ASC
Go 

/*A query that uses subquery.*/
/*This query uses a subquery to calculate the total retail prices of sold product based on different product.
Product quntity sold is in sales table and product retail price is in Product Table  */

SELECT 
P.ProductID,
P.ProductName,
P.RetailPrice*
	(
		SELECT SUM(S.Quantity)
		FROM Sales AS S
		WHERE S.ProductID=P.ProductID
		GROUP BY S.ProductID	
	) 
	AS Total_Retail_Price 
FROM
Product as P








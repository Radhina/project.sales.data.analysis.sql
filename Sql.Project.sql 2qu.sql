
--How much Profit Each Customer Generates
 Select o.customerNumber,
        SUM(quantityOrdered * (priceEach - buyPrice)) As Profit
   From products p
   JOIN orderdetails od
     ON p.productCode = od.productCode
   JOIN orders o
     ON od.orderNumber = o.orderNumber
  GROUP BY o.customerNumber;
  
  --Top Five VIP Customers
WITH CustomerProfits AS (
  SELECT o.customerNumber, SUM(quantityOrdered * (priceEach - buyPrice)) AS profit
    FROM products p
    JOIN orderdetails od
      ON p.productCode = od.productCode
    JOIN orders o
      ON o.orderNumber = od.orderNumber
GROUP BY o.customerNumber
)

SELECT c.contactLastName, c.contactFirstname, c.city, c.country, cp.profit
  FROM customers c
  JOIN CustomerProfits cp
    ON C.customerNumber = cp.customerNumber
 ORDER BY cp.profit DESC
 LIMIT 5;
 
--Top Five Least Engaged Customers
WITH CustomerProfits AS (
  SELECT o.customerNumber, SUM(quantityOrdered * (priceEach - buyPrice)) AS profit
    FROM products p
    JOIN orderdetails od
      ON p.productCode = od.productCode
    JOIN orders o
      ON o.orderNumber = od.orderNumber
GROUP BY o.customerNumber
)

SELECT c.contactLastName, c.contactFirstname, c.city, c.country, cp.profit
  FROM customers c
  JOIN CustomerProfits cp
    ON C.customerNumber = cp.customerNumber
 ORDER BY profit ASC
 LIMIT 5;
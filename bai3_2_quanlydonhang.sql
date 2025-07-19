Select * from customer;
Select * from product;
Select * from orders;
Select * from orderdetail;

INSERT INTO customer(cID, cName, cAge)
Values 
(2, 'Ngoc Anh', 20),
(3, 'Hong Ha', 50);


INSERT INTO product(pID, pName, pPrice)
Values 
(3, 'Điều hòa', 7),
(4, 'Quat', 1),
(5, 'Bếp điện', 2);

INSERT INTO orders (oID, cID, oDate)
Values 
(1, 1, '2006/03/21'),
(2, 2, '2006/03/23'),
(3, 1, '2006/03/16');

INSERT INTO orderdetail (oID, pID, odQTY)
Values 
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(2, 3, 8),
(2, 5, 4),
(2, 3, 3);

SELECT oID, cID, oDate FROM orders;

SELECT c.cName, p.pName, o.oDate FROM orders o
JOIN customer c ON o.cID = c.cID
JOIN orderdetail od ON od.oID = o.oID
JOIN product p ON od.pID = p.pID;

SELECT c.cName FROM customer c
LEFT JOIN orders o ON c.cID = o.cID
WHERE o.oID is null;

SELECT od.oID, SUM(od.odQTY*p.pPrice) AS Total FROM orders o
JOIN orderdetail od ON o.oID = od.oID
JOIN product p ON p.pID = od.pID
GROUP BY oID;

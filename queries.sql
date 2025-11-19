--1
SELECT address
FROM House;

--3
SELECT address
FROM House
WHERE bedrooms = 3 AND bathrooms = 2;

--5
SELECT bp.address, p.price
FROM BusinessProperty as bp
JOIN Property as p ON p.address = bp.address
WHERE bp.type = ‘Office’
ORDER BY p.price DESC;

--7
SELECT *
FROM Listings
WHERE agentId = 1;

--9
SELECT agentId, COUNT(buyerId)
FROM Works_With
GROUP BY agentId;
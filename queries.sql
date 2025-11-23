--Kaitlyn Krause and Tara Kerstetter
--1
SELECT address
FROM House;

--2
SELECT H.address, L.mlsNumber
FROM House H
JOIN Listings L ON H.address = L.address;

--3
SELECT address
FROM House
WHERE bedrooms = 3 AND bathrooms = 2;

--4
SELECT address,
       (SELECT price FROM Property WHERE Property.address = House.address) AS price
FROM House
WHERE bedrooms = 3 AND bathrooms = 2
  AND address IN (SELECT address FROM Listings)  
  AND (SELECT price FROM Property WHERE Property.address = House.address)
        BETWEEN 100000 AND 250000
ORDER BY price DESC;

--5
SELECT bp.address, p.price
FROM BusinessProperty as bp
JOIN Property as p ON p.address = bp.address
WHERE bp.type = ‘Office’
ORDER BY p.price DESC;

--6
SELECT agentId, name, phone,
    (SELECT name 
     FROM Firm 
     WHERE Firm.id = Agent.firmId) AS firmName, dateStarted
FROM Agent;

--7
SELECT *
FROM Listings
WHERE agentId = 1;

--8 
SELECT A.name AS agentName, B.name AS buyerName
FROM Works_With W
JOIN Agent A ON W.agentId = A.agentId
JOIN Buyer B ON W.buyerId = B.id
ORDER BY A.name;

--9
SELECT agentId, COUNT(buyerId)
FROM Works_With
GROUP BY agentId;

--10
SELECT H.address, P.price
FROM Buyer B
JOIN House H ON H.bedrooms = B.bedrooms AND H.bathrooms = B.bathrooms
JOIN Property P ON H.address = P.address
WHERE B.id = 001
  AND P.price BETWEEN B.minimumPreferredPrice AND B.maximumPreferredPrice
ORDER BY P.price DESC;

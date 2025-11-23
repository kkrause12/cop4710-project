--Kaitlyn Krause and Tara Kerstetter
DROP DATABASE IF EXISTS Real_Estate;

CREATE DATABASE Real_Estate;
USE Real_Estate;

CREATE TABLE Property(
    address VARCHAR(50),
    ownerName VARCHAR(30),
    price INT,
    PRIMARY KEY(address)
);

CREATE TABLE House(
    bedrooms INT,
    bathrooms INT,
    size INT,
    address VARCHAR(50),
    FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE BusinessProperty(
    type VARCHAR(20),
    size INT,
    address VARCHAR(50),
    FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE Firm(
    id INT,
    name VARCHAR(30),
    address VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE Agent(
    agentId INT,
    name VARCHAR(50),
    phone CHAR(12),
    firmId INT,
    dateStarted DATE,
    PRIMARY KEY(agentId),
    FOREIGN KEY(firmId) REFERENCES Firm(id)
);

CREATE TABLE Listings(
    mlsNumber INT,
    address VARCHAR(50),
    agentId INT,
    dateListed DATE,
    PRIMARY KEY(mlsNumber),
    FOREIGN KEY(address) REFERENCES Property(address),
    FOREIGN KEY(agentId) REFERENCES Agent(agentId)
);

CREATE TABLE Buyer(
    id INT,
    name VARCHAR(30),
    phone CHAR(12),
    propertyType VARCHAR(20),
    bedrooms INT,
    bathrooms INT,
    businessPropertyType VARCHAR(20),
    minimumPreferredPrice INT,
    maximumPreferredPrice INT,
    PRIMARY KEY(id)
);

CREATE TABLE Works_With(
    buyerId INT,
    agentId INT,
    FOREIGN KEY(buyerId) REFERENCES Buyer(id),
    FOREIGN KEY(agentId) REFERENCES Agent(agentId)
);

INSERT INTO Property VALUES
('123 Main St.', 'John Smith', 300000),
('4567 Park Rd.', 'Alice Kennedy', 250000),
('4215 Ragans Ln.', 'Chloe Caldwell', 125000),
('6767 Ford Dr.', 'Michael Jackson', 4000000),
('394 Bronco St.', 'Adam Sandler', 550000),
('7550 Southland Blvd.', 'Maggie Kroft', 135000),
('1800 Pembrook Dr.', 'Maggie Kroft', 75429),
('945 State Rd.', 'Jim Crew', 45000),
('7899 Tennessee St.', 'Kaylee Glep', 100000),
('200 Oak St.', 'Jane Doe', 200000),
('333 Birch Ln.', 'Something Name', 120000),
('3948 Work Ln.', 'Mark Summers', 500000);

INSERT INTO House VALUES
(3, 2, 1223, '123 Main St.'),
(6, 5, 12000, '6767 Ford Dr.'),
(4, 3, 1800, '4567 Park Rd.'),
(4, 2, 1700, '4215 Ragans Ln.'),
(3, 2, 1500, '200 Oak St.'),
(3, 2, 1400, '333 Birch Ln.'),
(3, 2, 2000, '394 Bronco St.');

INSERT INTO BusinessProperty VALUES
('Office', 8215, '7550 Southland Blvd.'),
('Office', 2958, '1800 Pembrook Dr.'),
('Retail', 1585, '945 State Rd.'),
('Retail', 2000, '7899 Tennessee St.'),
('Industrial', 5000, '3948 Work Ln.');

INSERT INTO Firm VALUES
(1, 'Horizon Realty Group', '294 Real Estate Rd.'),
(2, 'BlueOak Realty', '573 House Blvd.'),
(3, 'Summit Property Advisors', '4900 Summit Ln.'),
(4, 'Anchor Point Real Estate', '9593 Island St.'),
(5, 'Prime Edge Properties', '2234 Diamond Ave.');

INSERT INTO Agent VALUES
(1, 'William Afton', '850-999-4848', 3, '1987-10-28'),
(2, 'Janice Vans', '407-738-9583', 4, '2012-04-21'),
(3, 'Alex Davis', '321-932-0467', 5, '2003-12-09'),
(4, 'Sophia Stalls', '407-374-9922', 1, '1994-01-19'),
(5, 'Jeremy Stark', '850-434-0000', 5, '1999-03-17');

INSERT INTO Listings VALUES
(1, '4567 Park Rd.', 1, '2025-08-29'),
(2, '1800 Pembrook Dr.', 5, '2025-10-13'),
(3, '6767 Ford Dr.', 4, '2025-02-01'),
(4, '945 State Rd.', 3, '2025-07-23'),
(5, '123 Main St.', 4, '2025-06-09'),
(6, '200 Oak St.', 2, '2025-11-15'),
(7, '333 Birch Ln.', 1, '2025-10-20');

INSERT INTO Buyer VALUES
(1, 'Melissa Jones', '407-283-8043', 'House', 3, 2, NULL, 100000, 250000),
(2, 'Jonathan Krab', '908-492-4859', 'Business', NULL, NULL, 'Office', 50000, 100000),
(3, 'Benjamin Barnes', '850-233-9589', 'House', 4, 3, NULL, 200000, 400000),
(4, 'Wade White', '392-399-9490', 'Business', NULL, NULL, 'Retail', 50000, 300000),
(5, 'Christina Conner', '403-444-8927', 'House', 2, 2, NULL, 50000, 50000000);

INSERT INTO Works_With VALUES
(1, 1),
(2, 5),
(3, 4),
(4, 3),
(5, 4);

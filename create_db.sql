CREATE DATABASE Real_Estate;

CREATE TABLE Property(
    address VARCHAR(50),
    ownerName VARCHAR(30),
    price INTEGER,
    PRIMARY KEY(address)
);

CREATE TABLE House(
    bedrooms INTEGER,
    bathrooms INTEGER,
    size INTEGER,
    address VARCHAR(50),
    FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE BuisnessProperty(
    type CHAR(20),
    size INTEGER,
    address VARCHAR(50),
    FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE Firm(
    id INTEGER,
    name VARCHAR(30),
    phone CHAR(12),
    firmId INTEGER,
    dateStarted DATE
);

CREATE TABLE Agent(
    agentId INTEGER,
    name VARCHAR(50),
    firmId INTEGER,
    dateStarted DATE
);

CREATE TABLE Listings(
    mlsNumber INTEGER,
    address VARCHAR(50),
    agentId INTEGER,
    dateListed DATE,
    PRIMARY KEY(mlsNumber),
    FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE Buyer(
    id INTEGER,
    name VARCHAR(30),
    phone CHAR(12),
    propertyType CHAR(20),
    bedrooms INTEGER,
    bathrooms INTEGER,
    businessPropertyType CHAR(20),
    minimumPrerferedPrice INTEGER,
    maximumPreferredPrice INTEGER
);

CREATE TABLE Works_With(
    buyerId INTEGER,
    agentID INTEGER
);

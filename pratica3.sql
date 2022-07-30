--1 - CREATE DATABASE drivenBank;

--2 - 
CREATE TABLE states (
	id serial NOT NULL PRIMARY KEY,
 	name text NOT NULL
 	);
 	
-- 3 -
 CREATE TABLE cities (
  id serial NOT NULL PRIMARY KEY,
  name text NOT NULL,
 "stateId" INTEGER NOT NULL REFERENCES states(id)
);
 
--4 -
 CREATE TABLE customers (
  id serial NOT NULL PRIMARY KEY,
  "fullName" text NOT NULL,
  cpf varchar(11) NOT NULL UNIQUE,
  email text NOT NULL UNIQUE,
  password text NOT NULL
);

--5 - 
 CREATE TABLE customersAdress (
  id serial NOT NULL PRIMARY KEY,
  "customersId" INTEGER NOT NULL REFERENCES customers(id),
  street text NOT NULL,
  number INTEGER NOT NULL,
  complement text NOT NULL,
  "postalCode" INTEGER NOT NULL,
  "cityId" INTEGER NOT NULL REFERENCES cities(id)
);

-- 6 - 
 CREATE TABLE customersPhone (
  id serial NOT NULL PRIMARY KEY,
  "customersId" INTEGER NOT NULL REFERENCES customers(id),
  number INTEGER NOT NULL,
  type INTEGER NOT NULL
);

--7 -
 CREATE TABLE bankAccount (
  id serial NOT NULL PRIMARY KEY,
  "customersId" INTEGER NOT NULL REFERENCES customers(id),
  "accountNumber" INTEGER NOT NULL,
  agency INTEGER NOT NULL,
  "openDate" timestamp NOT NULL DEFAULT NOW(),
  "closeDate" timestamp NOT NULL DEFAULT NOW()
);

--8 
CREATE TABLE transactions (
  id serial NOT NULL PRIMARY KEY,
  "bankAccountId" INTEGER NOT NULL REFERENCES bankAccount(id),
  amount double precision NOT NULL,
  type TEXT NOT NULL,
  time timestamp NOT NULL DEFAULT NOW(),
  description text,
	cancelled boolean NOT NULL
);

--9  
CREATE TABLE creditCards (
  id serial NOT NULL PRIMARY KEY,
  "bankAccountId" INTEGER NOT NULL REFERENCES bankAccount(id),
  name TEXT NOT NULL,
  number INTEGER NOT NULL,
  "securityCode" INTEGER NOT NULL,
  "expirationMonth" timestamp NOT NULL,
  "expirationYear" timestamp NOT NULL,
  password text NOT NULL,
  "limit" INTEGER NOT NULL
);

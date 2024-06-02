Create TYPE LostDamaged_Status AS ENUM ('Lost', 'Damaged', 'NoStatus');
Create TYPE CardType AS ENUM ('Physical', 'Electronic', 'None');
CREATE TYPE Status AS ENUM ('Active', 'Inactive');
CREATE TYPE Type AS ENUM ('Family', 'Student', 'Individual', 'Institution');

	
CREATE SEQUENCE seq_Account_Account_ID
	INCREMENT 1
	START 1000;

CREATE SEQUENCE seq_Reader_Reader_ID
	INCREMENT 1
	START 1000;

CREATE SEQUENCE seq_Loan_ID
	INCREMENT 1
	START 1000;


CREATE TABLE IF NOT EXISTS "ReaderCard" (
"ExpirationDate" DATE NOT NULL,
"Card_Type" CardType NOT NULL,
"CardNumber" INT NOT NULL,
"LostDamaged_Status" LostDamaged_Status NOT NULL,
CONSTRAINT "pk_ReaderCard" PRIMARY KEY ("CardNumber")
);

-- Create Table: 'Account'

CREATE TABLE IF NOT EXISTS "Account" (
"AccountID" INTEGER DEFAULT NEXTVAL('seq_Account_Account_ID') NOT NULL,
"Type" 	Type NOT NULL,
"Status" Status NOT NULL,
CONSTRAINT "pk_Account" PRIMARY KEY ("AccountID")
);

-- Create Table: 'Family'

CREATE TABLE IF NOT EXISTS "Family" (
"Family_Name" VARCHAR NOT NULL,
"Email" VARCHAR NOT NULL,
CONSTRAINT "pk_Family" PRIMARY KEY ("Email")
);

-- Create Table: 'Reader'

CREATE TABLE IF NOT EXISTS "Reader" (
"Name" VARCHAR NOT NULL,
"Phone" INT NOT NULL,
"ReaderID" INTEGER DEFAULT NEXTVAL('seq_Reader_Reader_ID') NOT NULL,
"Email" VARCHAR NOT NULL,
CONSTRAINT "pk_Reader" PRIMARY KEY ("ReaderID"),
CONSTRAINT "fk_Reader" FOREIGN KEY ("Email") REFERENCES "Family" ("Email") MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Table: 'Loan'

CREATE TABLE IF NOT EXISTS "Loan" (
"ReturnDate" DATE NOT NULL,
"BorrowDate" DATE NOT NULL,
"DueDate" DATE NOT NULL,
"LoanID" INTEGER DEFAULT NEXTVAL('seq_Loan_ID') NOT NULL,
"ReaderID" INT NOT NULL,
CONSTRAINT "pk_Loan" PRIMARY KEY ("LoanID"),
CONSTRAINT "fk_Loan" FOREIGN KEY ("ReaderID") REFERENCES "Reader" ("ReaderID") MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Table: 'Book'

CREATE TABLE IF NOT EXISTS "Book" (
"Title" VARCHAR NOT NULL,
"Author" VARCHAR NOT NULL,
"BookID" INT NOT NULL,
"ISBN" INT NOT NULL,
"LoanID" INT,
CONSTRAINT "pk_Book" PRIMARY KEY ("BookID"),
CONSTRAINT "fk_Book" FOREIGN KEY ("LoanID") REFERENCES "Loan" ("LoanID") MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions for: 'public'

GRANT ALL ON "ReaderCard" TO GROUP public;
GRANT ALL ON "Account" TO GROUP public;
GRANT ALL ON "Family" TO GROUP public;
GRANT ALL ON "Reader" TO GROUP public;
GRANT ALL ON "Loan" TO GROUP public;
GRANT ALL ON "Book" TO GROUP public;

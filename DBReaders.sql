CREATE TABLE ReaderCard
(
  ExpirationDate DATE NOT NULL,
  Card_Type INT NOT NULL,
  CardNumber INT NOT NULL,
  LostDamaged_Status VARCHAR NOT NULL,
  PRIMARY KEY (CardNumber)
);

CREATE TABLE Account
(
  AccountID INT NOT NULL,
  Type VARCHAR NOT NULL,
  Status VARCHAR NOT NULL,
  PRIMARY KEY (AccountID)
);

CREATE TABLE Family
(
  Family_Name VARCHAR NOT NULL,
  Email VARCHAR NOT NULL,
  AccountID INT NOT NULL,
  PRIMARY KEY (Email),
  FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE Reader
(
  Name VARCHAR NOT NULL,
  Phone INT NOT NULL,
  ReaderID INT NOT NULL,
  Email VARCHAR NOT NULL,
  PRIMARY KEY (ReaderID),
  FOREIGN KEY (Email) REFERENCES Family(Email)
);

CREATE TABLE Loan
(
  ReturnDate DATE NOT NULL,
  BorrowDate DATE NOT NULL,
  DueDate DATE NOT NULL,
  LoanID INT NOT NULL,
  ReaderID INT NOT NULL,
  PRIMARY KEY (LoanID),
  FOREIGN KEY (ReaderID) REFERENCES Reader(ReaderID)
);

CREATE TABLE Book
(
  Title VARCHAR NOT NULL,
  Author VARCHAR NOT NULL,
  BookID INT NOT NULL,
  ISBN INT NOT NULL,
  LoanID INT NOT NULL,
  PRIMARY KEY (BookID),
  FOREIGN KEY (LoanID) REFERENCES Loan(LoanID)
);
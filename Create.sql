-- Create ENUM types for unclear fields
    CREATE TYPE "lost_damaged_status" AS ENUM ('lost', 'damaged', 'NoStatus');

    CREATE TYPE "card_type" AS ENUM ('regular', 'premium');

    CREATE TYPE "institution_type" AS ENUM ('school', 'university', 'other');


-- Create the Reader table
CREATE TABLE IF NOT EXISTS "Reader" (
  "ReaderID" SERIAL PRIMARY KEY,
  "Name" VARCHAR(255) NOT NULL
);
GRANT ALL PRIVILEGES ON TABLE "Reader" TO PUBLIC;

-- Create the Family table
CREATE TABLE IF NOT EXISTS "Family" (
    "FamilyPhone" VARCHAR(20) NOT NULL,
    "FamilyEmail" VARCHAR(255) NOT NULL,
    "FamilyID"  SERIAL PRIMARY KEY
);
GRANT ALL PRIVILEGES ON TABLE "Family" TO PUBLIC;

-- Create the ReaderCard table
CREATE TABLE IF NOT EXISTS "ReaderCard" (
  "CardNumber" SERIAL PRIMARY KEY,
  "LostDamaged_Status" "lost_damaged_status" NOT NULL,
  "CardType" "card_type" NOT NULL,
  "ReaderID" INT NOT NULL,
  FOREIGN KEY ("ReaderID") REFERENCES "Reader"("ReaderID")
);
GRANT ALL PRIVILEGES ON TABLE "ReaderCard" TO PUBLIC;

-- Create the Book table
CREATE TABLE IF NOT EXISTS "Book" (
  "BookID" SERIAL PRIMARY KEY,
  "Title" VARCHAR(255) NOT NULL,
  "Author" VARCHAR(255) NOT NULL,
  "ISBN" VARCHAR(13) NOT NULL
);
GRANT ALL PRIVILEGES ON TABLE "Book" TO PUBLIC;

-- Create the Adult table
CREATE TABLE IF NOT EXISTS "Adult" (
    "Email" VARCHAR(100) NOT NULL,
    "Cellphone" VARCHAR(20) NOT NULL,
    "Occupation" VARCHAR(50) NOT NULL,
    "ReaderID" INT NOT NULL,
    "FamilyID" INT NOT NULL,
    PRIMARY KEY ("ReaderID", "FamilyID"),
    CONSTRAINT "Adult_ReaderID_fkey" FOREIGN KEY ("ReaderID") REFERENCES "Reader"("ReaderID"),
    CONSTRAINT "Adult_FamilyID_fkey" FOREIGN KEY ("FamilyID") REFERENCES "Family"("FamilyID")
);
GRANT ALL PRIVILEGES ON TABLE "Adult" TO PUBLIC;

-- Create the Student table
CREATE TABLE IF NOT EXISTS "Student" (
  "ReaderID" INT PRIMARY KEY,
  "Institution" "institution_type" NOT NULL,
  "StudentID" VARCHAR(20) NOT NULL,
  "StudEmail" VARCHAR(255) NOT NULL,
  FOREIGN KEY ("ReaderID") REFERENCES "Reader"("ReaderID")
);
GRANT ALL PRIVILEGES ON TABLE "Student" TO PUBLIC;

-- Create the Loan table
CREATE TABLE IF NOT EXISTS "Loan" (
  "TransactionID" SERIAL,
  "BorrowDate" DATE NOT NULL,
  "DueDate" DATE NOT NULL,
  "ReaderID" INT NOT NULL,
  "BookID" INT NOT NULL,
  PRIMARY KEY ("TransactionID", "ReaderID", "BookID"),
  FOREIGN KEY ("ReaderID") REFERENCES "Reader"("ReaderID"),
  FOREIGN KEY ("BookID") REFERENCES "Book"("BookID")
);
GRANT ALL PRIVILEGES ON TABLE "Loan" TO PUBLIC;

-- Create the Child table
CREATE TABLE IF NOT EXISTS "Child" (
    "Age" INT NOT NULL,
    "ReaderID" INT NOT NULL,
    "FamilyID" INT NOT NULL,
    PRIMARY KEY ("ReaderID", "FamilyID"),
    CONSTRAINT "Child_ReaderID_fkey" FOREIGN KEY ("ReaderID") REFERENCES "Reader"("ReaderID"),
    CONSTRAINT "Child_FamilyID_fkey" FOREIGN KEY ("FamilyID") REFERENCES "Family"("FamilyID")
);

GRANT ALL PRIVILEGES ON TABLE "Child" TO PUBLIC;



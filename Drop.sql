--
-- Drop Table    : 'Adult'   
--
DROP TABLE if EXISTS "Adult" CASCADE;

--
-- Drop Table    : 'Book'   
--
DROP TABLE if EXISTS "Book" CASCADE;

--
-- Drop Table    : 'Loan'   
--
DROP TABLE if EXISTS "Loan" CASCADE;

--
-- Drop Table    : 'Child'   
--
DROP TABLE if EXISTS "Child" CASCADE;

--
-- Drop Table    : 'Family'   
--
DROP TABLE if EXISTS "Family" CASCADE;

--
-- Drop Table    : 'Reader'   
--
DROP TABLE if EXISTS "Reader" CASCADE;

--
-- Drop Table    : 'ReaderCard'   
--
DROP TABLE if EXISTS "ReaderCard" CASCADE;


--
-- Drop Table    : 'Student'   
--
DROP TABLE if EXISTS "Student" CASCADE;



DROP TYPE IF EXISTS lost_damaged_status CASCADE;
DROP TYPE IF EXISTS card_type CASCADE;
DROP TYPE IF EXISTS institution_type CASCADE;



DROP SEQUENCE IF EXISTS Book_BookID_seq CASCADE;
DROP SEQUENCE IF EXISTS Family_FamilyID_seq CASCADE;
DROP SEQUENCE IF EXISTS Loan_TransactionID_seq CASCADE;
DROP SEQUENCE IF EXISTS Reader_ReaderID_seq CASCADE;
DROP SEQUENCE IF EXISTS ReaderCard_CardNumber_seq CASCADE;

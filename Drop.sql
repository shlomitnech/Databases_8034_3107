--
-- Drop Table    : 'Adult'   
--
DROP TABLE if EXISTS "Adult";

--
-- Drop Table    : 'Book'   
--
DROP TABLE if EXISTS "Book";

--
-- Drop Table    : 'Loan'   
--
DROP TABLE if EXISTS "Loan";

--
-- Drop Table    : 'Child'   
--
DROP TABLE if EXISTS "Child";

--
-- Drop Table    : 'Family'   
--
DROP TABLE if EXISTS "Family";

--
-- Drop Table    : 'Reader'   
--
DROP TABLE if EXISTS "Reader";

--
-- Drop Table    : 'RaederCard'   
--
DROP TABLE if EXISTS "ReaderCard";


--
-- Drop Table    : 'Student'   
--
DROP TABLE if EXISTS "Student";



DROP TYPE IF EXISTS lost_damaged_status;
DROP TYPE IF EXISTS card_type;
DROP TYPE IF EXISTS institution_type;



DROP SEQUENCE Book_BookID_seq;
DROP SEQUENCE Family_FamilyID_seq;
DROP SEQUENCE Loan_TransactionID_seq;
DROP SEQUENCE Reader_ReaderID_seq;
DROP SEQUENCE ReaderCard_CardNumber_seq;

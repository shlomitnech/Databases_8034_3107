# Databases_8034_3107
This database is designed to store information about Readers in a library and their information. This includes their family members, books on loan and library card. The database consists of seven tables: Reader, Family, ReaderCard, Book, Adult, Student, and Loan.

The Reader table stores information about individual readers. Each reader has a unique ReaderID, name, and other details.
The Family table stores information about families. Each family has a unique FamilyID, phone number, email, and other details.
The ReaderCard table stores information about reader cards. Each card has a unique CardNumber, LostDamaged_Status, CardType, and ReaderID.
The Book table stores information about books. Each book has a unique BookID, title, author, ISBN, and other details.
The Loan table stores information about loans. Each loan has a unique TransactionID, BorrowDate, DueDate, ReaderID, and BookID.
The Adult table stores information about adult readers. Each adult has a unique ReaderID, email, cellphone number, occupation, and FamilyID.
The Child table stores information about child readers. Each child has a unique ReaderID, Age, and FamilyID.
The Student table stores information about student readers. Each student has a unique ReaderID, institution, StudentID, and email.


ERD:

<img width="552" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/146c0ee5-be4d-4c77-b3c2-91b17aa64d5a">

DSD:

<img width="453" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/e48339af-4173-4f8a-b713-3ae651c74400">

All that is below is documented in the Queries.sql, ParamsQueries.sql, Constraints.sql and the log.log file

If you check out the beginning of the log.log file you will see that we made 8 queries

--Select all the Reader ID and names of readers who have lost or damaged cards Time: 68.177 ms
--Select all the Reader ID, names and ages of children under the age of 6: 25.424 ms
--Select all the reader ID, name and title of book with which the authors name is Michael Jackson  50.536 ms
--Select all the family id, phone and email of families whos' size is greater than or equal to 4 and have more than 2 children 274.313 ms
--To update the Student's ReaderCards to be Premium and NoStatus in terms of lost or damaged 205.373 ms
--To update all the due dates for children under the age of 5 by 3 days 352.704 ms
--deletes all the loans from students that are past their due date 72.902 ms
--Delete the readers (and their readercard) of all children readers >= 18 10.696 ms
-=Delete all children with FamilyID 57250737 13.581 ms
-- Delete all adults with FamilyID 57250737 3.851 ms
-- Delete the family with FamilyID 57250737 16.571 ms

Parameterized queries:
--Select All Books by a Specific Author 20.074 --Time after index:  4.418
--Select All Children Older Than a Given Age  14.206 ms-- Time after index: 14.911 ms
--Select all Books on loan from a Reader  13.026 ms -- Time after index: 11.525 ms
--Increment/update Child age by 1 11.749 ms --Time after index: Time: 10.874 ms

We made indexes that sped up previous queries above
-- Create an index on Age column
-- Create an index on the Author column
-- Create an index on BorrowDate column
-- Create an index on DueDate column

We made constraints
-- Add unique constraint on ReaderID in Reader table
-- Add check constraint on Age in Child table to ensure it's within a valid range
-- Add foreign key constraint on ReaderID in Loan table referencing Reader table
-- Add foreign key constraint on BookID in Loan table referencing Book table
-- Add check constraint on BorrowDate to ensure it's not in the future
-- Add check constraint on DueDate to ensure it's not before BorrowDate

--TO CHECK THE CONSTRAINTS ABOVE View the error messages below:
--ERROR:  Failing row contains (20, 100002, 2).new row for relation "Child" violates check constraint "chk_valid_age" 
--ERROR:  Failing row contains (1, 2024-06-15, 2024-06-10, 199347, 259025, null).new row for relation "Loan" violates check constraint "chk_due_date" 
--ERROR: Referential integrity violation

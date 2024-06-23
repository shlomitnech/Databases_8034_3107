This database is designed to store information about Readers in a library and their information. This includes their family members, books on loan and library card. The database consists of seven tables: Reader, Family, ReaderCard, Book, Adult, Student, and Loan.

The Reader table stores information about individual readers. Each reader has a unique ReaderID, name, and other details.
The Family table stores information about families. Each family has a unique FamilyID, phone number, email, and other details.
The ReaderCard table stores information about reader cards. Each card has a unique CardNumber, LostDamaged_Status, CardType, and ReaderID.
The Book table stores information about books. Each book has a unique BookID, title, author, ISBN, and other details.
The Loan table stores information about loans. Each loan has a unique TransactionID, BorrowDate, DueDate, ReaderID, and BookID.
The Adult table stores information about adult readers. Each adult has a unique ReaderID, email, cellphone number, occupation, and FamilyID.
The Child table stores information about child readers. Each child has a unique ReaderID, Age, and FamilyID.
The Student table stores information about student readers. Each student has a unique ReaderID, institution, StudentID, and email.

<br />
ERD:
<br />
<img width="552" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/146c0ee5-be4d-4c77-b3c2-91b17aa64d5a">
<br />
DSD:
<br />
<img width="453" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/e48339af-4173-4f8a-b713-3ae651c74400">
<br />
All that is below is documented in the Queries.sql, ParamsQueries.sql, Constraints.sql and the log.log file

In the GenerateDataa.py file we generated the data for the Readers. There are 200,000 readers in the database. 100,000 adults, 50,000 children, and 50,000 students.


If you check out the beginning of the log.log file you will see that we made 8 queries 
Here are the queries and some having example pictures of what it looked like.

--Select all the Reader ID and names of readers who have lost or damaged cards Time: 68.177 ms
<br />
Here is what it looks like in the log file
<br />
<img width="240" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/a1eae36a-533a-4260-8bde-ca6eaa5948a9">
--Select all the Reader ID, names and ages of children under the age of 6: 25.424 ms
here is what it looks like in the log file
<br />
<img width="354" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/6a758a48-ad90-482b-91c5-b4bcdf1433f5">
<br />
--Select all the reader ID, name and title of book with which the authors name is Michael Jackson  50.536 ms
Here is an example of what it would look like in pgAdmin
<br />
<img width="205" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/cc641dad-f349-4fb7-8ded-4f607787cbf5">
<br />
--Select all the family id, phone and email of families whos' size is greater than or equal to 4 and have more than 2 children 274.313 ms
<br />
<img width="581" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/e2559c33-03c1-4ffa-8fec-13f1afe269f5">
<br />
--To update the Student's ReaderCards to be Premium and NoStatus in terms of lost or damaged 205.373 ms
<br />
--To update all the due dates for children under the age of 5 by 3 days 352.704 ms
<br />
Here is what the updates looks like in the log file
<img width="100" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/d3dc294e-3e19-48c1-9518-7c1c971fa59b">

--deletes all the loans from students that are past their due date 72.902 ms
<br />
<img width="58" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/3362d9f7-fb6e-47c9-9466-0838dbc99bff">
<br />
--Delete the readers (and their readercard) of all children readers >= 18 
<br />
-=Delete all children with FamilyID 57250737 13.581 ms
<br />
-- Delete all adults with FamilyID 57250737 3.851 ms
<br />
-- Delete the family with FamilyID 57250737 16.571 ms
<br />

Parameterized queries:
<br />
--Select All Books by a Specific Author 20.074 --Time after index:  4.418
<br />
<img width="709" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/9a12b7f8-8976-473e-bc39-aeeb95b3e5ff">
<br />
--Select All Children Older Than a Given Age  14.206 ms-- Time after index: 14.911 ms
<br />
<img width="510" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/26ed549c-91fd-45f4-98fc-51bc68db5053">
<br />
--Select all Books on loan from a Reader  13.026 ms -- Time after index: 11.525 ms
<br />
<img width="683" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/55943b7c-65c1-47d9-84c8-2d5c5ca7e7de">
<br />
--Increment/update Child age by 1 11.749 ms --Time after index: Time: 10.874 ms
<br />
Before the query: 
<br />
<img width="633" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/3f5ea0ed-3b31-49ec-8312-cf547966c2c0">
<br />
Query: <img width="268" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/c763f1cc-6331-443c-9f17-7cc553b5bbd3">
<br />
After the Query:
<br />
<img width="274" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/7bb464b0-9790-4fa1-a1a1-e42facbbcc51">
<br />
We made indexes that sped up previous queries above
<br />
-- Create an index on Age column
-- Create an index on the Author column
-- Create an index on BorrowDate column
-- Create an index on DueDate column
Here is a time table from before and after the indexes were made: 
<img width="358" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/bb7a3bd4-ead1-4297-b714-4780dc723851">

We made constraints
-- Add unique constraint on ReaderID in Reader table
-- Add check constraint on Age in Child table to ensure it's within a valid range
-- Add foreign key constraint on ReaderID in Loan table referencing Reader table
-- Add foreign key constraint on BookID in Loan table referencing Book table
-- Add check constraint on BorrowDate to ensure it's not in the future
-- Add check constraint on DueDate to ensure it's not before BorrowDate

--TO CHECK THE CONSTRAINTS ABOVE View the error messages below:
<img width="248" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/e0ff484f-2121-47ec-b709-0445ed4c8815">

--ERROR:  Failing row contains (20, 100002, 2).new row for relation "Child" violates check constraint "chk_valid_age" 
--ERROR:  Failing row contains (1, 2024-06-15, 2024-06-10, 199347, 259025, null).new row for relation "Loan" violates check constraint "chk_due_date" 
--ERROR: Referential integrity violation

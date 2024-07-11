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
<br />
--Select all the Reader ID and names of readers who have lost or damaged 
cards
<br />
<br />
Time: 501.631 ms

<br />
Here is what it looks like in the log file
<br />
<img width="240" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/a1eae36a-533a-4260-8bde-ca6eaa5948a9">
--Select all the Reader ID, names and ages of children under the age of 6: 72.933 ms
here is what it looks like in the log file
<br />
<img width="354" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/6a758a48-ad90-482b-91c5-b4bcdf1433f5">
<br />
--Select all the reader ID, name and title of book with which the authors name is Michael Jackson 
<br />
Time: 160.171 ms
<br />
Here is an example of what it would look like in pgAdmin
<br />
<img width="205" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/cc641dad-f349-4fb7-8ded-4f607787cbf5">
<br />
--Select all the family id, phone and email of families whos' size is greater than or equal to 4 and have more than 2 children
<br />
Time: 855.246 ms
<br />
<img width="581" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/e2559c33-03c1-4ffa-8fec-13f1afe269f5">
<br />
--To update the Student's ReaderCards to be Premium and NoStatus in terms of lost or damaged 
<br />
613.883 ms
<br />
--To update all the due dates for children under the age of 5 by 3 days
<br />
Time: 352.704 ms
<br />
Here is what the updates looks like in the log file
<img width="100" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/d3dc294e-3e19-48c1-9518-7c1c971fa59b">

--deletes all the loans from students that are past their due date
<br />
Time: 120.755 ms

<br />
<img width="58" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/3362d9f7-fb6e-47c9-9466-0838dbc99bff">
<br />
--Delete the readers (and their readercard) of all children readers >= 18
<br />
Time: 22.261 ms
<br />
-Delete all children with FamilyID 57250737 22.368 ms
<br />
 Delete all adults with FamilyID 57250737  32.820 ms
<br />
-Delete the family with FamilyID 57250737 13.886 ms
<br />

Parameterized queries:
<br />
--Select All Books by a Specific Author 
<br />
Time: 21.826 ms
<br />
<img width="709" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/9a12b7f8-8976-473e-bc39-aeeb95b3e5ff">
<br />
--Select All Children Older Than a Given Age
<br />
Time: 15.254 ms
<br />
<img width="510" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/26ed549c-91fd-45f4-98fc-51bc68db5053">
<br />
--Select all Books on loan from a Reader
<br />
Time: 22.499 ms
<br />

<br />
<img width="683" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/55943b7c-65c1-47d9-84c8-2d5c5ca7e7de">
<br />
--Increment/update Child age by 1 
Time: 2.456 ms
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

<br />
Stage 3
Here are four more queries that use two or three table joins. The queries are located at the bottom of the Queries.sql file.
Select all books loaned by children (under the age of 18) with their due dates and the names of the children (590 ms)
<br />
<img width="584" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/bcd18282-91e3-41b2-b759-c6a4cb6b41fd">
<br />
Select all families along with the number of adult members and children they have (1589 ms)
<br />
<img width="495" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/8f9b6483-9615-4771-8df3-2e500ec976d2">
<br />
--Students ID, their cards and their loan numbers ( 795 ms)
<br />
<img width="426" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/e4c29248-7461-4ddf-9d13-4c0bcad27ebe">
<br />

We also created Views that can be viewed in the Views.sql file uploaded. Here is a description of our views.

View #1 premium vs regular student cards
<br />

<img width="342" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/cf4aafc7-bae8-4373-b2e5-e9ca2bfdd7fe">
<br />

View #2 count the number of families by the number of children
<br />
Some errors came up with the insert when you tried to insert into a family that doesn't exist.
<br />

<img width="343" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/4907ebcd-fab0-46c1-b9f2-06c6e81c5a01">
<br />

View #3 All the Readers with current Loans
<br />
![image](https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/267a40ed-b28a-43d6-abf6-12408cca9ddf)
<br />

View #4 To view child readers and their family info
<br />
![image](https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/e1e504a3-c959-4d0e-9b4a-7d4ebba9a580)
<br />



We then made functions to replace some of the queries we have above. This can be viewed in the functions.sql file. Here is a description of them.
A function to get all the large families, their information and their size and children size.
<br />
<img width="294" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/7d9aae96-2446-4dac-b250-06761be40890">
<br />

A function to get the readers with lost of damaged cards
<br />
<img width="185" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/13902b1a-f294-4741-82d2-6a1d3917ff12">
<br />

A function to get the children under the age of 6
<br />
<img width="177" alt="image" src="https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/23184c07-8512-4f83-978f-93dcd3d56ace">
<br />
A function to select large families
<br />
![image](https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/0c99acfd-ac2e-4408-a6b1-c2868ad5033a)
<br />

A Function that categorizes the children into different age groups
<br />
![image](https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/c46c5b11-74d2-4828-b6e5-b83463b0a2ed)
<br />

A function to count the loans each reader has
<br />
![image](https://github.com/shlomitnech/Databases_8034_3107/assets/98982263/9234b15f-c53b-4e41-a90f-7159b49a6635)
<br />




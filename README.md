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

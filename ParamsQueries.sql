--#1
--Select All Books by a Specific Author
PREPARE get_books_by_author (varchar) AS
SELECT "BookID", "Title", "Author", "ISBN"
FROM public."Book"
WHERE "Author" = $1;
--timing .947
EXECUTE get_books_by_author ('Michael Jackson');
--Time: 21.826 ms
--After Indexing: Time: 4.055 ms

--#2
--Select All Children Older Than a Given Age
PREPARE get_children_older_than (int) AS
SELECT "ReaderID", "Age", "FamilyID"
FROM public."Child"
WHERE "Age" > $1;
-- timing 0.358 ms
EXECUTE get_children_older_than (10);
--Time: 15.254 ms
--After Indexing: Time: 14.489 ms

--#3
--Select all Books on loan from a Reader
PREPARE get_loans_by_reader (integer) AS
SELECT "TransactionID", "BorrowDate", "DueDate", "ReaderID", "BookID"
FROM public."Loan"
WHERE "ReaderID" = $1;
--Time: 0.448 ms
EXECUTE get_loans_by_reader (106655);
--Time: 22.499 ms
--After Indexing: Time: 16.287 ms

--#4
--Increment/update Child age by 1
-- Prepare the parameterized update query
PREPARE increment_child_age (integer) AS
UPDATE public."Child"
SET "Age" = "Age" + 1
WHERE "ReaderID" = $1;
--Time: 0.253 ms
-- Execute the query with a specific ReaderID
EXECUTE increment_child_age (100001); -- Increment age of Child with ReaderID 12345 by 1
--Time: 9.903 ms, Time: 2.456 ms
--After Indexing: Time: 3.503 ms, Time: 3.294 ms



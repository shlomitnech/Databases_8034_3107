
--Select All Books by a Specific Author
PREPARE get_books_by_author (varchar) AS
SELECT "BookID", "Title", "Author", "ISBN"
FROM public."Book"
WHERE "Author" = $1;
--timing .947
EXECUTE get_books_by_author ('Michael Jackson');
--timing 20.074
--timing after index:  4.418


--Select All Children Older Than a Given Age
PREPARE get_children_older_than (int) AS
SELECT "ReaderID", "Age", "FamilyID"
FROM public."Child"
WHERE "Age" > $1;
-- timing 0.358 ms
EXECUTE get_children_older_than (10);
-- Time: 14.206 ms
-- Time after index: 14.911 ms

--Select all Books on loan from a Reader
PREPARE get_loans_by_reader (integer) AS
SELECT "TransactionID", "BorrowDate", "DueDate", "ReaderID", "BookID"
FROM public."Loan"
WHERE "ReaderID" = $1;
--Time: 0.448 ms
EXECUTE get_loans_by_reader (106655);
--Time: 13.026 ms
--Time after index: 11.525 ms

--Increment/update Child age by 1
-- Prepare the parameterized update query
PREPARE increment_child_age (integer) AS
UPDATE public."Child"
SET "Age" = "Age" + 1
WHERE "ReaderID" = $1;
--Time: 0.253 ms
-- Execute the query with a specific ReaderID
EXECUTE increment_child_age (100001); -- Increment age of Child with ReaderID 12345 by 1
--Time: 11.749 ms
--time after index: Time: 10.874 ms


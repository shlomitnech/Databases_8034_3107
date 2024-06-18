
--Select All Books by a Specific Author
PREPARE get_books_by_author (varchar) AS
SELECT "BookID", "Title", "Author", "ISBN"
FROM public."Book"
WHERE "Author" = $1;

EXECUTE get_books_by_author ('Michael Jackson');



--Select All Children Older Than a Given Age
PREPARE get_children_older_than (int) AS
SELECT "ReaderID", "Age", "FamilyID"
FROM public."Child"
WHERE "Age" > $1;

EXECUTE get_children_older_than (10);


--Select all Books on loan from a Reader
PREPARE get_loans_by_reader (integer) AS
SELECT "TransactionID", "BorrowDate", "DueDate", "ReaderID", "BookID"
FROM public."Loan"
WHERE "ReaderID" = $1;

EXECUTE get_loans_by_reader (106655);


--Increment/update Child age by 1
-- Prepare the parameterized update query
PREPARE increment_child_age (integer) AS
UPDATE public."Child"
SET "Age" = "Age" + 1
WHERE "ReaderID" = $1;

-- Execute the query with a specific ReaderID
EXECUTE increment_child_age (100001); -- Increment age of Child with ReaderID 12345 by 1


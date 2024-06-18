
--INDEXES
-- Create an index on Age column
CREATE INDEX idx_age ON public."Child" ("Age");

-- Create an index on the Author column
CREATE INDEX idx_author ON public."Book" ("Author");


-- Create an index on BorrowDate column
CREATE INDEX idx_borrow_date ON public."Loan" ("BorrowDate");

-- Create an index on DueDate column
CREATE INDEX idx_due_date ON public."Loan" ("DueDate");


--CONSTRAINTS
-- Add unique constraint on ReaderID in Reader table
ALTER TABLE public."Reader" ADD CONSTRAINT uniq_reader_id UNIQUE ("ReaderID");

-- Add check constraint on Age in Child table to ensure it's within a valid range
ALTER TABLE public."Child" ADD CONSTRAINT chk_valid_age CHECK ("Age" >= 0 AND "Age" <= 18);

-- Add foreign key constraint on ReaderID in Loan table referencing Reader table
ALTER TABLE public."Loan" ADD CONSTRAINT fk_loan_reader_id FOREIGN KEY ("ReaderID") REFERENCES public."Reader" ("ReaderID");

-- Add foreign key constraint on BookID in Loan table referencing Book table
ALTER TABLE public."Loan" ADD CONSTRAINT fk_loan_book_id FOREIGN KEY ("BookID") REFERENCES public."Book" ("BookID");

-- Add check constraint on BorrowDate to ensure it's not in the future
ALTER TABLE public."Loan" ADD CONSTRAINT chk_borrow_date CHECK ("BorrowDate" <= CURRENT_DATE);

-- Add check constraint on DueDate to ensure it's not before BorrowDate
ALTER TABLE public."Loan" ADD CONSTRAINT chk_due_date CHECK ("DueDate" >= "BorrowDate");


--TO CHECK THE CONSTRAINTS ABOVE:
-- INSERT queries
BEGIN;
INSERT INTO public."Reader" ("ReaderID", "Name") VALUES (1, 'John'); -- Valid 
---- ERROR:  duplicate key value violates unique constraint "Reader_pkey"   SQL state: 23505 Detail: Key ("ReaderID")=(1) already exists.
INSERT INTO public."Reader" ("ReaderID", "Name") VALUES (1, 'Jane'); -- Error: Duplicate ReaderID
INSERT INTO public."Child" ("Age", "ReaderID", "FamilyID") VALUES (20, 100002, 2); --ERROR:  Failing row contains (20, 100002, 2).new row for relation "Child" violates check constraint "chk_valid_age" 
COMMIT;

-- UPDATE queries
BEGIN;
UPDATE public."Reader" SET "Name" = 'Mike' WHERE "ReaderID" = 1; 
UPDATE public."Child" SET "Age" = 15 WHERE "ReaderID" = 1; 
UPDATE public."Loan" SET "BorrowDate" = '2024-06-15' WHERE "TransactionID" = 1; 
UPDATE public."Loan" SET "DueDate" = '2024-06-10' WHERE "TransactionID" = 1; 
--ERROR:  Failing row contains (1, 2024-06-15, 2024-06-10, 199347, 259025, null).new row for relation "Loan" violates check constraint "chk_due_date" 
COMMIT;

-- DELETE queries
BEGIN;
DELETE FROM public."Reader" WHERE "ReaderID" = 1; -- Error: Referential integrity violation
DELETE FROM public."Child" WHERE "ReaderID" = 1; -- Valid
DELETE FROM public."Loan" WHERE "TransactionID" = 1; -- Valid
COMMIT;

--View # 1 
--View all readers and their loans, and loan info
CREATE OR REPLACE VIEW combined_reader_loans_books AS
SELECT
    R."ReaderID",
    R."Name",
    L."TransactionID",
    L."BorrowDate",
    L."DueDate",
    B.bookid,
    B.title,
    B.genre,
    B.condition,
    A.authorid,
    A.authorname,
    A.rating
FROM
    public."Reader" R
JOIN 
    public."Loan" L ON R."ReaderID" = L."ReaderID"
JOIN 
    dblink('dbname=Book user=postgres password=Hadas1994', 
           'SELECT bookid, title, genre, condition FROM book') 
    AS B(bookid INT, title TEXT, genre TEXT, condition TEXT)
ON 
    L."BookID" = B.bookid
JOIN 
    dblink('dbname=Book user=postgres password=Hadas1994', 
           'SELECT bookid, authorid FROM writtenby') 
    AS WB(bookid INT, authorid INT)
ON 
    B.bookid = WB.bookid
JOIN 
    dblink('dbname=Book user=postgres password=Hadas1994', 
           'SELECT authorid, authorname, rating FROM author') 
    AS A(authorid INT, authorname TEXT, rating INT)
ON 
    WB.authorid = A.authorid;


SELECT *
FROM combined_reader_loans_books
WHERE "ReaderID" = 92024;


SELECT *
FROM combined_reader_loans_books
WHERE genre = 'Fiction';

UPDATE author
SET rating = 5
WHERE authorid IN (
    SELECT A.authorid
    FROM combined_reader_loans_books AS CRLB
    JOIN dblink('dbname=Book user=postgres password=Hadas1994',
               'SELECT authorid FROM author')
        AS A(authorid INT)
    ON CRLB.authorid = A.authorid
    WHERE CRLB.bookid = 1
);

INSERT INTO public."Loan" ("TransactionID", "BorrowDate", "DueDate", "BookID", "ReaderID")
VALUES (1, '2024-08-02', '2024-08-09', 1, 1);

--View 2 : Students and their loan info
CREATE OR REPLACE VIEW student_loans_books AS
SELECT
    S."ReaderID",
    S."StudEmail",
    S."Institution",
    S."StudentID",
    L."TransactionID",
    L."BorrowDate",
    L."DueDate",
    B.bookid,
    B.title,
    B.genre,
    B.condition
FROM
    public."Student" S
JOIN
    public."Loan" L ON S."ReaderID" = L."ReaderID"
JOIN 
    dblink('dbname=Book user=postgres password=Hadas1994', 
           'SELECT bookid, title, genre, condition FROM book') 
    AS B(bookid INT, title TEXT, genre TEXT, condition TEXT)
ON 
    L."BookID" = B.bookid;


SELECT *
FROM student_loans_books
WHERE "StudentID" = '"91045522"';

SELECT *
FROM student_loans_books
WHERE genre = 'Fiction';



UPDATE book
SET condition = 'Excellent'
WHERE bookid IN (
    SELECT bookid
    FROM student_loans_books
    WHERE bookid = 1
);

INSERT INTO public."Loan" ("TransactionID", "BorrowDate", "DueDate", "BookID", "ReaderID")
VALUES (2, '2024-08-02', '2024-08-09', 2, (
    SELECT "ReaderID"
    FROM public."Student"
    WHERE "StudentID" = '"91045522"'
));

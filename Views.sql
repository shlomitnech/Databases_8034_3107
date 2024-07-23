--View 1
-- Create a view for all active students and their corresponding reader cards
CREATE VIEW students_reader_cards AS
SELECT
    s."ReaderID",
    s."StudentID",
    s."StudEmail",
    s."Institution",
    rc."CardNumber",
    rc."CardType",
    rc."LostDamaged_Status"
FROM public."Student" s
JOIN public."ReaderCard" rc ON s."ReaderID" = rc."ReaderID";

--View 2
-- Create a summary view to count the number of students with premium and regular cards
CREATE VIEW student_card_summary AS
SELECT
    rc."CardType",
    COUNT(*) AS "NumberOfStudents"
FROM public."Student" s
JOIN public."ReaderCard" rc ON s."ReaderID" = rc."ReaderID"
GROUP BY rc."CardType";

-- Select from the summary view to visualize the data
SELECT *
FROM student_card_summary;

-- Insert a new student and their reader card
INSERT INTO public."Student" ("ReaderID", "StudentID", "StudEmail", "Institution")
VALUES (123456, 'S12345', 'student12345@example.com', 'University');

INSERT INTO public."ReaderCard" ("ReaderID", "CardNumber", "CardType", "LostDamaged_Status")
VALUES (123456, 'RC123456', 'premium', 'NoStatus');

-- Update a student's card type to premium
UPDATE public."ReaderCard"
SET "CardType" = 'premium'
WHERE "ReaderID" = 123456;

-- Delete a student and their reader card
DELETE FROM public."ReaderCard"
WHERE "ReaderID" = 123456;

DELETE FROM public."Student"
WHERE "ReaderID" = 123456;


--View 3
-- Create a view to count the number of families by the number of children
CREATE VIEW family_size_distribution AS
SELECT
    num_children AS "FamilySize",
    COUNT(*) AS "NumberOfFamilies"
FROM (
    SELECT
        "FamilyID",
        COUNT(*) AS num_children
    FROM public."Child"
    GROUP BY "FamilyID"
) AS family_sizes
GROUP BY num_children;

-- Select from the family_size_distribution view to visualize the data
SELECT *
FROM family_size_distribution
ORDER BY "FamilySize";

-- Insert a new child into a family
INSERT INTO public."Child" ("Age", "ReaderID", "FamilyID")
VALUES (8, 123456, 1);

-- Update a child's age in a family
UPDATE public."Child"
SET "Age" = 9
WHERE "ReaderID" = 123456;

-- Delete a child from a family
DELETE FROM public."Child"
WHERE "ReaderID" = 123456;

--View 4
--View all readers with loan info
CREATE VIEW AllReadersWithLoans AS
SELECT 
    R."ReaderID", 
    R."Name", 
    L."TransactionID", 
    L."BorrowDate", 
    L."DueDate", 
    B."Title" AS BookTitle
FROM 
    public."Reader" R
JOIN 
    public."Loan" L ON R."ReaderID" = L."ReaderID"
JOIN 
    public."Book" B ON L."BookID" = B."BookID";

--Show the view "AllReadersWithLoans"
SELECT * 
FROM AllReadersWithLoans

--Insert into AllReadersWithLoans
INSERT INTO public."Reader" ("ReaderID", "Name") VALUES (2000005, 'Chris Brown');
INSERT INTO public."Book" ("BookID", "Title", "Author", "ISBN") VALUES (2000002, 'Another Book', 'Another Author', '9876543210987');
INSERT INTO public."Loan" ("TransactionID", "BorrowDate", "DueDate", "ReaderID", "BookID") VALUES (20002, '2023-08-01', '2023-08-15', 2000005, 2000002);

--Update AllReadersWithLoans
UPDATE public."Loan"
SET "DueDate" = '2023-08-20'
WHERE "TransactionID" = 20002 AND "ReaderID" = 2000005 AND "BookID" = 2000002;

UPDATE public."Reader"
SET "Name" = 'Christopher Brown'
WHERE "ReaderID" = 2000005;

--Delete from AllReadersWithLoans
DELETE FROM public."Loan"
WHERE "TransactionID" = 20002 AND "ReaderID" = 2000005 AND "BookID" = 2000002;

DELETE FROM public."Reader"
WHERE "ReaderID" = 2000005;

DELETE FROM public."Book"
WHERE "BookID" = 2000002;


--View 5
--View for Child Readers and their Family information
CREATE VIEW ChildFamilyInfo AS
SELECT 
    R."ReaderID", 
    R."Name", 
    C."Age", 
    F."FamilyPhone", 
    F."FamilyEmail"
FROM 
    public."Reader" R
JOIN 
    public."Child" C ON R."ReaderID" = C."ReaderID"
JOIN 
    public."Family" F ON C."FamilyID" = F."FamilyID";

--Show the view ChildFamilyInfo
SELECT *
FROM ChildFamilyInfo

--Insert into ChildFamilyInfo
INSERT INTO public."Family" ("FamilyID", "FamilyPhone", "FamilyEmail") VALUES (200000, '444-555-6666', 'another.family@example.com');
INSERT INTO public."Reader" ("ReaderID", "Name") VALUES (200003, 'Jake Doe');
INSERT INTO public."Child" ("ReaderID", "FamilyID", "Age") VALUES (200003, 200000, 8);

--Update ChildFamilyInfo
UPDATE public."Child"
SET "Age" = 9
WHERE "ReaderID" = 200003;

UPDATE public."Family"
SET "FamilyEmail" = 'new.email@example.com'
WHERE "FamilyID" = 200000;

--Delete from ChildFamilyInfo
DELETE FROM public."Child"
WHERE "ReaderID" = 200003;

DELETE FROM public."Reader"
WHERE "ReaderID" = 200003;

DELETE FROM public."Family"
WHERE "FamilyID" = 200000;

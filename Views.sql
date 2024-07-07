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

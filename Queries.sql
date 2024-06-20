
--to get the Reader ID and names of readers who have lost or damaged cards
SELECT r."ReaderID", r."Name"
FROM public."Reader" r
JOIN public."ReaderCard" rc ON r."ReaderID" = rc."ReaderID"
WHERE rc."LostDamaged_Status" IN ('lost', 'damaged');
--501.631 ms
--After indexing: 315.402 ms

--to get the Reader ID, names and ages of children under the age of 6
SELECT r."ReaderID", r."Name", c."Age"
FROM public."Reader" r
JOIN public."Child" c ON r."ReaderID" = c."ReaderID"
WHERE c."Age" < 6;
--72.933 ms
--After Indexing: 55.869 ms


--to get the reader ID, name and title of book with which the authors name is Michael Jackson
SELECT r."ReaderID", r."Name", b."Title"
FROM public."Reader" r
JOIN public."Loan" l ON r."ReaderID" = l."ReaderID"
JOIN public."Book" b ON l."BookID" = b."BookID"
WHERE b."Author" = 'Michael Jackson';
--160.171 ms
--After indexing: 19.918 ms

--to get the family id, phone and email of families whos' size is greater than or equal to 4 and have more than 2 children
SELECT f."FamilyID", f."FamilyPhone", f."FamilyEmail", 
       COUNT(a."ReaderID") + COUNT(c."ReaderID") AS "MemberCount",
       COUNT(c."ReaderID") AS "ChildCount"
FROM public."Family" f
LEFT JOIN public."Adult" a ON f."FamilyID" = a."FamilyID"
LEFT JOIN public."Child" c ON f."FamilyID" = c."FamilyID"
GROUP BY f."FamilyID"
HAVING COUNT(a."ReaderID") + COUNT(c."ReaderID") >= 4
   AND COUNT(c."ReaderID") > 2;
--855.246 ms
--After indexing: 535.345 ms

----------To update the Student's ReaderCards to be Premium and NoStatus in terms of lost or damaged
UPDATE public."ReaderCard" rc
SET "CardType" = 'premium', "LostDamaged_Status" = 'NoStatus'
FROM public."Student" s
WHERE rc."ReaderID" = s."ReaderID"
  AND s."Institution" = 'university';
--613.883 ms
--After indexing: 481.540 ms

--to view the change from above
-- SELECT rc."CardNumber", rc."ReaderID", rc."CardType", rc."LostDamaged_Status", s."Institution", s."StudentID", s."StudEmail"
-- FROM public."ReaderCard" rc
-- JOIN public."Student" s ON rc."ReaderID" = s."ReaderID"
-- WHERE s."Institution" = 'university';


---------To update all the due dates for children under the age of 5 by 3 days
UPDATE public."Loan" l
SET "DueDate" = "DueDate" + INTERVAL '3 days'
FROM public."Child" c
WHERE l."ReaderID" = c."ReaderID"
  AND c."Age" < 10;

  --352.704 ms
  --1040.667 ms (00:01.041)

--To view the result:
-- SELECT l."TransactionID", l."ReaderID", l."BookID", l."DueDate", r."Name", c."Age"
-- FROM public."Loan" l
-- JOIN public."Child" c ON l."ReaderID" = c."ReaderID"
-- JOIN public."Reader" r ON l."ReaderID" = r."ReaderID"
-- WHERE c."Age" < 10;

---------deletes all the loans from students that are past their due date
DELETE FROM public."Loan"
USING public."Student"
WHERE public."Loan"."ReaderID" = public."Student"."ReaderID"
AND public."Loan"."DueDate" < current_date;
--120.755 ms

----------Delete the readers (and their readercard) of all children readers >= 18
-- Begin transaction
DELETE FROM public."Child"
WHERE "Age" >= 18;
--22.261 ms

---- Delete all children with FamilyID 57250737
DELETE FROM public."Child"
WHERE "FamilyID" = 57250737;
--22.368 ms

-- Delete all adults with FamilyID 57250737
DELETE FROM public."Adult"
WHERE "FamilyID" = 57250737;
-- 32.820 ms


-- Delete the family with FamilyID 57250737
DELETE FROM public."Family"
WHERE "FamilyID" = 57250737;
--13.886 ms

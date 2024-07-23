--Function 1
CREATE OR REPLACE FUNCTION get_readers_with_lost_damaged_cards()
RETURNS TABLE ("ReaderID" INTEGER, "Name" VARCHAR)
AS $$
BEGIN
    RETURN QUERY
    SELECT r."ReaderID", r."Name"
    FROM public."Reader" r
    JOIN public."ReaderCard" rc ON r."ReaderID" = rc."ReaderID"
    WHERE rc."LostDamaged_Status" IN ('lost', 'damaged');
END;
$$ LANGUAGE PLPGSQL;

--Function 2
CREATE OR REPLACE FUNCTION get_children_under_age_6()
RETURNS TABLE ("ReaderID" INTEGER, "Name" VARCHAR, "Age" INTEGER)
AS $$
BEGIN
    RETURN QUERY
    SELECT r."ReaderID", r."Name", c."Age"
    FROM public."Reader" r
    JOIN public."Child" c ON r."ReaderID" = c."ReaderID"
    WHERE c."Age" < 6;
END;
$$ LANGUAGE PLPGSQL;

--Function 3
CREATE OR REPLACE FUNCTION get_large_families()
RETURNS TABLE ("FamilyID" INTEGER, "FamilyPhone" VARCHAR, "FamilyEmail" VARCHAR, "MemberCount" INTEGER, "ChildCount" INTEGER)
AS $$
BEGIN
    RETURN QUERY
    SELECT f."FamilyID", f."FamilyPhone", f."FamilyEmail", 
           COUNT(DISTINCT a."ReaderID")::INTEGER + COUNT(DISTINCT c."ReaderID")::INTEGER AS "MemberCount", 
           COUNT(DISTINCT c."ReaderID")::INTEGER AS "ChildCount"
    FROM public."Family" f
    LEFT JOIN public."Adult" a ON f."FamilyID" = a."FamilyID"
    LEFT JOIN public."Child" c ON f."FamilyID" = c."FamilyID"
    GROUP BY f."FamilyID", f."FamilyPhone", f."FamilyEmail"
    HAVING COUNT(DISTINCT a."ReaderID") + COUNT(DISTINCT c."ReaderID") >= 4
       AND COUNT(DISTINCT c."ReaderID") > 2;
END;
$$ LANGUAGE PLPGSQL;

--Function 4
--Function that categorizes the children into different age groups
CREATE OR REPLACE FUNCTION fn_categorize_readers_age_group()
RETURNS TABLE("reader_id" INTEGER, "name" VARCHAR, "age_group" VARCHAR)
AS
$$
BEGIN
    RETURN QUERY
    SELECT 
        r."ReaderID" AS reader_id, 
        r."Name" AS name, 
        CASE 
            WHEN c."Age" < 3 THEN 'Infant'
            WHEN c."Age" BETWEEN 3 AND 12 THEN 'Child'
            WHEN c."Age" BETWEEN 13 AND 17 THEN 'Teen'
            ELSE 'Unknown'
        END::VARCHAR AS age_group
    FROM public."Reader" r
    JOIN public."Child" c ON r."ReaderID" = c."ReaderID";
END;
$$
LANGUAGE plpgsql;


--Function 5
--Function to count how many loans each reader has
CREATE OR REPLACE FUNCTION fn_count_loans_per_reader()
RETURNS TABLE("reader_id" INT, "name" VARCHAR, "loan_count" INT)
AS
$$
BEGIN
    RETURN QUERY
    SELECT 
        r."ReaderID" AS reader_id, 
        r."Name" AS name, 
        COUNT(l."TransactionID")::int AS loan_count
    FROM public."Reader" r
    JOIN public."Loan" l ON r."ReaderID" = l."ReaderID"
    GROUP BY r."ReaderID", r."Name";
END;
$$
LANGUAGE plpgsql;

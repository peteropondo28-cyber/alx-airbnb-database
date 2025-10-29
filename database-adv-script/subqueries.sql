-- QUERY 1: Find all properties where the average rating is greater than 4.0 using a non-correlated subquery.
--
-- Logic:
-- 1. The inner subquery groups all reviews by property_id and calculates the AVG rating for each property.
-- 2. It filters these results using HAVING to only include properties where AVG(rating) > 4.0.
-- 3. The outer query then selects the property_id and title from the Properties table
--    where the property_id is present in the list returned by the subquery.
SELECT
    p.property_id,
    p.title
FROM
    Properties p
WHERE
    p.property_id IN (
        -- Subquery to find property IDs with an average rating over 4.0
        SELECT
            r.property_id
        FROM
            Reviews r
        GROUP BY
            r.property_id
        HAVING
            AVG(r.rating) > 4.0
    );


-- QUERY 2: Correlated subquery to find users (guests) who have made more than 3 bookings.
--
-- Logic:
-- 1. The outer query iterates through every record in the Users table (aliased as u).
-- 2. The inner subquery is executed for *each* user record. It counts the bookings (b.booking_id)
--    where the booking's guest_user_id matches the current user's ID (u.user_id) from the outer query.
-- 3. The outer WHERE clause filters the users, keeping only those whose count returned by the subquery is greater than 3.
SELECT
    u.user_id,
    u.first_name,
    u.email
FROM
    Users u
WHERE
    (
        -- Correlated Subquery: Counts bookings for the specific user currently being evaluated by the outer query
        SELECT
            COUNT(b.booking_id)
        FROM
            Bookings b
        WHERE
            b.guest_user_id = u.user_id
    ) > 3;

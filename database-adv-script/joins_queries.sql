-- 1. INNER JOIN: Retrieve all bookings and the respective users (guests) who made those bookings.
-- This only returns bookings that have a matching user_id in the Users table.
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status AS booking_status,
    u.user_id AS guest_id,
    u.first_name,
    u.email
FROM
    Bookings b
INNER JOIN
    Users u ON b.guest_user_id = u.user_id;


-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews.
-- This returns ALL rows from the 'Properties' table (the left table), and the matching reviews.
-- If a property has no reviews, the Review fields (rating, review_text, etc.) will be NULL.
SELECT
    p.property_id,
    p.title AS property_title,
    r.review_id,
    r.rating,
    r.review_text,
    r.guest_user_id
FROM
    Properties p
LEFT JOIN
    Reviews r ON p.property_id = r.property_id;


-- 3. FULL OUTER JOIN: Retrieve all users and all bookings.
-- This includes users with no bookings and bookings not linked to any user (though in a well-designed schema, the latter shouldn't happen).
-- NOTE: FULL OUTER JOIN is not supported in MySQL. The syntax below is standard SQL, commonly used in PostgreSQL or SQL Server.
SELECT
    u.user_id,
    u.first_name,
    b.booking_id,
    b.start_date,
    b.status AS booking_status
FROM
    Users u
FULL OUTER JOIN
    Bookings b ON u.user_id = b.guest_user_id;

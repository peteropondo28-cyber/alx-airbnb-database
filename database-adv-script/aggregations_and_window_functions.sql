-- QUERY 1: Find the total number of bookings made by each user, using COUNT and GROUP BY.
--
-- Logic:
-- 1. Joins the Users and Bookings tables on the guest_user_id.
-- 2. Groups the results by user ID and name.
-- 3. Uses COUNT(b.booking_id) to count the number of bookings for each group (user).
SELECT
    u.user_id,
    u.first_name,
    COUNT(b.booking_id) AS total_bookings_made
FROM
    Users u
JOIN
    Bookings b ON u.user_id = b.guest_user_id
GROUP BY
    u.user_id, u.first_name
ORDER BY
    total_bookings_made DESC;


-- QUERY 2: Use a window function (RANK and ROW_NUMBER) to rank properties based on the total number of bookings they have received.
--
-- Logic:
-- 1. The inner CTE (BookingsByProperty) calculates the total number of bookings for each property.
-- 2. The outer query uses two window functions:
--    - RANK() OVER (ORDER BY total_bookings DESC) ranks properties, giving the same rank to ties and skipping the next number.
--    - ROW_NUMBER() OVER (ORDER BY total_bookings DESC) assigns a unique, sequential number to each property, even in case of ties.
SELECT
    p.property_id,
    p.title,
    bap.total_bookings,
    RANK() OVER (ORDER BY bap.total_bookings DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY bap.total_bookings DESC) AS sequential_row_number
FROM
    Properties p
JOIN
    (
        -- CTE to calculate the total bookings for each property
        SELECT
            property_id,
            COUNT(booking_id) AS total_bookings
        FROM
            Bookings
        GROUP BY
            property_id
    ) bap ON p.property_id = bap.property_id
ORDER BY
    booking_rank ASC;

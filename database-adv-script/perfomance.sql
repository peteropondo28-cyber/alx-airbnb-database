SELECT 
    b.booking_id,
    b.booking_date,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    p.property_id,
    p.title AS property_title,
    p.address AS property_address,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_status,
    pay.payment_date AS payment_transaction_date
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed' 
    AND pay.payment_status = 'completed';  -- Example of using AND to filter results

EXPLAIN SELECT 
    b.booking_id,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.title AS property_title,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.booking_id = pay.booking_id;

SELECT 
    b.booking_id,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.title AS property_title,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed';  -- Example of filtering to reduce data


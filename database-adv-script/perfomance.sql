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
    payments pay ON b.booking_id = pay.booking_id;

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


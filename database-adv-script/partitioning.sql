-- Step 1: Create a new partitioned Booking table
CREATE TABLE Booking_Partitioned (
    booking_id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    payment_status VARCHAR(50)
) PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026)
);

-- Step 2: Insert data from the original Booking table into the partitioned table
INSERT INTO Booking_Partitioned (booking_id, user_id, property_id, start_date, end_date, status, payment_status)
SELECT booking_id, user_id, property_id, start_date, end_date, status, payment_status
FROM Booking;

-- Step 3: Drop the original Booking table if necessary
-- DROP TABLE Booking;

-- Step 4: Rename the partitioned table to Booking
-- RENAME TABLE Booking_Partitioned TO Booking;

SELECT *
FROM Booking_Partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

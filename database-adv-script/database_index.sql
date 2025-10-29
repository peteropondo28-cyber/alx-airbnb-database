--
-- Performance Optimization: CREATE INDEX Commands
--
-- This script identifies high-usage columns in the core tables (Users, Bookings, Properties)
-- and creates indexes to significantly speed up lookups, joins, and range queries.
--

-- 1. Index on Users Table
-- Rationale: 'email' is used for user login, authentication lookup, and must be unique.
CREATE UNIQUE INDEX idx_users_email ON Users (email);


-- 2. Indexes on Bookings Table
-- Rationale: 'guest_user_id' and 'property_id' are critical foreign keys used in almost all JOINS.
CREATE INDEX idx_bookings_guest_user_id ON Bookings (guest_user_id);
CREATE INDEX idx_bookings_property_id ON Bookings (property_id);

-- Rationale: A composite index on the date range is essential for quickly checking property availability.
-- This index supports queries like: WHERE start_date < 'end_date_requested' AND end_date > 'start_date_requested'
CREATE INDEX idx_bookings_date_range ON Bookings (start_date, end_date);


-- 3. Indexes on Properties Table
-- Rationale: 'host_user_id' is used to fetch all listings owned by a specific host.
CREATE INDEX idx_properties_host_user_id ON Properties (host_user_id);

-- Rationale: 'location' is the primary filter in the property search feature.
CREATE INDEX idx_properties_location ON Properties (location);

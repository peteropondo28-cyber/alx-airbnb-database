User Stories for Airbnb Clone
1. Guest - Property Search and Selection
As a Guest, I want to search for properties using multiple filters (location, date range, number of guests, and price range), so that I can find a curated list of available listings that perfectly match my travel needs.

Acceptance Criteria: The system must validate that the check-in date is before the check-out date. The results must only display properties that are not already booked for the entire requested date range.

2. Host - Listing Management with Dynamic Pricing
As a Host, I want to create, view, and update my property listings using a structured form, including the ability to set a base price, upload multiple high-resolution images, and define specific availability rules (e.g., minimum night stay), so that I can accurately market my space and manage my revenue.

Acceptance Criteria: The system must validate that all images are uploaded and processed successfully. The system must enforce that the base price is a positive number and that the listing address is correctly geo-coded and stored.

3. Host - Booking Request Approval Workflow
As a Host, I want to receive and review new booking requests for my properties, and have the ability to explicitly Approve or Reject the request within 24 hours, so that I can maintain control over who stays at my property before any payment is finalized.

Acceptance Criteria: The system must send a notification (e.g., email or push) to the Host upon request. If the Host takes no action within 24 hours, the system must automatically cancel the pending request and notify the Guest.

4. Guest - Secure Payment and Reservation Finalization
As a Guest, I want to be able to submit payment details via a secure, external payment gateway (like Stripe) only after the Host has approved my booking request, so that my payment is only processed once the reservation is guaranteed and I receive an immediate confirmation email.

Acceptance Criteria: The system must redirect the Guest to a secure payment portal. Upon successful payment, the system must create a final Reservation record in the database and send a transaction receipt to the Guest.

5. Guest and Host - Comprehensive Booking Overview
As a Host and a Guest, I want to have a dedicated dashboard that allows me to view all reservations (categorized as Upcoming, Current, and Past) relevant to my account, so that I can easily track my income, manage check-in details, or prepare for my next trip.

Acceptance Criteria: For the Host, the dashboard must include total revenue for the past month. For the Guest, the dashboard must clearly display the host's contact information and the property address for upcoming trips.

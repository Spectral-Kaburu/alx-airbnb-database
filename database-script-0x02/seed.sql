INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '+254700111111', 'host'),
    (gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '+254700222222', 'guest'),
    (gen_random_uuid(), 'Carol', 'Williams', 'carol@example.com', 'hashed_pw3', '+254700333333', 'host'),
    (gen_random_uuid(), 'David', 'Brown', 'david@example.com', 'hashed_pw4', '+254700444444', 'guest');

INSERT INTO properties (property_id, host_id, name, description, location, price_pernight)
VALUES
    (gen_random_uuid(), 
     (SELECT user_id FROM users WHERE email='alice@example.com'),
     'Seaside Villa', 'A beautiful villa by the ocean.', 'Mombasa, Kenya', 150.00),

    (gen_random_uuid(), 
     (SELECT user_id FROM users WHERE email='carol@example.com'),
     'City Apartment', 'Modern apartment in the heart of Nairobi.', 'Nairobi, Kenya', 80.00);

INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    (gen_random_uuid(),
     (SELECT property_id FROM properties WHERE name='Seaside Villa'),
     (SELECT user_id FROM users WHERE email='bob@example.com'),
     '2025-09-15', '2025-09-20', 750.00, 'confirmed'),

    (gen_random_uuid(),
     (SELECT property_id FROM properties WHERE name='City Apartment'),
     (SELECT user_id FROM users WHERE email='david@example.com'),
     '2025-09-18', '2025-09-22', 320.00, 'pending');

INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
    (gen_random_uuid(),
     (SELECT booking_id FROM bookings WHERE total_price=750.00),
     750.00, 'credit_card'),

    (gen_random_uuid(),
     (SELECT booking_id FROM bookings WHERE total_price=320.00),
     100.00, 'paypal'); -- partial payment

INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
    (gen_random_uuid(),
     (SELECT property_id FROM properties WHERE name='Seaside Villa'),
     (SELECT user_id FROM users WHERE email='bob@example.com'),
     5, 'Amazing stay! The view was breathtaking.'),

    (gen_random_uuid(),
     (SELECT property_id FROM properties WHERE name='City Apartment'),
     (SELECT user_id FROM users WHERE email='david@example.com'),
     4, 'Nice apartment, but a bit noisy at night.');

INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
    (gen_random_uuid(),
     (SELECT user_id FROM users WHERE email='bob@example.com'),
     (SELECT user_id FROM users WHERE email='alice@example.com'),
     'Hi Alice, is the Seaside Villa available for Christmas week?'),

    (gen_random_uuid(),
     (SELECT user_id FROM users WHERE email='david@example.com'),
     (SELECT user_id FROM users WHERE email='carol@example.com'),
     'Hello Carol, does the City Apartment have WiFi?');

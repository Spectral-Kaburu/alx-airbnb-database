
# Database Normalization to 3NF (Third Normal Form)

## Step 1: First Normal Form (1NF)
- Ensure all tables have atomic values (no repeating groups, no arrays).
- Our schema already satisfies 1NF:
  - Each field holds a single value (e.g., `first_name`, `email`, `price_pernight`).
  - No multi-valued attributes or repeating groups.

## Step 2: Second Normal Form (2NF)
- Ensure the database is in 1NF, and all non-key attributes depend on the whole primary key.
- Since all our tables use **UUID primary keys** (single-column primary keys), there are no partial dependencies.
- For example:
  - `Booking(total_price)` depends fully on `booking_id`, not partially on `user_id` or `property_id`.

Thus, the schema satisfies 2NF.

## Step 3: Third Normal Form (3NF)
- Ensure the database is in 2NF, and there are no **transitive dependencies** (non-key attributes depending on other non-key attributes).

### Analysis by Table:

#### User
- Attributes such as `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, and `created_at` all depend only on `user_id`.
- ✅ No transitive dependencies.

#### Property
- Attributes like `name`, `description`, `location`, `price_pernight`, `created_at`, `updated_at` depend only on `property_id`.
- `host_id` is a foreign key reference to `User(user_id)` — valid and not a transitive dependency.
- ✅ 3NF compliant.

#### Booking
- `start_date`, `end_date`, `total_price`, `status`, `created_at` depend only on `booking_id`.
- Foreign keys `property_id` and `user_id` are direct relationships, not transitive attributes.
- ✅ 3NF compliant.

#### Payment
- `amount`, `payment_date`, `payment_method` depend only on `payment_id`.
- `booking_id` is a foreign key, no redundancy introduced.
- ✅ 3NF compliant.

#### Review
- `rating`, `comment`, and `created_at` depend only on `review_id`.
- Foreign keys `property_id` and `user_id` are valid.
- ✅ 3NF compliant.

#### Message
- `message_body` and `sent_at` depend only on `message_id`.
- `sender_id` and `recipient_id` are foreign keys pointing to `User(user_id)` — valid relationships.
- ✅ 3NF compliant.

## Conclusion
- The database schema already satisfies 3NF.
- Each attribute depends directly and solely on the primary key of its table.
- No redundant or transitive dependencies exist.
- **No further decomposition is required.**

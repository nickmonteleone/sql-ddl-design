CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    code VARCHAR(5) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    base_cost NUMERIC NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers
);

CREATE TABLE bike_orders (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders,
    bike_code VARCHAR(5) NOT NULL REFERENCES bikes,
    bike_cost NUMERIC NOT NULL,
    note VARCHAR(100)
);

INSERT INTO bikes (code, name, base_cost)
    VALUES
        ('FLY', 'The Flyer', 500),
        ('HAUL', 'The Big Haul', 600),
        ('SKIN', 'The Skinny', 700),
        ('BUD', 'Big Buddy', 800);

INSERT INTO customers (first_name, last_name)
    VALUES
        ('Mickey', 'Mouse'),
        ('Goofy', 'Mouse'),
        ('Minnie', 'Mouse');

INSERT INTO orders (customer_id)
    VALUES
        (2),
        (3);

INSERT INTO bike_orders (order_id, bike_code, bike_cost, note)
    VALUES
        (3, 'FLY', 555, 'add training wheels'),
        (3, 'HAUL', 542.50, 'don''t add kickstand'),
        (4, 'SKIN', 200, NULL);
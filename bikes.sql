-- Create tables

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

-- "model" instead of "name" above

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers,
    order_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp
);


CREATE TABLE bike_orders (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders,
    bike_code VARCHAR(5) NOT NULL REFERENCES bikes,
    bike_cost NUMERIC(6, 2) NOT NULL,
    note VARCHAR(100) NOT NULL DEFAULT ''
);

-- does bike_code makes sense?



-- Provide data for tables

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

INSERT INTO orders (customer_id, order_date)
    VALUES
        (2, '2004-10-19 10:23:54+02'),
        (3, '2004-10-18 10:23:54+02');

-- Whoever is putting in data, Timezone info sucks

INSERT INTO bike_orders (order_id, bike_code, bike_cost, note)
    VALUES
        (1, 'FLY', 555, 'add training wheels'),
        (1, 'HAUL', 542.50, 'don''t add kickstand'),
        (2, 'SKIN', 200, '');



-- find the total cost of a single order from order id

SELECT SUM(bike_cost), o.id AS orders_id, c.first_name, c.id AS customer_id
    FROM bike_orders
        JOIN orders AS o
            ON bike_orders.order_id = o.id
        JOIN customers AS c
            ON c.id = o.customer_id
        GROUP BY c.first_name, o.id, c.id
        ORDER BY o.id;


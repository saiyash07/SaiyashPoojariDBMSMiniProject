CREATE DATABASE toll_management1;
SELECT current_database();
CREATE TABLE vehicle (
    vehicle_id SERIAL PRIMARY KEY,
    registration_no VARCHAR(20) NOT NULL UNIQUE,
    owner_name VARCHAR(100) NOT NULL,
    owner_phone VARCHAR(15),
    vehicle_class VARCHAR(50) NOT NULL
);


CREATE TABLE tag (
    tag_id SERIAL PRIMARY KEY,
    tag_identifier VARCHAR(50) NOT NULL UNIQUE,
    vehicle_id INT NOT NULL UNIQUE,
    issue_date DATE NOT NULL,
    balance DECIMAL(10,2) NOT NULL DEFAULT 0,

    FOREIGN KEY (vehicle_id)
        REFERENCES vehicle(vehicle_id),

    CHECK (balance >= 0)
);

CREATE TABLE recharge (
    recharge_id SERIAL PRIMARY KEY,
    tag_id INT NOT NULL,
    recharge_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (tag_id)
        REFERENCES tag(tag_id),

    CHECK (amount > 0)
);

CREATE TABLE plaza (
    plaza_id SERIAL PRIMARY KEY,
    plaza_name VARCHAR(100) NOT NULL,
    location VARCHAR(150)
);

CREATE TABLE lane (
    lane_id SERIAL PRIMARY KEY,
    plaza_id INT NOT NULL,
    lane_number INT NOT NULL,

    FOREIGN KEY (plaza_id)
        REFERENCES plaza(plaza_id),

    UNIQUE (plaza_id, lane_number)
);

CREATE TABLE toll_transaction (
    transaction_id SERIAL PRIMARY KEY,
    pass_reference VARCHAR(100) NOT NULL UNIQUE,

    tag_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    lane_id INT NOT NULL,
    plaza_id INT NOT NULL,

    transaction_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    vehicle_class VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (tag_id)
        REFERENCES tag(tag_id),

    FOREIGN KEY (vehicle_id)
        REFERENCES vehicle(vehicle_id),

    FOREIGN KEY (lane_id)
        REFERENCES lane(lane_id),

    FOREIGN KEY (plaza_id)
        REFERENCES plaza(plaza_id),

    CHECK (amount >= 0)
);

INSERT INTO vehicle
(vehicle_id, registration_no, owner_name, owner_phone, vehicle_class)
VALUES
(1, 'MH12AB1234', 'Rahul Sharma', '9876543210', 'Car'),
(2, 'MH14CD5678', 'Priya Patil', '9876543211', 'Car'),
(3, 'MH01EF9012', 'Amit Joshi', '9876543212', 'Truck'),
(4, 'MH04GH3456', 'Sneha Kulkarni', '9876543213', 'Bus'),
(5, 'MH43IJ7890', 'Rohan Deshmukh', '9876543214', 'Car'),
(6, 'MH12KL2345', 'Neha Shah', '9876543215', 'Truck'),
(7, 'MH15MN6789', 'Vikas More', '9876543216', 'Bike'),
(8, 'MH20OP1234', 'Pooja Mehta', '9876543217', 'Bus'),
(9, 'MH31QR5678', 'Kunal Patil', '9876543218', 'Car'),
(10, 'MH02ST9012', 'Ananya Rao', '9876543219', 'Ambulance');


INSERT INTO tag
(tag_id, tag_identifier, vehicle_id, issue_date, balance)
VALUES
(1, 'TAG1001', 1, '2026-01-10', 1500.00),
(2, 'TAG1002', 2, '2026-01-15', 1200.00),
(3, 'TAG1003', 3, '2026-02-01', 2000.00),
(4, 'TAG1004', 4, '2026-02-10', 1800.00),
(5, 'TAG1005', 5, '2026-02-20', 900.00),
(6, 'TAG1006', 6, '2026-03-01', 2500.00),
(7, 'TAG1007', 7, '2026-03-10', 700.00),
(8, 'TAG1008', 8, '2026-03-15', 1600.00),
(9, 'TAG1009', 9, '2026-04-01', 1100.00),
(10, 'TAG1010', 10, '2026-04-10', 500.00);



INSERT INTO recharge
(recharge_id, tag_id, recharge_date, amount)
VALUES
(1, 1, '2026-01-10 10:00:00', 2000.00),
(2, 1, '2026-03-05 11:30:00', 1000.00),

(3, 2, '2026-01-15 09:30:00', 1500.00),

(4, 3, '2026-02-01 12:00:00', 2500.00),
(5, 3, '2026-05-10 14:00:00', 2000.00),

(6, 4, '2026-02-10 10:15:00', 1800.00),

(7, 5, '2026-02-20 16:00:00', 1200.00),

(8, 6, '2026-03-01 09:00:00', 3000.00),
(9, 6, '2026-06-01 13:00:00', 2000.00),

(10, 7, '2026-03-10 15:30:00', 800.00),

(11, 8, '2026-03-15 10:00:00', 2000.00),

(12, 9, '2026-04-01 11:00:00', 1500.00);


INSERT INTO plaza
(plaza_id, plaza_name, location)
VALUES
(1, 'Mumbai Central', 'Mumbai'),
(2, 'Pune East', 'Pune'),
(3, 'Nashik Highway', 'Nashik'),
(4, 'Kolhapur South', 'Kolhapur');


INSERT INTO lane
(lane_id, plaza_id, lane_number)
VALUES
(1, 1, 1),
(2, 1, 2),

(3, 2, 1),
(4, 2, 2),

(5, 3, 1),
(6, 3, 2),

(7, 4, 1),
(8, 4, 2);

INSERT INTO toll_transaction
(transaction_id, pass_reference, tag_id, vehicle_id,
 lane_id, plaza_id, transaction_time, vehicle_class, amount)
VALUES
(1, 'PASS001', 1, 1, 1, 1, '2026-09-01 08:10:00', 'Car', 100.00),
(2, 'PASS002', 2, 2, 1, 1, '2026-09-01 08:25:00', 'Car', 150.00),
(3, 'PASS003', 3, 3, 1, 1, '2026-09-01 09:00:00', 'Truck', 300.00),
(4, 'PASS004', 5, 5, 1, 1, '2026-09-01 09:30:00', 'Car', 100.00),

(5, 'PASS005', 4, 4, 2, 1, '2026-09-01 10:00:00', 'Bus', 250.00),
(6, 'PASS006', 6, 6, 2, 1, '2026-09-01 10:30:00', 'Truck', 300.00),
(7, 'PASS007', 9, 9, 2, 1, '2026-09-01 11:00:00', 'Car', 100.00),
(8, 'PASS008', 7, 7, 2, 1, '2026-09-01 11:30:00', 'Bike', 50.00),

(9, 'PASS009', 1, 1, 3, 2, '2026-09-02 08:00:00', 'Car', 200.00),
(10, 'PASS010', 3, 3, 3, 2, '2026-09-02 08:30:00', 'Truck', 300.00),
(11, 'PASS011', 2, 2, 3, 2, '2026-09-02 09:00:00', 'Car', 100.00),

(12, 'PASS012', 4, 4, 4, 2, '2026-09-02 09:30:00', 'Bus', 250.00),
(13, 'PASS013', 5, 5, 4, 2, '2026-09-02 10:00:00', 'Car', 150.00),
(14, 'PASS014', 6, 6, 4, 2, '2026-09-02 10:30:00', 'Truck', 300.00),
(15, 'PASS015', 6, 6, 4, 2, '2026-09-02 11:00:00', 'Truck', 400.00),

(16, 'PASS016', 7, 7, 5, 3, '2026-09-03 08:00:00', 'Bike', 50.00),
(17, 'PASS017', 1, 1, 5, 3, '2026-09-03 08:30:00', 'Car', 100.00),
(18, 'PASS018', 4, 4, 5, 3, '2026-09-03 09:00:00', 'Bus', 250.00),

(19, 'PASS019', 6, 6, 6, 3, '2026-09-03 09:30:00', 'Truck', 300.00),
(20, 'PASS020', 5, 5, 6, 3, '2026-09-03 10:00:00', 'Car', 100.00),
(21, 'PASS021', 8, 8, 6, 3, '2026-09-03 10:30:00', 'Bus', 200.00),

(22, 'PASS022', 3, 3, 7, 4, '2026-09-04 08:00:00', 'Truck', 300.00),
(23, 'PASS023', 4, 4, 7, 4, '2026-09-04 08:30:00', 'Bus', 250.00),

(24, 'PASS024', 2, 2, 8, 4, '2026-09-04 09:00:00', 'Car', 100.00),
(25, 'PASS025', 9, 9, 8, 4, '2026-09-04 09:30:00', 'Car', 150.00),
(26, 'PASS026', 10, 10, 8, 4, '2026-09-04 10:00:00', 'Ambulance', 0.00);



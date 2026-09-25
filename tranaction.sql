BEGIN;
INSERT INTO toll_transaction (pass_reference, tag_id, vehicle_id, lane_id, plaza_id, transaction_time, vehicle_class, amount)
VALUES ('PASS027', 1, 1, 1, 1, CURRENT_TIMESTAMP, 'Car', 100);
UPDATE tag SET balance = balance - 100 WHERE tag_id = 1;
COMMIT;

BEGIN;
INSERT INTO toll_transaction (pass_reference, tag_id, vehicle_id, lane_id, plaza_id, transaction_time, vehicle_class, amount)
VALUES ('PASS028', 2, 2, 1, 1, CURRENT_TIMESTAMP, 'Car', 150);
UPDATE tag SET balance = balance - 150 WHERE tag_id = 2;
COMMIT;

BEGIN;
INSERT INTO toll_transaction (pass_reference, tag_id, vehicle_id, lane_id, plaza_id, transaction_time, vehicle_class, amount)
VALUES ('PASS029', 3, 3, 3, 2, CURRENT_TIMESTAMP, 'Truck', 300);
UPDATE tag SET balance = balance - 300 WHERE tag_id = 3;
COMMIT;

BEGIN;
INSERT INTO toll_transaction (pass_reference, tag_id, vehicle_id, lane_id, plaza_id, transaction_time, vehicle_class, amount)
VALUES ('PASS030', 5, 5, 4, 2, CURRENT_TIMESTAMP, 'Car', 150);
UPDATE tag SET balance = balance - 150 WHERE tag_id = 5;
ROLLBACK;

BEGIN;
INSERT INTO toll_transaction (pass_reference, tag_id, vehicle_id, lane_id, plaza_id, transaction_time, vehicle_class, amount)
VALUES ('PASS031', 10, 10, 8, 4, CURRENT_TIMESTAMP, 'Ambulance', 0);
COMMIT;

SELECT transaction_id, pass_reference, tag_id, vehicle_id, vehicle_class, amount
FROM toll_transaction
WHERE pass_reference IN ('PASS027', 'PASS028', 'PASS029', 'PASS030', 'PASS031')
ORDER BY transaction_id;
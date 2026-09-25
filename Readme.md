 Toll Management System

 
 Saiyash Poojari (150096725136)

 
 Project Overview

The Toll Management System is a PostgreSQL-based database project developed to manage toll plaza operations efficiently. The system stores information about vehicles, FASTags, recharges, toll plazas, lanes, and toll transactions. It demonstrates core DBMS concepts such as ER modeling, schema design, normalization, SQL queries, joins, subqueries, constraints, and transaction management.

The project simulates a real-world electronic toll collection system where vehicles are charged automatically through FASTags while maintaining complete transaction records.

 Objectives

Manage vehicle and FASTag information.
Record toll transactions across multiple plazas and lanes.
Track FASTag balances and recharge history.
Generate analytical reports using SQL queries.
Demonstrate transaction management using COMMIT and ROLLBACK.
Apply DBMS concepts in a practical scenario.

 Technologies Used
Database: PostgreSQL
Language: SQL
Concepts:
ER Diagram
Database Schema Design
Normalization
Constraints
Joins
Subqueries
Aggregate Functions
Transaction Control (COMMIT & ROLLBACK)

 Database Structure

The database consists of the following tables:

1. Vehicle

Stores vehicle information such as registration number, owner details, and vehicle class.

2. Tag

Stores FASTag details assigned to vehicles along with balance information.

3. Recharge

Maintains recharge history for each FASTag.

4. Plaza

Stores toll plaza information and locations.

5. Lane

Stores lane details for each toll plaza.

6. Toll_Transaction

Stores toll crossing records including vehicle, tag, plaza, lane, amount, and timestamp.

Project Components
ER Diagram

Represents entities, attributes, and relationships in the Toll Management System.

Database Schema

Contains table creation scripts, primary keys, foreign keys, unique constraints, and check constraints.

Sample Data

Includes vehicle records, FASTag records, recharge records, toll plazas, lanes, and toll transactions used for testing.

SQL Queries

A collection of 20 SQL queries demonstrating:

Filtering
Sorting
Aggregate Functions
Joins
Self Joins
Subqueries
EXISTS
IN
ALL
HAVING Clauses
Transaction Management

Demonstrates database transactions using:

BEGIN
COMMIT
ROLLBACK

to maintain consistency during toll deductions.

 Team Contributions
Antara Palwankar
Designed the ER Diagram.
Defined entities, attributes, and relationships.
Assisted in project documentation.
Saiyash
Designed and implemented the database schema.
Created tables, keys, constraints, and relationships.
Aditya
Added sample data into the database.
Developed SQL Queries 1–10.
Atharva
Developed SQL Queries 11–20.
Implemented Transaction Management (transaction.sql).
 Design Decisions
Separate Vehicle and Tag Tables

A vehicle and FASTag are maintained separately to avoid redundancy and improve scalability.

Separate Recharge Table

Recharge history is stored independently so every recharge can be tracked.

Separate Plaza and Lane Tables

A toll plaza can have multiple lanes, making a one-to-many relationship suitable.

Centralized Transaction Table

All toll crossings are stored in a dedicated transaction table, enabling reporting and revenue analysis.

Data Integrity

The schema uses:

Primary Keys
Foreign Keys
Unique Constraints
Check Constraints

to maintain database consistency.

 Transaction Demonstration

The project includes transaction processing examples showing:

Successful Transactions
PASS027 → COMMIT
PASS028 → COMMIT
PASS029 → COMMIT
PASS031 → COMMIT
Failed Transaction
PASS030 → ROLLBACK

This demonstrates how transaction control commands ensure database reliability and consistency.

 DBMS Concepts Demonstrated
ER Modeling
Relational Database Design
Primary Keys
Foreign Keys
Normalization
Aggregate Functions
Joins
Self Joins
Nested Queries
Transaction Management
Data Integrity Constraints
SQL Reporting

 Conclusion

The Toll Management System successfully demonstrates the practical implementation of DBMS concepts using PostgreSQL. The project provides an efficient structure for managing vehicles, FASTags, recharges, toll plazas, and transactions while ensuring data integrity, consistency, and meaningful analytical reporting.

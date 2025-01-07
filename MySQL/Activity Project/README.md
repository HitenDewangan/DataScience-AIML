### Instructions:
- Create the tables using the provided descriptions and constraints.
- Ensure all primary keys, foreign keys, and other constraints are correctly implemented.
- Insert sample data into each table.
- Test the tables by running queries to retrieve data and verify the relationships.

![ER Diagram of the tables in saledb database](https://github.com/HitenDewangan/SQL-Activity-Project/blob/main/ER%20Diagram.png)

### Sample Database for Sales Orders (saledb)
This project provides a sample database schema for a sales order system, named saledb. It includes tables representing:

- Customers: Information about customers placing orders.
- Products: Details about the products offered for sale.
- Product Lines: Categories that group related products (optional, depending on your data).
- Offices: Locations of company offices.
- Employees: Sales representatives and other staff (linked to specific offices).
- Orders: Details about customer orders.
- OrderDetails: Line items for each order, specifying products and quantities.
- Payments: Customer payments towards their orders (optional, depending on your data).
- Tables and Columns:

A detailed description of each table's columns and their data types can be found within the SQL code files.
Data Samples:

The project includes sample data inserted into most tables to demonstrate usage.
### How to Use This Project:

Import the SQL code files into your preferred SQL database management system.
The order of importing the files is important due to foreign key relationships. Here's a suggested order:
#### Create tables:
1. offices.sql
2. productlines.sql (if applicable)
3. products.sql
4. customers.sql
5. employees.sql
6. orders.sql
7. orderdetails.sql
8. payments.sql (if applicable)
- Insert sample data using the provided SQL statements or populate the tables with your own data.
- Use SQL queries to interact with the database and retrieve or manipulate data as needed.



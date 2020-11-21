# Cruise Restaurant Management

Final Project for Villanova University CSC4480 Database Systems. Implementing a database design to Oracle.

## Project Summary
A management system for all the four restaurants in a cruise ship called the Royal Caribbean’s Oasis of the Seas. The restaurants offer various food options to the customers. All reservations and orders should be recorded and managed in the database system.


## Application Instructions
### Creating Schema
Running restaurant-schema.sql will create tables (restaurant, menu, reservation, host, and waiter, order_item) and a view (order_summary) needed for the application

### Adding Values to Tables
Examples of creating records can be viewed in the file populate-restaurant.sql\
New restaurant -> `INSERT INTO restaurant VALUES (<name>,<id>,<max reservation #>);`\
New waiter -> `INSERT INTO waiter VALUES (<last name>,<first name>,<ssn>,<restaurant id>);`\
New host -> `INSERT INTO host VALUES (<last name>,<first name>,<ssn>,<restaurant id>);`\
New item in the menu -> `INSERT INTO menu VALUES (<id>, <item name>, <restaurant id>, <cost>);`\
New reservation -> `INSERT INTO reservation VALUES (<id>, <restaurant id>, <datetime>, <group size>, <waiter ssn>, <host ssn>);`\
New order items for reservation -> `INSERT INTO order_item VALUES(<reservation id>, <menu id>);`

### Queries
The following query functions are specified in the file query-restaurant.sql
1. Get all order summaries
2. Get the most popular menu item from each restaurant
3. Generate monthly report for all restaurants
4. Generate monthly report for a specific restaurant (the one in the file gets monthly report of Chops Grille)
5. Calculate amount of tip allocated to hosts and waiters for specific month
6. Get list of reservations on a specific date

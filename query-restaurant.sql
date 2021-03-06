-- Get all the orders
SELECT *
FROM order_summary;

-- Get the most popular menu from each restaurant
SELECT Mrest_id, stats_mode(Omenu_id)
FROM order_item JOIN menu ON menu_id = Omenu_id
GROUP BY Mrest_id;

-- Get monthly report for all restaurants
SELECT rest_name,  TO_CHAR(Rdatetime,'mm-yyyy') AS mon_yr, sum(total)
FROM (order_summary o JOIN reservation r ON o.reservation_id = r.reservation_id)
JOIN restaurant ON restaurant_id = rest_id
GROUP BY rest_name, TO_CHAR(Rdatetime,'mm-yyyy')
ORDER BY rest_name;

-- Get monthly report for Chops Grille
SELECT TO_CHAR(Rdatetime,'mm-yyyy') AS mon_yr, sum(total)
FROM (order_summary o JOIN reservation r ON o.reservation_id = r.reservation_id)
JOIN restaurant ON restaurant_id = rest_id
WHERE rest_name = 'Chops Grille'
GROUP BY rest_name, TO_CHAR(Rdatetime,'mm-yyyy')
ORDER BY TO_CHAR(Rdatetime,'mm-yyyy');

-- Calculate tip to allocate to hosts for november
SELECT Hlname, Hfname, sum(tip)*0.3 as TIP
FROM (order_summary o JOIN reservation r ON o.reservation_id = r.reservation_id)
JOIN host ON Hssn = Rhost_ssn
WHERE TO_CHAR(Rdatetime,'mm-yyyy') = '11-2020'
GROUP BY Hlname, Hfname;

-- Calculate tip to allocate to waiters for november
SELECT Wlname, Wfname, sum(tip)*0.7 as TIP
FROM (order_summary o JOIN reservation r ON o.reservation_id = r.reservation_id)
JOIN waiter ON Wssn = Rwaiter_ssn
WHERE TO_CHAR(Rdatetime,'mm-yyyy') = '11-2020'
GROUP BY Wlname, Wfname;

-- Get list of reservations
SELECT rest_name, Reservation_id, TO_CHAR (Rdatetime, 'HH24:MI:SS') AS time, Rgroup_size
FROM reservation JOIN restaurant ON Rrest_id = rest_id
WHERE TO_CHAR(Rdatetime,'yyyy-MM-dd') = '2020-11-10';
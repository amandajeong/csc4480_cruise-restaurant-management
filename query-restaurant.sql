SELECT *
FROM order_summary;

SELECT Mrest_id, stats_mode(Omenu_id)
FROM menu JOIN ORDER_ITEM ON menu_id = Omenu_id
GROUP BY Mrest_id;
SELECT  a.venue_seat_common_id, a.barcode_printed,
b.purchase_datetime, b.payment_method, b.payment_amount,
c.customer_name,c.customer_email,
d.event_date, d.event_hour, d.event_title
FROM tt_sold_tickets a
INNER JOIN tt_purchases b ON (a.purchase_id=b.purchase_id)
INNER JOIN tt_customers c ON (a.customer_id = c.customer_id)
INNER JOIN tt_events d ON (a.event_id = d.event_id)
WHERE b.payment_method='CASH'
AND purchase_datetime > NOW() - INTERVAL 1 year;

SELECT COUNT(*) from tt_venue_seats;

SELECT properties.*, reservations.*, AVG(property_reviews.rating) as average_rating
FROM reservations
JOIN properties ON property_id = properties.id 
JOIN property_reviews ON reservation_id = reservations.id
WHERE reservations.guest_id = 1 AND reservations.end_date < now()::date
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
LIMIT 10;
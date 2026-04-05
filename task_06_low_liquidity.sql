/* ГИПОТЕЗА №6: Низколиквидные объекты
   Вопрос: Какие объекты смотрели более 5 раз, но они всё еще не проданы?
   Бизнес-ценность: Выявление проблемных лотов (плохое состояние или плохая работа агента).
*/
SELECT listing_id,
       (SELECT address FROM properties WHERE property_id = l.property_id) as address
FROM listings l
WHERE status = 'active'
  AND (SELECT COUNT(*) FROM viewings v WHERE v.listing_id = l.listing_id) > 5;
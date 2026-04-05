/* ГИПОТЕЗА №7: Клиенты-"туристы"
   Вопрос: Кто смотрел недвижимость более 3 раз, но не совершил покупку?
   Бизнес-ценность: Оптимизация времени агентов через фильтрацию несерьезных лидов.
*/
SELECT c.full_name, v_count.total_views
FROM clients c
         JOIN (SELECT client_id, COUNT(*) as total_views FROM viewings GROUP BY client_id) v_count
              ON c.client_id = v_count.client_id
WHERE c.client_id NOT IN (SELECT buyer_id FROM deals)
  AND v_count.total_views > 3
ORDER BY v_count.total_views DESC;
/* ГИПОТЕЗА №12: Ретро-люкс
   Вопрос: Есть ли объекты старше 2000 года, стоящие дороже средних новостроек?
   Бизнес-ценность: Идентификация объектов с исторической или уникальной ценностью.
*/
SELECT property_id, address, build_year, price
FROM properties
WHERE build_year < 2000
  AND price > (SELECT AVG(price) FROM properties WHERE build_year >= 2020)
ORDER BY price DESC;
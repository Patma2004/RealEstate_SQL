/* ГИПОТЕЗА №11: Уровень районов
   Вопрос: В каких районах цена за кв. метр выше средней по городу?
   Бизнес-ценность: Классификация районов для распределения опытных агентов.
*/
SELECT district, AVG(price / area) as avg_meter_price
FROM properties
GROUP BY district
HAVING AVG(price / area) > (SELECT AVG(price / area) FROM properties);
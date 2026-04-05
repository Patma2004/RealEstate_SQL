/* ГИПОТЕЗА №8: Горячие инвестиционные предложения
   Вопрос: Какие объекты стоят на 30% дешевле средней цены по району?
   Бизнес-ценность: База объектов для инвесторов, ищущих выгоду.
*/
WITH district_avg AS (
    SELECT district, AVG(price) as avg_district_price FROM properties GROUP BY district
)
SELECT p.property_id, p.address, p.district, p.price, da.avg_district_price
FROM properties p
         JOIN district_avg da ON p.district = da.district
WHERE p.price < da.avg_district_price * 0.7 AND p.status = 'available';
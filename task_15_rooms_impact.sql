/* ГИПОТЕЗА №15: Влияние количества комнат на цену
   Вопрос: Как средняя цена многокомнатных домов отличается от общей средней?
   Бизнес-ценность: Аналитика для застройщиков и крупных продавцов.
*/
SELECT rooms, AVG(price) as avg_price,
       (AVG(price) - (SELECT AVG(price) FROM properties)) as diff_from_global_avg
FROM properties
GROUP BY rooms ORDER BY rooms;
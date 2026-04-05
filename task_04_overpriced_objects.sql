/* ГИПОТЕЗА №4: Дисбаланс ценовой политики
   Вопрос: Какие объекты стоят дороже среднего значения по своему типу?
   Бизнес-ценность: Список объектов, требующих коррекции цены для ускорения продажи.
*/
SELECT property_id, type, price
FROM properties p1
WHERE price > (SELECT AVG(price) FROM properties p2 WHERE p1.type = p2.type)
LIMIT 10;
/* ГИПОТЕЗА №10: Рекордная сделка (Премиум сегмент)
   Вопрос: Каков адрес и город самого дорогого проданного объекта?
   Бизнес-ценность: Использование кейса для имиджевой рекламы агентства.
*/
SELECT city, address, price
FROM properties
WHERE property_id = (
    SELECT property_id FROM listings WHERE listing_id =
                                           (SELECT listing_id FROM deals ORDER BY sold_price DESC LIMIT 1)
);
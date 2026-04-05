/* ГИПОТЕЗА №13: VIP-агенты
   Вопрос: Какие агенты работают только с объектами дороже 100 млн?
   Бизнес-ценность: Отбор кадров для работы с эксклюзивными клиентами.
*/
SELECT DISTINCT a.full_name FROM agents a
WHERE NOT EXISTS (
    SELECT 1 FROM listings l JOIN properties p ON l.property_id = p.property_id
    WHERE l.agent_id = a.agent_id AND p.price < 100000000
) AND EXISTS (SELECT 1 FROM listings WHERE agent_id = a.agent_id);
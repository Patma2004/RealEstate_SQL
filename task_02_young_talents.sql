/* ГИПОТЕЗА №2: Опыт и результат
   Вопрос: Есть ли агенты с опытом менее 5 лет, но с активными продажами?
   Бизнес-ценность: Поиск перспективных молодых кадров для системы наставничества.
*/
SELECT a.full_name, a.experience_years, COUNT(d.deal_id) as deals_count
FROM agents a
         JOIN listings l ON a.agent_id = l.agent_id
         JOIN deals d ON l.listing_id = d.listing_id
WHERE a.experience_years <= 5
GROUP BY a.full_name, a.experience_years
HAVING COUNT(d.deal_id) > 1;
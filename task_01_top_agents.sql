/* ГИПОТЕЗА №1: "Супер-агенты"
   Вопрос: Кто из агентов заработал больше всего комиссии?
   Бизнес-ценность: Выявление лидеров, которым можно доверять самые дорогие объекты.
*/
WITH agent_sales AS (
    SELECT a.full_name,
           SUM(d.agent_commission) as total_comm,
           COUNT(d.deal_id) as deals_count
    FROM agents a
             JOIN listings l ON a.agent_id = l.agent_id
             JOIN deals d ON l.listing_id = d.listing_id
    GROUP BY a.full_name
)
SELECT * FROM agent_sales
ORDER BY total_comm DESC
LIMIT 5;

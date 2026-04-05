/* ГИПОТЕЗА №14: Самый прибыльный тип недвижимости
   Вопрос: Какой тип мүлк (дом, квартира, офис) приносит больше всего дохода агентству?
   Бизнес-ценность: Определение приоритетного направления маркетинга.
*/
SELECT p.type, SUM(d.agent_commission) as total_revenue
FROM properties p
         JOIN listings l ON p.property_id = l.property_id
         JOIN deals d ON l.listing_id = d.listing_id
GROUP BY p.type
ORDER BY total_revenue DESC;
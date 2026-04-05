/* ГИПОТЕЗА №3: Эффективность офисов
   Вопрос: Какие офисы приносят самую высокую среднюю комиссию?
   Бизнес-ценность: Оценка работы филиалов и распределение ресурсов.
*/
SELECT a.office, AVG(d.agent_commission) as avg_office_commission
FROM agents a
         JOIN listings l ON a.agent_id = l.agent_id
         JOIN deals d ON l.listing_id = d.listing_id
GROUP BY a.office
ORDER BY avg_office_commission DESC;
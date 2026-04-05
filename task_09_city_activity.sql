/* ГИПОТЕЗА №9: Географическая активность
   Вопрос: В каких городах сосредоточено больше всего покупателей?
   Бизнес-ценность: Направление рекламного бюджета в самые активные регионы.
*/
SELECT p.city, COUNT(d.deal_id) as sales_count
FROM properties p
         JOIN listings l ON p.property_id = l.property_id
         JOIN deals d ON l.listing_id = d.listing_id
GROUP BY p.city
ORDER BY sales_count DESC;
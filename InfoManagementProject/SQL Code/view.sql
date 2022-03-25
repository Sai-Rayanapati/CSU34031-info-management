CREATE VIEW `Top 5 biggest cities` AS SELECT city_name,city_area, country_ID FROM city
									  WHERE country_ID IN (SELECT country_ID FROM country)
                                      ORDER BY city_area DESC LIMIT 5;

CREATE VIEW `Cheapest Attractions In Each City` AS SELECT attraction_name, entry_fees, city_ID from attractions
												   ORDER BY city_ID, entry_fees;

-- DROP VIEW `Top 5 biggest cities`, `Cheapest Attractions In Each City`;                                                         
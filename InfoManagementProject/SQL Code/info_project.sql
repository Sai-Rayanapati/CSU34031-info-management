CREATE DATABASE info_project;

USE info_project;

-- create tables

CREATE TABLE currency(
	currency_ID INTEGER NOT NULL DEFAULT 0,
    currency VARCHAR(50) NOT NULL UNIQUE,
    symbol VARCHAR(5) DEFAULT NULL,
    mint VARCHAR(50) DEFAULT NULL,
    central_bank VARCHAR(50) DEFAULT NULL,
    -- country_ID INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY(currency_ID)
    -- FOREIGN KEY(country_ID) REFERENCES country(country_ID)
    );
CREATE TABLE country(
	country_ID INTEGER NOT NULL DEFAULT 0,
    country_name VARCHAR(50) NOT NULL UNIQUE,
    continent VARCHAR(25) NOT NULL,
    capital_city VARCHAR(50) NOT NULL UNIQUE,
    currency VARCHAR(50) NOT NULL,
    telephone_code VARCHAR(5) NOT NULL,
    PRIMARY KEY(country_ID),
	FOREIGN KEY(currency) REFERENCES currency(currency)
    );
CREATE TABLE city(
	city_ID INTEGER NOT NULL DEFAULT 0,
    city_name VARCHAR(50) NOT NULL UNIQUE,
    province VARCHAR(25) DEFAULT NULL,
    city_area INTEGER NOT NULL DEFAULT 0,
    founded INTEGER DEFAULT NULL,
    time_zone VARCHAR(10) NOT NULL,
    country_ID INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY(city_ID),
    FOREIGN KEY(country_ID) REFERENCES country(country_ID)
    );
 CREATE TABLE attractions(
	attraction_ID INTEGER NOT NULL DEFAULT 0,
    attraction_name VARCHAR(50) NOT NULL UNIQUE,
    time_to_spend INTEGER NOT NULL DEFAULT 0,
    distance_from_city_centre DOUBLE NOT NULL DEFAULT 0,
    entry_fees DOUBLE NOT NULL DEFAULT 0,
    city_ID INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY(attraction_ID),
    FOREIGN KEY(city_ID) REFERENCES city(city_ID)
    );
 CREATE TABLE architect(
	architect_ID INTEGER NOT NULL DEFAULT 0,
    architect_name VARCHAR(50) NOT NULL UNIQUE,
    gender VARCHAR(10) NOT NULL,
    living_status VARCHAR(5) NOT NULL,
    year_of_birth INTEGER DEFAULT NULL,
    nationality VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY(architect_ID)
    -- FOREIGN KEY(city_ID) REFERENCES city(city_ID)
    );
 CREATE TABLE builds(
	architect_ID INTEGER NOT NULL DEFAULT 0,
    attraction_ID INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY(architect_ID) REFERENCES architect(architect_ID),
    FOREIGN KEY(attraction_ID) REFERENCES attractions(attraction_ID)
    );
 CREATE TABLE popular_food(
	food_ID INTEGER NOT NULL DEFAULT 0,
    food_name VARCHAR(50) NOT NULL UNIQUE,
    country_ID INTEGER NOT NULL DEFAULT 0,
    no_of_ingredients INTEGER NOT NULL DEFAULT 0,
    type_of_dish VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY(food_ID),
    FOREIGN KEY(country_ID) REFERENCES country(country_ID)
    );
 CREATE TABLE official_language(
	language_ID INTEGER NOT NULL DEFAULT 0,
    language_name VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(language_ID)
    );
 CREATE TABLE spoken(
	language_ID INTEGER NOT NULL DEFAULT 0,
    country_ID INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY(language_ID) REFERENCES official_language(language_ID),
    FOREIGN KEY(country_ID) REFERENCES country(country_ID)
    );

-- DROP TABLE spoken, official_language, popilar_food, builds, architect, attractions, city, country, currency;

-- populate tables
INSERT INTO country values
(1,'India','Asia','New Delhi','Indian National Rupee','+91'),
(2,'Ireland','Europe','Dublin','Euro','+353'),
(3,'Mexico','North America','Mexico City','Mexican Peso','+52'),
(4,'Brazil','South America','Brasilia','Brazilian Real','+55'),
(5,'Kenya','Africa','Nairobi','Kenyan shilling','+254');

INSERT INTO city values
(1,'Dublin','Leinster',117.8,null,'UTC+0','2'),
(2,'Delhi','Union Territory',42.7,1911,'UTC+5:30','1'),
(3,'Cork','Munster',187,600,'UTC+0','2'),
(4,'Nairobi','Nairobi',696,1899,'UTC+3','5'),
(5,'Mexico City','Mexico City',1485,1325,'UTC-6','3'),
(6,'Brasilia','Central-West',5802,1960,'UTC-3','4'),
(7,'Reo De Janeiro','Southeast',1221,1565,'UTC-3','4'),
(8,'Mumbai','Maharastra',4355,1507,'UTC+5:30','1'),
(9,'Tijuana','Buju California',637,1889,'UTC-8','3'),
(10,'Ruiru','Kiambu',292,null,'UTC+3','5');

INSERT INTO attractions values
(1,'Dublin Castle',90,1.3,8,1),
(2,'Dublin Spire',15,0,0,1),
(3,'Frida Kahlo Museum',120,16,27.6,5),
(4,'Pontao da Lago Sul',120,4.3,0,6),
(5,'Sheldrick Wildlife Trust',60,15.2,97,4),
(6,'Nano Nagle Place',60,0.6,7.5,3),
(7,'Corcovado - Christ the Redeemer',90,12.3,28.56,7),
(8,'Red Fort',60,3.9,6.5,2),
(9,'Taj Mahal',120,222,12,2);

INSERT INTO architect values
(1,'Ian Ritchie','Male','Alive',1947,'British'),
(2,'Juan O Gorman','Male','Dead',1905,'Mexican'),
(3,'Paul Landowski','Male','Dead',1857,'French'),
(4,'Gheorghe Leonida','Male','Dead',1892,'Romanian'),
(5,'Ustad Ahmad Lajori','Male','Dead',1580,null),
(6,'Heitor da Silva Costa','Male','Dead',1873,'Brazilian'),
(7,'Albert Caquot','Male','Dead',1881,'French');

INSERT INTO builds values
(1,2),
(2,3),
(3,7),
(4,7),
(5,8),
(5,9),
(6,7),
(7,7);

INSERT INTO popular_food values
(1,'Biryani',1,16,'Main Course'),
(2,'Irish Stew',2,11,'Main Course'),
(3,'Burritos',3,15,'Main Course'),
(4,'Feijoada',4,13,'Main Course'),
(5,'Nyama Choma',5,9,'Main Course'),
(6,'Soda Bread',2,7,'Side'),
(7,'Chilaquiles',3,5,'Main Course'),
(8,'Chicken Tikka Masala',1,17,'Main Course'),
(9,'Irish Cofffee',2,5,'Drink');

INSERT INTO official_language values
(1,'English'),
(2,'Hindi'),
(3,'Portuguese'),
(4,'Spanish'),
(5,'Swahii'),
(6,'Irish');

INSERT INTO spoken values
(1,1),
(1,5),
(1,2),
(2,1),
(3,4),
(4,3),
(5,5),
(6,2);

INSERT INTO currency values
(1,'Indian National Rupee','₹','Indian Government Mint','Reserve Bank of India'),
(2,'Euro','€','Royal Mint','European Central Bank'),
(3,'Mexican Peso','Mex$','La Casa de Moneda de México','Bank Of Mexico'),
(4,'Brazilian Real','R$','Casa da Moeda do Brasil','Central Bank of Brazil'),
(5,'Kenyan shilling','Ksh','De La Rue','Central Bank Of Kenya');

-- create views
CREATE VIEW `Top 5 biggest cities` AS SELECT city_name,city_area, country_ID FROM city
									  WHERE country_ID IN (SELECT country_ID FROM country)
                                      ORDER BY city_area DESC LIMIT 5;

CREATE VIEW `Cheapest Attractions In Each City` AS SELECT attraction_name, entry_fees, city_ID from attractions
												   ORDER BY city_ID, entry_fees;

-- DROP VIEW `Top 5 biggest cities`, `Cheapest Attractions In Each City`;                                                             

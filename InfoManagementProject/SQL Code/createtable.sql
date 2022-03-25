USE info_project;

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
    

USE ENERGYDB2;

################################ General & Comparative Analysis ################################

-- 1. What is the total emission per country for the most recent year available?

SELECT country, year, SUM(emission) AS total_emission
FROM emission_3
WHERE year = (SELECT MAX(year) FROM emission_3)
GROUP BY country, year
ORDER BY total_emission DESC;

-- 2. What are the top 5 countries by GDP in the most recent year?

SELECT Country, Value AS GDP
FROM gdp_3
WHERE year = (SELECT MAX(year) FROM gdp_3)
ORDER BY GDP DESC
LIMIT 5;

-- 3. Compare energy production and consumption by country and year. 

SELECT p.country, p.year, SUM(p.production) AS total_production, SUM(c.consumption) AS total_consumption, (SUM(p.production) - SUM(c.consumption)) AS difference
FROM production_3 p
LEFT JOIN consum_3 c 
    ON p.country = c.country AND p.year = c.year
GROUP BY p.country, p.year
ORDER BY p.country, p.year;

-- 4. Which energy types contribute most to emissions across all countries?

SELECT `energy type`, SUM(emission) AS total_emission
FROM emission_3
GROUP BY `energy type`
ORDER BY total_emission DESC;


################################ Trend Analysis Over Time ################################

-- 1. How have global emissions changed year over year?

SELECT year, SUM(emission) AS global_emission
FROM emission_3
GROUP BY year
ORDER BY year DESC;

-- 2. What is the trend in GDP for each country over the given years?

SELECT Country, year, Value AS GDP
FROM gdp_3
ORDER BY Country, year;

-- 3. How has population growth affected total emissions in each country?

SELECT p.countries AS Country, p.year, p.Value AS population, e.emission AS total_emission
FROM population_3 p
JOIN emission_3 e
ON p.countries = e.country AND p.year = e.year
ORDER BY Country, year;

-- 4. Has energy consumption increased or decreased over the years for major economies?

SELECT country, year, SUM(consumption) AS total_consumption
FROM consum_3
WHERE country IN ('United States', 'China', 'India', 'Japan', 'Germany')
GROUP BY country, year
ORDER BY country, year;

-- 5. What is the average yearly change in emissions per capita for each country?

SELECT country, round(AVG(`per capita emission`),10) AS avg_per_capita_emission
FROM emission_3
GROUP BY country
ORDER BY avg_per_capita_emission DESC;


################################ Ratio & Per Capita Analysis ################################

-- 1. What is the emission-to-GDP ratio for each country by year?

SELECT e.country, e.year, (SUM(e.emission) / SUM(g.Value)*100) AS emission_to_gdp_ratio
FROM emission_3 e
JOIN gdp_3 g
  ON e.country = g.Country AND e.year = g.year
GROUP BY e.country, e.year
ORDER BY emission_to_gdp_ratio DESC;

-- 2. What is the energy consumption per capita for each country over the last decade?

SELECT c.country, c.year, SUM(c.consumption) / SUM(p.Value) AS consumption_per_capita
FROM consum_3 c
JOIN population_3 p
  ON c.country = p.countries AND c.year = p.year
WHERE c.year >= (SELECT MAX(year) - 10 FROM consum_3)
GROUP BY c.country, c.year
ORDER BY c.country, c.year;

-- 3. How does energy production per capita vary across countries?

SELECT pr.country, pr.year, SUM(pr.production) / SUM(p.Value) AS production_per_capita
FROM production_3 pr
JOIN population_3 p
  ON pr.country = p.countries AND pr.year = p.year
GROUP BY pr.country, pr.year
ORDER BY production_per_capita DESC;

-- 4. Which countries have the highest energy consumption relative to GDP?

SELECT c.country, c.year, SUM(c.consumption) / SUM(g.Value) AS consumption_to_gdp_ratio
FROM consum_3 c
JOIN gdp_3 g
  ON c.country = g.Country AND c.year = g.year
GROUP BY c.country, c.year
ORDER BY consumption_to_gdp_ratio DESC
LIMIT 10;

-- 5. What is the correlation between GDP growth and energy production growth?

SELECT g.Country, g.year,
(g.Value - LAG(g.Value,1) OVER (PARTITION BY g.Country ORDER BY g.year)) AS gdp_growth,
(p.production - LAG(p.production,1) OVER (PARTITION BY p.country ORDER BY p.year)) AS production_growth
FROM gdp_3 g
JOIN production_3 p
  ON g.Country = p.country AND g.year = p.year;


################################ Global Comparisons ################################

-- 1. What are the top 10 countries by population and how do their emissions compare?

SELECT p.countries AS Country, p.Value AS population, e.emission AS total_emission
FROM population_3 p
JOIN emission_3 e
  ON p.countries = e.country AND p.year = e.year
WHERE p.year = (SELECT MAX(year) FROM population_3)
ORDER BY population DESC
LIMIT 10;

-- 2. Which countries have improved (reduced) their per capita emissions the most over the last decade?

SELECT country, (MAX(`per capita emission`) - MIN(`per capita emission`)) AS change_in_emission
FROM emission_3
WHERE year >= (SELECT MAX(year) - 10 FROM emission_3)
GROUP BY country
ORDER BY change_in_emission ASC
LIMIT 10;

-- 3. What is the global share (%) of emissions by country?

SELECT country, (SUM(emission) / (SELECT SUM(emission) FROM emission_3) * 100) AS global_share_percent
FROM emission_3
GROUP BY country
ORDER BY global_share_percent DESC;

-- 4. What is the global average GDP, emission, and population by year?

SELECT g.year, AVG(g.Value) AS avg_gdp, AVG(e.emission) AS avg_emission, AVG(p.Value) AS avg_population
FROM gdp_3 g
JOIN emission_3 e ON g.Country = e.country AND g.year = e.year
JOIN population_3 p ON g.Country = p.countries AND g.year = p.year
GROUP BY g.year
ORDER BY g.year;


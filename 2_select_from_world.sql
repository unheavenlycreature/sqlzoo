/* Exercises at https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial */
/* Exercise 1 */
SELECT
  name,
  continent,
  population
FROM
  world;

/* Exercise 2 */
SELECT
  name
FROM
  world
WHERE
  population >= 200000000;

/* Exercise 3 */
SELECT
  name,
  gdp / population
FROM
  world
WHERE
  population >= 200000000;

/* Exercise 4 */
SELECT
  name,
  population / 1000000
FROM
  world
WHERE
  continent = 'South America';

/* Exercise 5 */
SELECT
  name,
  population
FROM
  world
WHERE
  name IN ('France', 'Germany', 'Italy');

/* Exercise 6 */
SELECT
  name
FROM
  world
WHERE
  name LIKE '%United%';

/* Exercise 7 */
SELECT
  name,
  population,
  area
FROM
  world
WHERE
  area > 3000000
  OR population > 250000000;

/* Exercise 8 */
SELECT
  name,
  population,
  area
FROM
  world
WHERE
  area > 3000000
  XOR population > 250000000;

/* Exercise 9 */
SELECT
  name,
  ROUND(population / 1000000, 2),
  ROUND(gdp / 1000000000, 2)
FROM
  world
WHERE
  continent = 'South America';

/* Exercise 10 */
SELECT
  name,
  ROUND(gdp / population, -3)
FROM
  world
WHERE
  gdp >= 1000000000000;

/* Exercise 11 */
SELECT
  name,
  capital
FROM
  world
WHERE
  length(name) = length(capital);

/* Exercise 12 */
SELECT
  name,
  capital
FROM
  world
WHERE
  name <> capital
  AND left(name, 1) = left(capital, 1);

/* Exercise 13 */
SELECT
  name
FROM
  world
WHERE
  name NOT LIKE '% %'
  AND name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%';
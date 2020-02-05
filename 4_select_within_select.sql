/* Exercises from https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial */
/* Exercise 1 */
SELECT
  name
FROM
  world
WHERE
  population > (
    SELECT
      population
    FROM
      world
    WHERE
      name = 'Russia'
  );

/* Exercise 2 */
SELECT
  name
FROM
  world
WHERE
  continent = 'Europe'
  AND gdp / population > (
    SELECT
      gdp / population
    FROM
      world
    WHERE
      name = 'United Kingdom'
  );

/* Exercise 3 */
SELECT
  name,
  continent
FROM
  world
WHERE
  continent IN (
    SELECT
      continent
    FROM
      world
    WHERE
      name IN ('Argentina', 'Australia')
  )
ORDER BY
  name;

/* Exercise 4 */
SELECT
  name,
  population
FROM
  world
WHERE
  population > (
    SELECT
      population
    FROM
      world
    WHERE
      name = 'Canada'
  )
  AND population < (
    SELECT
      population
    FROM
      world
    WHERE
      name = 'Poland'
  );

/* Exercise 5 */
SELECT
  name,
  concat(
    round(
      population /(
        SELECT
          population
        FROM
          world
        WHERE
          name = 'Germany'
      ) * 100,
      0
    ),
    '%'
  )
FROM
  world
WHERE
  continent = 'Europe';

/* Exercise 6 */
SELECT
  name
FROM
  world
WHERE
  gdp > ALL (
    SELECT
      gdp
    FROM
      world
    WHERE
      gdp > 0
      AND continent = 'Europe'
  );

/* Exercise 7 */
SELECT
  continent,
  name,
  area
FROM
  world x
WHERE
  area >= ALL (
    SELECT
      area
    FROM
      world y
    WHERE
      y.continent = x.continent
      AND area > 0
  );

/* Exercise 8 */
SELECT
  continent,
  name
FROM
  world x
WHERE
  name <= ALL (
    SELECT
      name
    FROM
      world y
    WHERE
      x.continent = y.continent
  );

/* Exercise 9 */
SELECT
  name,
  continent,
  population
FROM
  world z
WHERE
  continent IN (
    SELECT
      continent
    FROM
      world x
    WHERE
      NOT EXISTS (
        SELECT
          *
        FROM
          world y
        WHERE
          x.continent = y.continent
          AND population > 25000000
      )
  );

/* Exercise 10 */
SELECT
  name,
  continent
FROM
  world x
WHERE
  population > ALL (
    SELECT
      population * 3
    FROM
      world y
    WHERE
      x.name <> y.name
      AND x.continent = y.continent
  );
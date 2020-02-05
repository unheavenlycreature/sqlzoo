/* Exercises from https://sqlzoo.net/wiki/SELECT_names */
/* Exercise 1 */
SELECT
  name
FROM
  world
WHERE
  name LIKE 'Y%';

/* Exercise 2 */
SELECT
  name
FROM
  world
WHERE
  name LIKE '%y';

/* Exercise 3 */
SELECT
  name
FROM
  world
WHERE
  name LIKE '%x%';

/* Exercise 4 */
SELECT
  name
FROM
  world
WHERE
  name LIKE '%land';

/* Exercise 5 */
SELECT
  name
FROM
  world
WHERE
  name LIKE 'C%ia';

/* Exercise 6 */
SELECT
  name
FROM
  world
WHERE
  name LIKE '%oo%';

/* Exercise 7 */
SELECT
  name
FROM
  world
WHERE
  name LIKE '%a%a%a%';

/* Exercise 8 */
SELECT
  name
FROM
  world
WHERE
  name LIKE '_t%'
ORDER BY
  name;

/* Exercise 9 */
SELECT
  name
FROM
  world
WHERE
  name LIKE '%o__o%';

/* Exercise 10 */
SELECT
  name
FROM
  world
WHERE
  name LIKE '____';

/* Exercise 11 */
SELECT
  name
FROM
  world
WHERE
  name = capital;

/* Exercise 12 */
SELECT
  name
FROM
  world
WHERE
  capital = concat(name, ' City');

/* Exercise 13 */
SELECT
  capital,
  name
FROM
  world
WHERE
  capital LIKE concat(concat('%', name), '%');

/* Exercise 14 */
SELECT
  capital,
  name
FROM
  world
WHERE
  capital LIKE concat(concat('%', name), '%')
  AND length(capital) > length(name);

/* Exercise 15 */
SELECT
  name,
  REPLACE(capital, name, '')
FROM
  world
WHERE
  capital LIKE concat(name, '%')
  AND name <> capital
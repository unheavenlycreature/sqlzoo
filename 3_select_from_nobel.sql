/* Exercises from https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial */
/* Exercise 1 */
SELECT
  yr,
  subject,
  winner
FROM
  nobel
WHERE
  yr = 1950;

/* Exercise 2 */
SELECT
  winner
FROM
  nobel
WHERE
  yr = 1962
  AND subject = 'Literature';

/* Exercise 3 */
SELECT
  yr,
  subject
FROM
  nobel
WHERE
  winner = 'Albert Einstein';

/* Exercise 4 */
SELECT
  winner
FROM
  nobel
WHERE
  yr >= 2000
  AND subject = 'Peace';

/* Exercise 5 */
SELECT
  *
FROM
  nobel
WHERE
  subject = 'Literature'
  AND yr >= 1980
  AND yr < 1990;

/* Exercise 6 */
SELECT
  *
FROM
  nobel
WHERE
  winner IN (
    'Theodore Roosevelt',
    'Woodrow Wilson',
    'Jimmy Carter',
    'Barack Obama'
  );

/* Exercise 7 */
SELECT
  winner
FROM
  nobel
WHERE
  winner LIKE 'John%';

/* Exercise 8 */
SELECT
  *
FROM
  nobel
WHERE
  subject = 'Physics'
  AND yr = 1980
  OR subject = 'Chemistry'
  AND yr = 1984;

/* Exercise 9 */
SELECT
  *
FROM
  nobel
WHERE
  yr = 1980
  AND subject NOT IN ('Chemistry', 'Medicine');

/* Exercise 10 */
SELECT
  *
FROM
  nobel
WHERE
  subject = 'Medicine'
  AND yr < 1910
  OR subject = 'Literature'
  AND yr > 2003;

/* Exercise 11 */
SELECT
  *
FROM
  nobel
WHERE
  winner = 'Peter Grünberg'
  /* Exercise 12 */
SELECT
  *
FROM
  nobel
WHERE
  winner = 'Eugene O''Neill';

/* Exercise 13 */
SELECT
  winner,
  yr,
  subject
FROM
  nobel
WHERE
  winner LIKE 'Sir%'
ORDER BY
  yr DESC,
  winner;

/* Exercise 14 */
SELECT
  winner,
  subject
FROM
  nobel
WHERE
  yr = 1984
ORDER BY
  subject IN ('Physics', 'Chemistry') ASC,
  subject,
  winner
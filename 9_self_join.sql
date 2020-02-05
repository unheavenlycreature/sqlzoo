/* Exercises from https://sqlzoo.net/wiki/Self_join */
/* Exercise 1 */
SELECT
  count(*)
FROM
  stops;

/* Exercise 2 */
SELECT
  id
FROM
  stops
WHERE
  name = 'Craiglockhart';

/* Exercise 3 */
SELECT
  id,
  name
FROM
  stops
  JOIN route ON stops.id = route.stop
WHERE
  num = '4'
  AND company = 'LRT';

/* Exercise 4 */
SELECT
  company,
  num,
  COUNT(*)
FROM
  route
WHERE
  STOP = 149
  OR STOP = 53
GROUP BY
  company,
  num
HAVING
  COUNT(*) > 1;

/* Exercise 5 */
SELECT
  a.company,
  a.num,
  a.stop,
  b.stop
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops ON b.stop = stops.id
WHERE
  a.stop = 53
  AND stops.name = 'London Road';

/* Exercise 6 */
SELECT
  a.company,
  a.num,
  stopa.name,
  stopb.name
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart'
  AND stopb.name = 'London Road';

/* Exercise 7 */
SELECT
  a.company,
  a.num
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopsa ON (a.stop = stopsa.id)
  JOIN stops stopsb ON (stopsb.id = b.stop)
WHERE
  stopsa.name = 'Haymarket'
  AND stopsb.name = 'Leith'
GROUP BY
  num;

/* Exercise 8 */
SELECT
  a.company,
  a.num
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopsa ON (a.stop = stopsa.id)
  JOIN stops stopsb ON (stopsb.id = b.stop)
WHERE
  stopsa.name = 'Craiglockhart'
  AND stopsb.name = 'Tollcross'
GROUP BY
  num;

/* Exercise 9 */
SELECT
  DISTINCT(stopsb.name),
  a.company,
  a.num
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopsa ON (a.stop = stopsa.id)
  JOIN stops stopsb ON (stopsb.id = b.stop)
WHERE
  stopsa.name = 'Craiglockhart';

/* Exercise 10 */
SELECT
  a.num,
  a.company,
  stopsc.name,
  c.num,
  c.company
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopsa ON (a.stop = stopsa.id)
  JOIN stops stopsb ON (stopsb.id = b.stop)
  JOIN stops stopsc ON(stopsc.id = stopsb.id)
  JOIN route c ON (c.stop = stopsb.id)
  JOIN route d ON (
    c.company = d.company
    AND c.num = d.num
  )
  JOIN stops stopsd ON (d.stop = stopsd.id)
WHERE
  stopsa.name = 'Craiglockhart'
  AND stopsd.name = 'Lochend'
ORDER BY
  a.num,
  a.company,
  stopsc.name,
  c.num,
  c.company;
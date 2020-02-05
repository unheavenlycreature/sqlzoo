/* Exercises from https://sqlzoo.net/wiki/More_JOIN_operations */
/* Exercise 1 */
SELECT
  id,
  title
FROM
  movie
WHERE
  yr = 1962;

/* Exercise 2 */
SELECT
  yr
FROM
  movie
WHERE
  title = 'Citizen Kane';

/* Exercise 3 */
SELECT
  id,
  title,
  yr
FROM
  movie
WHERE
  title LIKE '%Star Trek%'
ORDER BY
  yr ASC;

/* Exercise 5 */
SELECT
  id
FROM
  actor
WHERE
  name = 'Glenn Close';

/* Exercise 4 */
SELECT
  id
FROM
  movie
WHERE
  title = 'Casablanca';

/* Exercise 6 */
SELECT
  name
FROM
  actor
  JOIN casting ON actor.id = casting.actorid
WHERE
  movieid = 11768;

/* Exercise 7 */
SELECT
  name
FROM
  actor
  JOIN casting ON actor.id = casting.actorid
  JOIN movie ON movie.id = casting.movieid
WHERE
  title = 'Alien';

/* Exercise 8 */
SELECT
  title
FROM
  movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON casting.actorid = actor.id
WHERE
  name = 'Harrison Ford';

/* Exercise 9 */
SELECT
  title
FROM
  movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON casting.actorid = actor.id
WHERE
  name = 'Harrison Ford'
  AND casting.ord != 1;

/* Exercise 10 */
SELECT
  title,
  name
FROM
  movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON actor.id = casting.actorid
WHERE
  movie.yr = 1962
  AND ord = 1;

/* Exercise 11 */
SELECT
  yr,
  COUNT(title)
FROM
  movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE
  name = 'Rock Hudson'
GROUP BY
  yr
HAVING
  COUNT(title) > 2;

/* Exercise 12 */
SELECT
  title,
  name
FROM
  movie
  JOIN casting a ON movie.id = a.movieid
  JOIN actor ON a.actorid = actor.id
WHERE
  ord = 1
  AND EXISTS (
    SELECT
      1
    FROM
      casting b
      JOIN actor c ON b.actorid = c.id
    WHERE
      c.name = 'Julie Andrews'
      AND b.movieid = movie.id
  );

/* Exercise 13 */
SELECT
  DISTINCT(name)
FROM
  actor
  JOIN casting ON actor.id = casting.actorid
WHERE
  15 <= (
    SELECT
      count(*)
    FROM
      casting b
    WHERE
      b.ord = 1
      AND b.actorid = actor.id
  )
ORDER BY
  name;

/* Exercise 14 */
SELECT
  title,
  COUNT(actorid)
FROM
  movie
  JOIN casting a ON movie.id = casting.movieid
  JOIN actor ON casting.actorid = actor.id
WHERE
  yr = 1978
GROUP BY
  movieid
ORDER BY
  COUNT(name) DESC,
  title;

/* Exercise 15 */
SELECT
  DISTINCT(name)
FROM
  actor
  JOIN casting ON actor.id = casting.actorid
  JOIN movie ON movie.id = casting.movieid
WHERE
  name <> 'Art Garfunkel'
  AND EXISTS (
    SELECT
      1
    FROM
      actor a
      JOIN casting c ON c.actorid = a.id
    WHERE
      a.name = 'Art Garfunkel'
      AND c.movieid = casting.movieid
  );
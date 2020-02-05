/* Exercises from https://sqlzoo.net/wiki/The_JOIN_operation */
/* Exercise 1 */
SELECT
  matchid,
  player
FROM
  goal
WHERE
  teamid = 'GER';

/* Exercise 2 */
SELECT
  id,
  stadium,
  team1,
  team2
FROM
  game
WHERE
  id = 1012;

/* Exercise 3 */
SELECT
  player,
  teamid,
  stadium,
  mdate
FROM
  game
  JOIN goal ON (id = matchid)
WHERE
  teamid = 'GER';

/* Exercise 4 */
SELECT
  team1,
  team2,
  player
FROM
  game
  JOIN goal ON id = matchid
WHERE
  player LIKE 'Mario%';

/* Exercise 5 */
SELECT
  player,
  teamid,
  coach,
  gtime
FROM
  goal
  JOIN eteam ON teamid = id
WHERE
  gtime <= 10;

/* Exercise 6 */
SELECT
  mdate,
  teamname
FROM
  game
  JOIN eteam ON (team1 = eteam.id)
WHERE
  coach = 'Fernando Santos';

/* Exercise 7 */
SELECT
  player
FROM
  goal
  JOIN game ON matchid = id
WHERE
  stadium = 'National Stadium, Warsaw';

/* Exercise 8 */
SELECT
  DISTINCT player
FROM
  game
  JOIN goal ON matchid = id
WHERE
  teamid != 'GER'
  AND 'GER' IN (team1, team2);

/* Exercise 9 */
SELECT
  teamname,
  count(*)
FROM
  goal
  JOIN eteam ON eteam.id = goal.teamid
GROUP BY
  teamname;

/* Exercise 10 */
SELECT
  stadium,
  count(*)
FROM
  game
  JOIN goal ON goal.matchid = game.id
GROUP BY
  stadium;

/* Exercise 11 */
SELECT
  matchid,
  mdate,
  count(*)
FROM
  game
  JOIN goal ON matchid = id
WHERE
  'POL' IN (team1, team2)
GROUP BY
  matchid;

/* Exercise 12 */
SELECT
  matchid,
  mdate,
  count(*)
FROM
  game x
  JOIN goal ON x.id = matchid
WHERE
  teamid = 'GER'
GROUP BY
  matchid;

/* Exercise 13 */
SELECT
  matchid,
  mdate,
  count(*)
FROM
  game x
  JOIN goal ON x.id = matchid
WHERE
  teamid = 'GER'
GROUP BY
  matchid
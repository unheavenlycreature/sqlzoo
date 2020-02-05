/* Exercises from https://sqlzoo.net/wiki/Using_Null */
/* Exercise 1 */
SELECT
  name
FROM
  teacher
WHERE
  dept IS NULL;

/* Exercise 2 */
SELECT
  teacher.name,
  dept.name
FROM
  teacher
  INNER JOIN dept ON (teacher.dept = dept.id);

/* Exercise 3 */
SELECT
  teacher.name,
  dept.name
FROM
  teacher
  LEFT JOIN dept ON teacher.dept = dept.id;

/* Exercise 4 */
SELECT
  teacher.name,
  dept.name
FROM
  teacher
  RIGHT JOIN dept ON teacher.dept = dept.id;

/* Exercise 5 */
SELECT
  name,
  coalesce(mobile, '07986 444 2266')
FROM
  teacher;

/* Exercise 6 */
SELECT
  teacher.name,
  coalesce(dept.name, 'None')
FROM
  teacher
  LEFT JOIN dept ON teacher.dept = dept.id;

/* Exercise 7 */
SELECT
  count(teacher.name),
  count(mobile)
FROM
  teacher;

/* Exercise 8 */
SELECT
  dept.name,
  count(teacher.name)
FROM
  teacher
  RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY
  dept.name;

/* Exercise 9 */
SELECT
  name,
  CASE
    dept
    WHEN 1 THEN 'Sci'
    WHEN 2 THEN 'Sci'
    ELSE 'Art'
  END
FROM
  teacher;

/* Exercise 10 */
SELECT
  name,
  CASE
    dept
    WHEN 1 THEN 'Sci'
    WHEN 2 THEN 'Sci'
    WHEN 3 THEN 'Art'
    ELSE 'None'
  END
FROM
  teacher;
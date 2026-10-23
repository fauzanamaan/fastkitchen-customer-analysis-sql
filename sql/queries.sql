-- Queries copied as written from the completed document. Each was run on its own in the Global Career Accelerator SQL app, so they are not meant to run as one script.

-- Task 1A
SELECT
  ROUND(AVG(total), 2) AS avg_total
FROM fastkitchen.orders

-- Task 1B
SELECT
  order_type,
  ROUND(AVG(subtotal), 2) AS avg_subtotal,
  ROUND(AVG(tip), 2) AS avg_tip,
  ROUND(AVG(total), 2) AS avg_total
FROM fastkitchen.orders
GROUP BY
  order_type

-- Task 1C
SELECT
  COUNT(*) AS num_orders
FROM fastkitchen.orders
WHERE user_id IS NOT NULL

-- Task 1D
SELECT
  COUNT(*) AS num_orders
FROM fastkitchen.orders
WHERE user_id IS NULL

-- Task 2A
SELECT
  city,
  COUNT(*) AS num_users
FROM fastkitchen.users
GROUP BY
  city

-- Task 2B
SELECT
  city,
  zip,
  COUNT(*) AS num_users
FROM fastkitchen.users
GROUP BY
  city,
  zip
ORDER BY num_users DESC

-- Task 3A
SELECT
  *
FROM
  fastkitchen.orders AS o
LEFT JOIN fastkitchen.users AS u
  ON o.user_id = u.user_id

-- Task 3B
WITH full_data AS (
SELECT
  o.user_id AS order_user_id,
  u.user_id AS user_user_id,
  o.*,
  u.*
FROM
  fastkitchen.orders AS o
LEFT JOIN fastkitchen.users AS u
  ON o.user_id = u.user_id)

SELECT
  order_user_id,
  zip,
  SUM(total) AS total_spent
FROM
  full_data
GROUP BY
  order_user_id,
  zip
ORDER BY
  total_spent DESC

-- Task 3C
WITH full_data AS (
SELECT
  o.*,
  u.*
FROM
  fastkitchen.orders AS o
LEFT JOIN fastkitchen.users AS u
  ON o.user_id = u.user_id)

SELECT
  zip,
  ROUND(AVG(total), 2) AS avg_spent
FROM
  full_data
GROUP BY
  zip
ORDER BY
  avg_spent DESC

-- Comments in SQL Start with dash-dash --
-- Search for app with id of 1880 --
SELECT
  app_name
FROM
  analytics
WHERE
  id = 1880
  -- Search for apps and ids that were last updated on Auguyst 01, 2018 --
SELECT
  app_name,
  id
FROM
  analytics
WHERE
  last_updated = 'August 01, 2018';

-- Count the number of apps in each category --
SELECT
  category,
  COUNT(*) AS app_count
FROM
  analytics
GROUP BY
  category
ORDER BY
  app_count DESC;

-- Find the top 5 most-reviewed apps and the number of reviews for each --
SELECT
  app_name,
  reviews
FROM
  analytics
ORDER BY
  reviews DESC
LIMIT
  5;

-- Find the app that has the most reviews with a rating greater than or equal to 4.8 --
SELECT
  app_name,
  reviews,
  rating
FROM
  analytics
WHERE
  rating >= 4.8
ORDER BY
  reviews DESC
LIMIT
  1;

-- Find the average rating for each category ordered by the highest rated to lowest rated --
SELECT
  category,
  AVG(rating) AS average_ratings
FROM
  analytics
GROUP BY
  category
ORDER BY
  average_ratings DESC;

-- Find the name, price, and rating of the most expensive app with a rating that’s less than 3 --
SELECT
  app_name,
  price,
  rating
FROM
  analytics
WHERE
  rating < 3
ORDER BY
  price DESC
LIMIT
  1;

-- Find all apps with a min install not above 50, and must have a rating --
SELECT
  app_name,
  rating,
  min_installs
FROM
  analytics
WHERE
  min_installs <= 50
  AND rating IS NOT NULL
ORDER BY
  rating DESC;

-- Find the apps that are rated less than 3 with at least 10000 reviews --
SELECT
  app_name
FROM
  analytics
WHERE
  rating < 3
  AND reviews >= 10000;

-- Find the top 10 most-reviewed apps that cost between 10 cents and a dollar --
SELECT
  app_name,
  reviews,
  price
FROM
  analytics
WHERE
  price BETWEEN 0.10 AND 1.00
ORDER BY
  reviews DESC
LIMIT
  10;

-- Find the most out of date app --
SELECT
  app_name,
  last_updated AS Most_OOD
FROM
  analytics
WHERE
  last_updated = (
    SELECT
      MIN(last_updated)
    FROM
      analytics
  );

-- Find the most expensive app --
SELECT
  app_name,
  price
FROM
  analytics
WHERE
  price = (
    SELECT
      MAX(price)
    FROM
      analytics
  );

-- Count all the reviews in the Google Play Store --
SELECT
  SUM(reviews) AS sum_of_Reviews
FROM
  analytics;

-- Find all the categories that have more than 300 apps in them
SELECT
  category,
  COUNT(app_name) AS num_of_apps
FROM
  analytics
GROUP BY
  category
HAVING
  COUNT(app_name) > 300
ORDER BY
  num_of_apps DESC;

-- Find the app that has the highest proportion of min_installs to reviews. Display also the app name, min_installs, reviews and proportion--
SELECT
  app_name,
  reviews,
  min_installs,
  (min_installs / reviews) AS proportion
FROM
  analytics
WHERE
  min_installs >= 100000
ORDER BY
  proportion DESC
LIMIT
  1;
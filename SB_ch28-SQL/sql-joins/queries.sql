-- write your queries here --
-- Join both tables with all columns shown --
SELECT
    *
FROM
    owners
    JOIN vehicles ON owners.id = vehicles.owner_id;

-- Count the number of cars for each owner. Display the owners first_name , last_name and count of vehicle --
SELECT
    owners.first_name,
    owners.last_name,
    COUNT(vehicles.id) AS vehicle_count
FROM
    owners
    JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY
    owners.first_name,
    owners.last_name
ORDER BY
    owners.first_name ASC;

-- Count the number of cars for each owner and display the average price for each of the cars as integers --
SELECT
    owners.first_name,
    owners.last_name,
    AVG(vehicles.price) AS average_price,
    COUNT(vehicles.id) AS vehicle_count
FROM
    owners
    JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY
    owners.first_name,
    owners.last_name
HAVING
    AVG(vehicles.price) > 10000
    AND COUNT(vehicles.id) > 1
ORDER BY
    owners.first_name DESC;
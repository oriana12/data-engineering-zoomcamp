-- ============================================================
-- Module 1 Homework - Docker & SQL
-- DataTalksClub Data Engineering Zoomcamp
-- ============================================================


-- ============================================================
-- Question 3
-- Counting short trips
-- Answer: 8,007
-- ============================================================

SELECT COUNT(*) AS short_trips
FROM green_tripdata_2025_11
WHERE lpep_pickup_datetime >= '2025-11-01'
  AND lpep_pickup_datetime < '2025-12-01'
  AND trip_distance <= 1;


-- ============================================================
-- Question 4
-- Longest trip for each day
-- Answer: 2025-11-14
-- ============================================================

SELECT
    DATE(lpep_pickup_datetime) AS pickup_day,
    MAX(trip_distance) AS longest_trip_distance
FROM green_tripdata_2025_11
WHERE lpep_pickup_datetime >= '2025-11-01'
  AND lpep_pickup_datetime < '2025-12-01'
  AND trip_distance < 100
GROUP BY DATE(lpep_pickup_datetime)
ORDER BY longest_trip_distance DESC
LIMIT 1;


-- ============================================================
-- Question 5
-- Biggest pickup zone
-- Answer: East Harlem North
-- ============================================================

SELECT
    z."Zone" AS pickup_zone,
    SUM(g.total_amount) AS total_amount_sum
FROM green_tripdata_2025_11 AS g
JOIN taxi_zone_lookup AS z
    ON g."PULocationID" = z."LocationID"
WHERE g.lpep_pickup_datetime >= '2025-11-18'
  AND g.lpep_pickup_datetime < '2025-11-19'
GROUP BY z."Zone"
ORDER BY total_amount_sum DESC
LIMIT 1;


-- ============================================================
-- Question 6
-- Largest tip
-- Answer: Yorkville West
-- ============================================================

SELECT
    dz."Zone" AS dropoff_zone,
    MAX(g.tip_amount) AS largest_tip
FROM green_tripdata_2025_11 AS g
JOIN taxi_zone_lookup AS pz
    ON g."PULocationID" = pz."LocationID"
JOIN taxi_zone_lookup AS dz
    ON g."DOLocationID" = dz."LocationID"
WHERE g.lpep_pickup_datetime >= '2025-11-01'
  AND g.lpep_pickup_datetime < '2025-12-01'
  AND pz."Zone" = 'East Harlem North'
GROUP BY dz."Zone"
ORDER BY largest_tip DESC
LIMIT 1;

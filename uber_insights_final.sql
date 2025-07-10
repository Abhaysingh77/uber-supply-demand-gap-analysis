
-- 1. Total requests per hour and status with AM/PM labels
SELECT 
    CASE
        WHEN Request_time LIKE '%AM' THEN
            CASE 
                WHEN CAST(SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) AS INTEGER) = 12 THEN '12 AM'
                ELSE SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) || ' AM'
            END
        ELSE
            CASE 
                WHEN CAST(SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) AS INTEGER) = 12 THEN '12 PM'
                ELSE (CAST(SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) AS TEXT)) || ' PM'
            END
    END AS hour_label,
    Status,
    COUNT(*) AS total_requests
FROM uber_requests
GROUP BY hour_label, Status
ORDER BY 
    CASE
        WHEN hour_label = '12 AM' THEN 0
        WHEN hour_label LIKE '%AM' THEN CAST(REPLACE(hour_label, ' AM', '') AS INTEGER)
        WHEN hour_label = '12 PM' THEN 12
        ELSE CAST(REPLACE(hour_label, ' PM', '') AS INTEGER) + 12
    END,
    Status;

-- 2. Percentage share of each status
SELECT 
    Status,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM uber_requests) AS percentage
FROM uber_requests
GROUP BY Status
ORDER BY percentage DESC;

-- 3. Requests by pickup point and status
SELECT 
    Pickup_point,
    Status,
    COUNT(*) AS request_count
FROM uber_requests
GROUP BY Pickup_point, Status
ORDER BY Pickup_point;

-- 4. Peak failure hours with AM/PM labels
SELECT 
    CASE
        WHEN Request_time LIKE '%AM' THEN
            CASE 
                WHEN CAST(SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) AS INTEGER) = 12 THEN '12 AM'
                ELSE SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) || ' AM'
            END
        ELSE
            CASE 
                WHEN CAST(SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) AS INTEGER) = 12 THEN '12 PM'
                ELSE (CAST(SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) AS TEXT)) || ' PM'
            END
    END AS hour_label,
    COUNT(*) AS failed_requests
FROM uber_requests
WHERE Status IN ('Cancelled', 'No Cars Available')
GROUP BY hour_label
ORDER BY failed_requests DESC;

-- 5. Top 5 drivers who cancelled most rides
SELECT 
    Driver_id,
    COUNT(*) AS cancelled_rides
FROM uber_requests
WHERE Status = 'Cancelled'
GROUP BY Driver_id
ORDER BY cancelled_rides DESC
LIMIT 5;

-- 6. Failure rate per hour label (%)
SELECT 
    CASE
        WHEN Request_time LIKE '%AM' THEN
            CASE 
                WHEN CAST(SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) AS INTEGER) = 12 THEN '12 AM'
                ELSE SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) || ' AM'
            END
        ELSE
            CASE 
                WHEN CAST(SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) AS INTEGER) = 12 THEN '12 PM'
                ELSE (CAST(SUBSTR(Request_time, 1, INSTR(Request_time, ':') - 1) AS TEXT)) || ' PM'
            END
    END AS hour_label,
    COUNT(CASE WHEN Status IN ('Cancelled', 'No Cars Available') THEN 1 END) * 100.0 / COUNT(*) AS failure_rate_percent
FROM uber_requests
GROUP BY hour_label
ORDER BY failure_rate_percent DESC;

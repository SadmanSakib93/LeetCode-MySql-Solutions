-- https://leetcode.com/problems/trips-and-users/description/
WITH unbanned_trips AS(
    SELECT *
    FROM Trips
    WHERE client_id NOT IN (SELECT users_id FROM Users WHERE banned='Yes') AND
        driver_id NOT IN (SELECT users_id FROM Users WHERE banned='Yes') AND
        request_at BETWEEN "2013-10-01" AND "2013-10-03"

),

total_trips AS(
    SELECT request_at, COALESCE(COUNT(*), 0) AS total_trips
    FROM unbanned_trips
    GROUP BY request_at

)

SELECT a.request_at AS Day, ROUND(COALESCE((b.total_completed_trips/a.total_trips), 0), 2) AS 'Cancellation Rate'
FROM total_trips a
LEFT JOIN (
    SELECT request_at, COUNT(*) AS total_completed_trips
    FROM unbanned_trips
    WHERE status='cancelled_by_driver' OR status='cancelled_by_client'
    GROUP BY request_at
) b ON a.request_at=b.request_at

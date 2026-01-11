-- Average satisfaction by sessions per week
SELECT sessions_per_week, AVG(satisfaction_score) AS avg_satisfaction
FROM users
GROUP BY sessions_per_week
ORDER BY sessions_per_week;

-- Users who dropped out
SELECT *
FROM users
WHERE dropped_out = 'yes';

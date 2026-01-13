-- Average satisfaction by sessions per week
SELECT sessions_per_week, AVG(satisfaction_score) AS avg_satisfaction
FROM users
GROUP BY sessions_per_week
ORDER BY sessions_per_week;

-- Users who dropped out
SELECT *
FROM users
WHERE dropped_out = 'yes';

-- Does higher usage correlates with higher satisfaction? Let's find out
SELECT sessions_per_week,
  AVG(satisfaction_score) AS avg_satisfaction
FROM users
GROUP BY sessions_per_week
ORDER BY sessions_per_week;

-- Now, does lower usage correlates with droputs?
SELECT dropped_out,
  AVG(satisfaction_score) AS avg_satisfaction
FROM users
GROUP BY dropped_out;

-- Let's talk about age now. Is there any difference in satisfaction level in between age groups?
SELECT
  CASE 
    WHEN age < 25 THEN 'Under 25'
    WHEN age BETWEEN 25 AND 35 THEN '25 - 35'
    ELSE 'Over 35'
  END AS age_group,
  AVG(satisfaction_score) AS avg_satisfaction
FROM users
GROUP BY age_group;

-- Now let's go a little deeper. What profile has a higher drop out rate?
SELECT 
  sessions_per_week,
  AVG(satisfaction_score) AS avg_satisfaction,
  COUNT(*) AS total_users
FROM users
WHERE dropped_out = 'yes'
GROUP BY sessions_per_week;

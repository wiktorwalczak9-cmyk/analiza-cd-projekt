Exploratory and supporting queries used for data validation, sanity checks and addictional insights.
 
SELECT
    ROUND(AVG(net_profit * 1.0 / revenue), 3) AS avg_net_margin
FROM cdprojekt_financials
WHERE TRIM(UPPER(period_type)) = 'FY';

SELECT year, net_profit
FROM cdprojekt_financials
WHERE TRIM(UPPER(period_type)) = 'FY'
ORDER BY net_profit DESC
LIMIT 1;

SELECT year, net_profit
FROM cdprojekt_financials
WHERE TRIM(UPPER(period_type)) = 'FY'
ORDER BY net_profit ASC
LIMIT 1;

SELECT
    q.year,
    ROUND(q.revenue * 1.0 / y.revenue, 2) AS q3_share_of_year
FROM cdprojekt_financials q
JOIN cdprojekt_financials y
    ON q.year = y.year
WHERE
    TRIM(q.period_type) = 'Q'
    AND q.period = 'Q3'
    AND TRIM(y.period_type) = 'FY';

SELECT
    year,
    net_profit,
    RANK() OVER (ORDER BY net_profit DESC) AS profit_rank
FROM cdprojekt_financials
WHERE TRIM(UPPER(period_type)) = 'FY';

SELECT
    year,
    net_profit,
    CASE
        WHEN net_profit >= 400000 THEN 'VERY GOOD'
        WHEN net_profit >= 200000 THEN 'OK'
        ELSE 'WEAK'
    END AS profit_label
FROM cdprojekt_financials
WHERE TRIM(UPPER(period_type)) = 'FY';

SELECT
    year,
    net_profit,
    net_profit - LAG(net_profit) OVER (ORDER BY year) AS yoy_change
FROM cdprojekt_financials
WHERE TRIM(UPPER(period_type)) = 'FY';
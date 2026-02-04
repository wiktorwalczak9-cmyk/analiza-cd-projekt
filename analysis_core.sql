Financial metrics for visualization.
- Net margin trend
- YoY Growth (%)
- Net Margin vs YoY Growth
- Classification of years

SELECT "year", period_type, period, revenue, net_profit, ROUND(net_profit * 1.0 / revenue, 3) AS net_margin
FROM cdprojekt_financials
WHERE UPPER(TRIM(period_type)) = 'FY';

SELECT
    year,
    ROUND(
        (net_profit - LAG(net_profit) OVER (ORDER BY year))
        * 100.0
        / LAG(net_profit) OVER (ORDER BY year),
        2
    ) AS yoy_growth_pct
FROM cdprojekt_financials
WHERE TRIM(UPPER(period_type)) = 'FY';

WITH metrics AS (
    SELECT
        year,
        ROUND(net_profit * 1.0 / revenue, 3) AS net_margin,
        ROUND(
            (net_profit - LAG(net_profit) OVER (ORDER BY year))
            * 100.0
            / LAG(net_profit) OVER (ORDER BY year),
            2
        ) AS yoy_growth_pct
    FROM cdprojekt_financials
    WHERE TRIM(UPPER(period_type)) = 'FY'
)
SELECT
    year,
    net_margin,
    yoy_growth_pct,
    CASE
        WHEN yoy_growth_pct > 50 AND net_margin > 0.3 THEN 'HIGH GROWTH + HIGH QUALITY'
        WHEN yoy_growth_pct > 50 THEN 'HIGH GROWTH, LOW QUALITY'
        WHEN net_margin > 0.3 THEN 'STABLE, HIGH QUALITY'
        ELSE 'WEAK / NORMAL'
    END AS performance_profile
FROM metrics
ORDER BY year;












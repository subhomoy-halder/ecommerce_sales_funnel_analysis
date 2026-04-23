USE sales_funnel_analysis;
GO

-- SELECT * FROM users_events_cleaned

WITH funnel_times AS (
    SELECT
        user_id,
        MIN(CASE WHEN event_type = 'page_view' THEN event_date END) AS view_time,
        MIN(CASE WHEN event_type = 'add_to_cart' THEN event_date END) AS cart_time,
        MIN(CASE WHEN event_type = 'purchase' THEN event_date END) AS purchase_time
    FROM users_events_cleaned
    WHERE event_type IN ('page_view', 'add_to_cart', 'purchase')
    GROUP BY user_id
    HAVING MIN(CASE WHEN event_type = 'purchase' THEN event_date END) IS NOT NULL
), journey_times AS (
    SELECT
        COUNT(*) AS converted_customers,
        CAST(AVG(DATEDIFF(MINUTE, view_time, cart_time) * 1.0) AS DECIMAL(7, 2)) AS time_view_to_cart,
        CAST(AVG(DATEDIFF(MINUTE, cart_time, purchase_time) * 1.0) AS DECIMAL(7, 2)) AS time_cart_to_purchase,
        CAST(AVG(DATEDIFF(MINUTE, view_time, purchase_time) * 1.0) AS DECIMAL(7, 2)) AS journey_time
    FROM funnel_times
)
SELECT * FROM journey_times
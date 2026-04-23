USE sales_funnel_analysis;
GO

-- SELECT * FROM users_events_cleaned

WITH sales_funnel_by_traffic_source AS (
    SELECT
        traffic_source,
        COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS count_view,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS count_cart,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS count_purchase
    FROM users_events_cleaned
    GROUP BY traffic_source
), conversion_by_source AS (
    SELECT
        traffic_source,
        count_view,
        count_cart,
        count_purchase,
        CAST(count_cart * 100.0 / count_view AS DECIMAL(5, 2)) AS view_to_cart_conversion,
        CAST(count_purchase * 100.0 / count_cart AS DECIMAL(5, 2)) AS cart_to_purchase_conversion,
        CAST(count_purchase * 100.0 / count_view AS DECIMAL(5, 2)) AS overall_conversion
    FROM sales_funnel_by_traffic_source
)
SELECT * FROM conversion_by_source
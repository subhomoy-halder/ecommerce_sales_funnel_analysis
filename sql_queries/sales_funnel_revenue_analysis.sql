USE sales_funnel_analysis;
GO

-- SELECT * FROM users_events_cleaned

WITH user_stats AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS total_visitors,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS total_buyers,
        SUM(CASE WHEN event_type = 'purchase' THEN amount END) AS total_revenue,
        SUM(CASE WHEN event_type = 'purchase' THEN 1 END) AS total_orders
    FROM users_events_cleaned 
), revenue_metrics AS (
    SELECT
        total_visitors,
        total_buyers,
        total_revenue,
        total_orders,
        CAST(total_orders * 1.0 / total_visitors AS DECIMAL(10, 2)) AS orders_per_visitor,
        CAST(total_revenue * 1.0 / total_visitors AS DECIMAL(10, 2)) AS revenue_per_visitor,
        CAST(total_buyers * 100.0 / total_visitors AS DECIMAL(10, 2)) AS visitor_to_buyer_conversion_rate,
        CAST(total_revenue * 1.0 / total_orders AS DECIMAL(10, 2)) AS average_order_value,
        CAST(total_revenue * 1.0 / total_buyers AS DECIMAL(10, 2)) AS revenue_per_buyer        
    FROM user_stats
)
SELECT * FROM revenue_metrics
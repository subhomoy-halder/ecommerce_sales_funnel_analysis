USE sales_funnel_analysis;
GO

-- SELECT * FROM users_events_cleaned

WITH sales_funnel AS (
    -- Define Sales Funnel and the different stages
    SELECT
        COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) AS stage_1_view,
        COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN user_id END) AS stage_2_cart,
        COUNT(DISTINCT CASE WHEN event_type = 'checkout_start' THEN user_id END) AS stage_3_checkout,
        COUNT(DISTINCT CASE WHEN event_type = 'payment_info' THEN user_id END) AS stage_4_payment,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS stage_5_purchase
    FROM users_events_cleaned
), sales_funnel_conversion_rate AS (
    -- Define sales Funnel Conversion Rates
    SELECT
        CAST(stage_2_cart * 100.0 / stage_1_view AS DECIMAL(5, 2)) AS view_to_cart_rate,
        CAST(stage_3_checkout * 100.0 / stage_2_cart AS DECIMAL(5, 2)) AS cart_to_checkout_rate,
        CAST(stage_4_payment * 100.0 / stage_3_checkout AS DECIMAL(5, 2)) AS checkout_to_payment_rate,
        CAST(stage_5_purchase * 100.0 / stage_4_payment AS DECIMAL(5, 2)) AS payment_to_purchase_rate,
        CAST(stage_5_purchase * 100.0 / stage_1_view AS DECIMAL(5, 2)) AS overall_conversion_rate
    FROM sales_funnel
)
SELECT * FROM sales_funnel_conversion_rate;
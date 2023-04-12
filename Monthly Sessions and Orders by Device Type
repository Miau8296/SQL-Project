USE mavenfuzzyfactory;

SELECT
	YEAR(website_sessions.created_at) AS yr,
     CASE 
		WHEN MONTH(website_sessions.created_at) = 1 THEN 'january'
        WHEN MONTH(website_sessions.created_at) = 2 THEN 'february'
        WHEN MONTH(website_sessions.created_at) = 3 THEN 'march'
		WHEN MONTH(website_sessions.created_at) = 4 THEN 'april'
		WHEN MONTH(website_sessions.created_at) = 5 THEN 'may'
		WHEN MONTH(website_sessions.created_at) = 6 THEN 'june'
		WHEN MONTH(website_sessions.created_at) = 7 THEN 'july'
		WHEN MONTH(website_sessions.created_at) = 8 THEN 'august'
		WHEN MONTH(website_sessions.created_at) = 9 THEN 'september'
		WHEN MONTH(website_sessions.created_at) = 10 THEN 'october'
		WHEN MONTH(website_sessions.created_at) = 11 THEN 'november'
		WHEN MONTH(website_sessions.created_at) = 12 THEN 'december'
	END AS month_name,
	COUNT(DISTINCT CASE WHEN device_type = 'desktop' THEN website_sessions.website_session_id ELSE NULL END) AS desktop_sessions,
	COUNT(DISTINCT CASE WHEN device_type = 'desktop' THEN orders.order_id ELSE NULL END) AS desktop_orders,
    COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN website_sessions.website_session_id ELSE NULL END) AS mobile_sessions,
    COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN orders.order_id ELSE NULL END) AS mobile_orders,
	COUNT(DISTINCT CASE WHEN device_type = 'desktop' THEN orders.order_id ELSE NULL END)/COUNT(DISTINCT CASE WHEN device_type = 'desktop' THEN website_sessions.website_session_id ELSE NULL END) AS desktop_rate,
	COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN orders.order_id ELSE NULL END)/COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN website_sessions.website_session_id ELSE NULL END) AS mobile_rate
FROM website_sessions
	LEFT JOIN orders
		ON orders.website_session_id = website_sessions.website_session_id
WHERE website_sessions.created_at < '2012-11-27'
	AND website_sessions.utm_source = 'gsearch'
    AND website_sessions.utm_campaign = 'nonbrand'
GROUP BY 1,2;

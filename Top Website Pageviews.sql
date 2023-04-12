USE mavenfuzzyfactory;

SELECT 
	pageview_url,
    COUNT(DISTINCT website_pageview_id) AS page_views
FROM website_pageviews
WHERE created_at < '2012-06-09'
GROUP BY 
	pageview_url
ORDER BY page_views DESC;

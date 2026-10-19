SELECT COUNT(*) FROM train;
SELECT * 
FROM train
LIMIT 5;

SELECT COUNT(*) FROM store;
SELECT *
FROM store
LIMIT 5;

select sum(sales) as total_sales,avg(customers) as avg_customers from train
group by store
order by total_sales desc
limit 10;

select corr(total_sales,avg_customers)
from(
select sum(sales)as total_sales,avg(customers)as avg_customers from train
group by store
)as store_summary;

select promo,avg(sales) as avg_sales from train
group by promo;
select 
avg(case when promo=1 then sales end) as promo_sales,
avg(case when promo=0 then sales end)as non_promo_sales,
(
(
avg(case when promo=1 then sales end)
-avg(case when promo=0 then sales end)
)
/avg(case when promo=0 then sales end)
) * 100 as percentage_difference 
from train;

select promo,avg(customers) as avg_customers from train
group by promo;

select s.store,s.competitionDistance,avg(t.sales) as avg_sales from train t
join store s on t.store=s.store
group by s.store,s.competitionDistance
order by avg_sales desc;

WITH store_sales AS (
    SELECT
        s.Store,
        s.CompetitionDistance,
        AVG(t.Sales) AS avg_sales
    FROM train t
    JOIN store s
        ON t.Store = s.Store
    GROUP BY s.Store, s.CompetitionDistance
)

SELECT
    CASE
        WHEN CompetitionDistance < 1000 THEN 'Very Close'
        WHEN CompetitionDistance < 5000 THEN 'Moderate'
        WHEN CompetitionDistance < 10000 THEN 'Far'
        ELSE 'Very Far'
    END AS competition_group,
    AVG(avg_sales) AS average_store_sales
FROM store_sales
GROUP BY
    CASE
        WHEN CompetitionDistance < 1000 THEN 'Very Close'
        WHEN CompetitionDistance < 5000 THEN 'Moderate'
        WHEN CompetitionDistance < 10000 THEN 'Far'
        ELSE 'Very Far'
    END
ORDER BY average_store_sales DESC;

select s.StoreType,avg(t.sales)as avg_sales from train t
join store s on t.store=s.store
group by s.StoreType
order by avg_sales desc;

select s.Assortment,avg(t.sales) as avg_sales from train t
join store s on t.store=s.store
group by s.Assortment 
order by avg_sales desc;



WITH store_performance AS (
SELECT t.Store,AVG(t.Sales) AS avg_sales FROM train t
GROUP BY t.Store
)
SELECT Store,avg_sales,RANK() OVER (ORDER BY avg_sales DESC) AS sales_rank
FROM store_performance
ORDER BY sales_rank;

WITH store_performance AS (
SELECT Store,AVG(Sales) AS avg_sales FROM train
GROUP BY Store
),
ranked_stores AS (
SELECT Store,avg_sales,NTILE(10) OVER (ORDER BY avg_sales DESC) AS performance_group
FROM store_performance
)
SELECT
    performance_group,
    COUNT(*) AS number_of_stores,
    ROUND(AVG(avg_sales), 2) AS average_sales
FROM ranked_stores
GROUP BY performance_group
ORDER BY performance_group;


WITH store_performance AS (
    SELECT
        Store,
        AVG(Sales) AS avg_sales,
        AVG(Customers) AS avg_customers
    FROM train
    GROUP BY Store
),
ranked_stores AS (
    SELECT
        *,
        NTILE(10) OVER (ORDER BY avg_sales DESC) AS performance_group
    FROM store_performance
)
SELECT
    CASE
        WHEN performance_group = 1 THEN 'Top 10%'
        WHEN performance_group = 10 THEN 'Bottom 10%'
    END AS performance,
    COUNT(*) AS stores,
    ROUND(AVG(avg_sales), 2) AS avg_sales,
    ROUND(AVG(avg_customers), 2) AS avg_customers,
    ROUND(AVG(s.CompetitionDistance), 2) AS avg_competition_distance
FROM ranked_stores r
JOIN store s
    ON r.Store = s.Store
WHERE performance_group IN (1, 10)
GROUP BY performance_group
ORDER BY performance_group;

WITH store_sales AS (
    SELECT
        s.Store,
        s.CompetitionDistance,
        AVG(t.Sales) AS avg_sales
    FROM train t
    JOIN store s
        ON t.Store = s.Store
    GROUP BY s.Store, s.CompetitionDistance
)
SELECT
    CASE
        WHEN CompetitionDistance < 1000 THEN 'Very Close'
        WHEN CompetitionDistance < 5000 THEN 'Moderate'
        WHEN CompetitionDistance < 10000 THEN 'Far'
        ELSE 'Very Far'
    END AS competition_group,
    ROUND(AVG(avg_sales), 2) AS average_store_sales
FROM store_sales
WHERE CompetitionDistance IS NOT NULL
GROUP BY
    CASE
        WHEN CompetitionDistance < 1000 THEN 'Very Close'
        WHEN CompetitionDistance < 5000 THEN 'Moderate'
        WHEN CompetitionDistance < 10000 THEN 'Far'
        ELSE 'Very Far'
    END
ORDER BY average_store_sales DESC;
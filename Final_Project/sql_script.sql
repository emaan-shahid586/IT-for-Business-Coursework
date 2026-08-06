-- SECTION 1 CREATE MAIN TABLES
-- Create and use database
CREATE DATABASE superstore_db;
USE superstore_db;

-- 1.1 Products Table creation
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT
);

-- 1.2 Customers Table creation
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50)
);

-- 1.3 Geography Table creation
CREATE TABLE geography (
    state VARCHAR(50),
    postal_code VARCHAR(20) PRIMARY KEY,
    region VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- 1.4 Shipping Table creation
CREATE TABLE shipping (
    ship_mode VARCHAR(50) PRIMARY KEY
);

-- 1.5 Date Table creation
CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    year INT,
    month VARCHAR(20),
    month_num INT,
    quarter VARCHAR(10),
    week_day VARCHAR(20)
);

-- 1.6 Orders table creation
CREATE TABLE Orders (
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    postal_code VARCHAR(20),
    product_id VARCHAR(50),
    sales DECIMAL(10,4),
    quantity INT,
    discount DECIMAL(5,4),
    profit DECIMAL(30,20),
    profit_ratio DECIMAL(30,20),
    discount_band VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (postal_code) REFERENCES geography(postal_code),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (ship_mode) REFERENCES shipping(ship_mode),
    FOREIGN KEY (order_date) REFERENCES dim_date(date_id)
);



-- SECTION 2 IMPORT DATA FROM POWER QUERY CSV
-- used MySQL Workbench's Import Wizard
-- use CSV Files sent (theres an extra column that shows when importing shipping table, unselect that)

-- SECTION 3 CREATE SAMPLE TABLES (our own analysis tables)

-- set monthly targets for each region
CREATE TABLE monthly_targets (
    target_id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(20) NOT NULL,
    target_month DATE NOT NULL,
    sales_target DECIMAL(10,2) NOT NULL
);

-- insert data
INSERT INTO monthly_targets (region, target_month, sales_target) VALUES
    ('Central', '2014-01-01', 3500.00),
    ('Central', '2014-02-01', 5000.00),
    ('Central', '2014-03-01', 2700.00),
    ('Central', '2014-04-01', 4200.00),
    ('Central', '2014-05-01', 5500.00),
    ('Central', '2014-06-01', 4500.00),
    ('Central', '2014-07-01', 5000.00),
    ('Central', '2014-08-01', 2100.00),
    ('Central', '2014-09-01', 2000.00),
    ('Central', '2014-10-01', 1500.00),
    ('Central', '2014-11-01', 3000.00),
    ('Central', '2014-12-01', 4500.00),
    ('Central', '2015-01-01', 5000.00),
    ('Central', '2015-02-01', 6000.00),
    ('Central', '2015-03-01', 3200.00),
    ('Central', '2015-04-01', 3800.00),
    ('Central', '2015-05-01', 5500.00),
    ('Central', '2015-06-01', 6000.00),
    ('Central', '2015-07-01', 5000.00),
    ('Central', '2015-08-01', 5500.00),
    ('Central', '2015-09-01', 2300.00),
    ('Central', '2015-10-01', 4500.00),
    ('Central', '2015-11-01', 5500.00),
    ('Central', '2015-12-01', 6000.00),
    ('Central', '2016-01-01', 5000.00),
    ('Central', '2016-02-01', 5500.00),
    ('Central', '2016-03-01', 6000.00),
    ('Central', '2016-04-01', 3500.00),
    ('Central', '2016-05-01', 5560.00),
    ('Central', '2016-06-01', 6000.00),
    ('Central', '2016-07-01', 5040.00),
    ('Central', '2016-08-01', 5500.00),
    ('Central', '2016-09-01', 6000.00),
    ('Central', '2016-10-01', 4300.00),
    ('Central', '2016-11-01', 6000.00),
    ('Central', '2016-12-01', 2100.00),
    ('Central', '2017-01-01', 2000.00),
    ('Central', '2017-02-01', 3200.00),
    ('Central', '2017-03-01', 5000.00),
    ('Central', '2017-04-01', 5000.00),
    ('Central', '2017-05-01', 5500.00),
    ('Central', '2017-06-01', 6000.00),
    ('Central', '2017-07-01', 4500.00),
    ('Central', '2017-08-01', 5500.00),
    ('Central', '2017-09-01', 6000.00),
    ('Central', '2017-10-01', 5000.00),
    ('Central', '2017-11-01', 5500.00),
    ('Central', '2017-12-01', 6000.00),
    ('East', '2014-01-01', 4500.00),
    ('East', '2014-02-01', 7500.00),
    ('East', '2014-03-01', 8000.00),
    ('East', '2014-04-01', 7000.00),
    ('East', '2014-05-01', 7500.00),
    ('East', '2014-06-01', 8000.00),
	('East', '2014-07-01', 5600.00),
    ('East', '2014-08-01', 7500.00),
    ('East', '2014-09-01', 2300.00),
    ('East', '2014-10-01', 4300.00),
    ('East', '2014-11-01', 7500.00),
    ('East', '2014-12-01', 3200.00),
    ('East', '2015-01-01', 7000.00),
    ('East', '2015-02-01', 7500.00),
    ('East', '2015-03-01', 4500.00),
    ('East', '2015-04-01', 7000.00),
    ('East', '2015-05-01', 7500.00),
    ('East', '2015-06-01', 2000.00),
	('East', '2015-07-01', 3700.00),
    ('East', '2015-08-01', 7500.00),
    ('East', '2015-09-01', 8000.00),
    ('East', '2015-10-01', 3400.00),
    ('East', '2015-11-01', 7500.00),
    ('East', '2015-12-01', 8000.00),
    ('East', '2016-01-01', 7000.00),
    ('East', '2016-02-01', 4500.00),
    ('East', '2016-03-01', 8000.00),
    ('East', '2016-04-01', 7000.00),
    ('East', '2016-05-01', 7500.00),
    ('East', '2016-06-01', 8000.00),
	('East', '2016-07-01', 6000.00),
    ('East', '2016-08-01', 7500.00),
    ('East', '2016-09-01', 8000.00),
    ('East', '2016-10-01', 7000.00),
    ('East', '2016-11-01', 6000.00),
    ('East', '2016-12-01', 8000.00),
    ('East', '2017-01-01', 7000.00),
    ('East', '2017-02-01', 3400.00),
    ('East', '2017-03-01', 8000.00),
    ('East', '2017-04-01', 7000.00),
    ('East', '2017-05-01', 7500.00),
    ('East', '2017-06-01', 5600.00),
	('East', '2017-07-01', 7000.00),
    ('East', '2017-08-01', 7500.00),
    ('East', '2017-09-01', 8000.00),
    ('East', '2017-10-01', 6500.00),
    ('East', '2017-11-01', 7500.00),
    ('East', '2017-12-01', 8000.00),
    ('West', '2014-01-01', 6500.00),
    ('West', '2014-02-01', 7000.00),
    ('West', '2014-03-01', 6000.00),
    ('West', '2014-04-01', 6500.00),
    ('West', '2014-05-01', 7000.00),
    ('West', '2014-06-01', 4300.00),
    ('West', '2014-07-01', 6500.00),
    ('West', '2014-08-01', 7000.00),
    ('West', '2014-09-01', 7500.00),
    ('West', '2014-10-01', 2300.00),
    ('West', '2014-11-01', 7000.00),
    ('West', '2014-12-01', 2000.00),
    ('West', '2015-01-01', 6500.00),
    ('West', '2015-02-01', 7000.00),
    ('West', '2015-03-01', 7500.00),
    ('West', '2015-04-01', 5600.00),
    ('West', '2015-05-01', 7000.00),
    ('West', '2015-06-01', 7500.00),
    ('West', '2015-07-01', 6500.00),
    ('West', '2015-08-01', 6700.00),
    ('West', '2015-09-01', 7500.00),
    ('West', '2015-10-01', 6500.00),
    ('West', '2015-11-01', 7000.00),
    ('West', '2015-12-01', 7500.00),
    ('West', '2016-01-01', 6700.00),
    ('West', '2016-02-01', 7000.00),
    ('West', '2016-03-01', 7500.00),
    ('West', '2016-04-01', 6500.00),
    ('West', '2016-05-01', 7400.00),
    ('West', '2016-06-01', 7500.00),
    ('West', '2016-07-01', 6500.00),
    ('West', '2016-08-01', 7000.00),
    ('West', '2016-09-01', 7500.00),
    ('West', '2016-10-01', 2300.00),
    ('West', '2016-11-01', 7000.00),
    ('West', '2016-12-01', 7500.00),
    ('West', '2017-01-01', 6500.00),
    ('West', '2017-02-01', 4500.00),
    ('West', '2017-03-01', 7500.00),
    ('West', '2017-04-01', 6500.00),
    ('West', '2017-05-01', 7000.00),
    ('West', '2017-06-01', 7500.00),
    ('West', '2017-07-01', 2300.00),
    ('West', '2017-08-01', 7000.00),
    ('West', '2017-09-01', 7500.00),
    ('West', '2017-10-01', 6500.00),
    ('West', '2017-11-01', 7000.00),
    ('West', '2017-12-01', 3800.00),
    ('South', '2014-01-01', 4000.00),
    ('South', '2014-02-01', 4500.00),
    ('South', '2014-03-01', 5000.00),
    ('South', '2014-04-01', 4000.00),
    ('South', '2014-05-01', 4900.00),
    ('South', '2014-06-01', 5000.00),
    ('South', '2014-07-01', 4000.00),
    ('South', '2014-08-01', 4500.00),
    ('South', '2014-09-01', 5700.00),
    ('South', '2014-10-01', 4000.00),
    ('South', '2014-11-01', 4500.00),
    ('South', '2014-12-01', 5000.00),
    ('South', '2015-01-01', 4000.00),
    ('South', '2015-02-01', 2800.00),
    ('South', '2015-03-01', 5000.00),
    ('South', '2015-04-01', 4500.00),
    ('South', '2015-05-01', 4500.00),
    ('South', '2015-06-01', 5000.00),
    ('South', '2015-07-01', 4000.00),
    ('South', '2015-08-01', 2300.00),
    ('South', '2015-09-01', 5000.00),
    ('South', '2015-10-01', 4000.00),
    ('South', '2015-11-01', 4500.00),
    ('South', '2015-12-01', 5000.00),
    ('South', '2016-01-01', 1200.00),
    ('South', '2016-02-01', 4500.00),
    ('South', '2016-03-01', 5000.00),
    ('South', '2016-04-01', 4000.00),
    ('South', '2016-05-01', 4500.00),
    ('South', '2016-06-01', 4900.00),
    ('South', '2016-07-01', 4000.00),
    ('South', '2016-08-01', 4500.00),
    ('South', '2016-09-01', 5000.00),
    ('South', '2016-10-01', 2700.00),
    ('South', '2016-11-01', 4500.00),
    ('South', '2016-12-01', 5000.00),
    ('South', '2017-01-01', 3400.00),
    ('South', '2017-02-01', 4500.00),
    ('South', '2017-03-01', 5000.00),
    ('South', '2017-04-01', 4000.00),
    ('South', '2017-05-01', 2300.00),
    ('South', '2017-06-01', 5000.00),
    ('South', '2017-07-01', 4000.00),
    ('South', '2017-08-01', 4500.00),
    ('South', '2017-09-01', 5000.00),
    ('South', '2017-10-01', 3400.00),
    ('South', '2017-11-01', 4500.00),
    ('South', '2017-12-01', 5000.00);
    
    
-- SECTION 4 demonstrating use of SQL queries to analyse business data
-- monthly targets
SELECT * FROM monthly_targets;

-- Compare monthly targets with actual sales
SELECT 
    t.region,
    t.target_month,
    t.sales_target AS monthly_target,
    ROUND(SUM(f.sales), 2) AS total_actual_sales,
    CASE 
        WHEN ROUND(SUM(f.sales), 2) >= t.sales_target THEN 'Above Target'
        ELSE 'Below Target'
    END AS performance_status
FROM monthly_targets t
LEFT JOIN geography g 
    ON t.region = g.region
LEFT JOIN orders f 
    ON g.postal_code = f.postal_code
    AND MONTH(f.order_date) = MONTH(t.target_month)
    AND YEAR(f.order_date) = YEAR(t.target_month)
GROUP BY 
    t.region, 
    t.target_month, 
    t.sales_target
ORDER BY 
    t.region, 
    t.target_month;


-- analysing Customer segment performance 
SELECT 
    c.segment,
    ROUND(SUM(f.sales), 2) AS total_sales,
    ROUND(SUM(f.profit), 2) AS total_profit,
    COUNT(DISTINCT c.customer_id) AS number_of_customers,
    COUNT(DISTINCT f.order_id) AS total_orders,
    ROUND(SUM(f.profit) / NULLIF(SUM(f.sales), 0) * 100, 2) AS profit_margin_pct,
    ROUND(SUM(f.sales) / COUNT(DISTINCT c.customer_id), 2) AS avg_sales_per_customer
FROM orders f
JOIN customers c ON f.customer_id = c.customer_id
GROUP BY c.segment
ORDER BY total_profit DESC;

-- Shipping mode analysis
SELECT 
    ship_mode,
    COUNT(DISTINCT order_id) AS number_of_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit), 2) AS avg_profit_per_order,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin_pct,
    ROUND(AVG(DATEDIFF(ship_date, order_date)), 1) AS avg_shipping_days
FROM orders
GROUP BY ship_mode
ORDER BY total_profit DESC;

-- Bottom 10 products by profit 
SELECT 
    p.category,
    p.sub_category,
    p.product_name,
    ROUND(SUM(f.sales), 2) AS total_sales,
    ROUND(SUM(f.profit), 2) AS total_profit,
    COUNT(f.order_id) AS times_ordered,
    ROUND(AVG(f.discount) * 100, 2) AS avg_discount_pct,
    CASE 
        WHEN SUM(f.profit) < 0 THEN 'LOSS MAKER'
        WHEN SUM(f.profit) < 100 THEN 'Low Profit'
        ELSE 'Needs Review'
    END AS performance_status
FROM orders f
JOIN products p ON f.product_id = p.product_id
GROUP BY p.category, p.sub_category, p.product_name
HAVING total_profit < 500  -- Products making less than $500 profit
ORDER BY total_profit ASC
LIMIT 10;


-- Overall performance
SELECT 
    YEAR(order_date) AS year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY YEAR(order_date)
ORDER BY year;

-- Top products by profit 
SELECT 
    p.category,
    p.sub_category,
    ROUND(SUM(f.profit), 2) AS total_profit
FROM orders f
JOIN products p ON f.product_id = p.product_id
GROUP BY p.category, p.sub_category
ORDER BY total_profit DESC
LIMIT 10;

--  Regional performance 
-- Best for: Executive dashboard, quick performance check
SELECT 
    g.region,
    ROUND(SUM(f.sales), 2) AS sales,
    ROUND(SUM(f.profit), 2) AS profit
FROM orders f
JOIN geography g ON f.postal_code = g.postal_code
GROUP BY g.region
ORDER BY sales DESC;

-- Sales and profit by state 
-- Best for: Identifying specific problem states, targeted marketing
SELECT 
    g.state,
    g.region,
    ROUND(SUM(f.sales), 2) AS total_sales,
    ROUND(SUM(f.profit), 2) AS total_profit,
    COUNT(DISTINCT f.order_id) AS number_of_orders,
    ROUND(SUM(f.profit) / NULLIF(SUM(f.sales), 0) * 100, 2) AS profit_margin_pct,
    ROUND(AVG(f.sales), 2) AS avg_order_value
FROM orders f
JOIN geography g ON f.postal_code = g.postal_code
GROUP BY g.state, g.region
ORDER BY total_sales DESC;

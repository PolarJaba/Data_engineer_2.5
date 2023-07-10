SELECT sn.shop_name, pr.product_name,
CASE
    WHEN sn.shop_name = 'DNS' THEN (SELECT SUM(sales_cnt) FROM shop_dns AS sd WHERE sd.product_id = pl.product_id AND (sd.date BETWEEN '2023-06-01' AND '2023-06-30'))
    WHEN sn.shop_name = 'MVideo' THEN (SELECT SUM(sales_cnt) FROM shop_mvideo AS sm WHERE sm.product_id = pl.product_id AND (sm.date BETWEEN '2023-06-01' AND '2023-06-30'))
    WHEN sn.shop_name = 'Sitilink' THEN (SELECT SUM(sales_cnt) FROM shop_sitilink AS ss WHERE ss.product_id = pl.product_id AND (ss.date BETWEEN '2023-06-01' AND '2023-06-30'))
END AS sales_fact,        
pl.plan_cnt AS sales_plan, 
CASE
    WHEN sn.shop_name = 'DNS' THEN (SELECT CAST(SUM(sales_cnt) AS FLOAT)/pl.plan_cnt FROM shop_dns AS sd WHERE sd.product_id = pl.product_id AND (sd.date BETWEEN '2023-06-01' AND '2023-06-30'))
    WHEN sn.shop_name = 'MVideo' THEN (SELECT CAST(SUM(sales_cnt) AS FLOAT)/pl.plan_cnt FROM shop_mvideo AS sm WHERE sm.product_id = pl.product_id AND (sm.date BETWEEN '2023-06-01' AND '2023-06-30'))
    WHEN sn.shop_name = 'Sitilink' THEN (SELECT CAST(SUM(sales_cnt) AS FLOAT)/pl.plan_cnt   FROM shop_sitilink AS ss WHERE ss.product_id = pl.product_id AND (ss.date BETWEEN '2023-06-01' AND '2023-06-30'))
END AS sales_fact_divide_sales_plan,
CASE 
    WHEN sn.shop_name = 'DNS' THEN (SELECT SUM(sd.sales_cnt)*pr.price FROM shop_dns AS sd WHERE sd.product_id = pl.product_id AND (sd.date BETWEEN '2023-06-01' AND '2023-06-30'))
    WHEN sn.shop_name = 'MVideo' THEN (SELECT SUM(sm.sales_cnt)*pr.price FROM shop_mvideo AS sm WHERE sm.product_id = pl.product_id AND (sm.date BETWEEN '2023-06-01' AND '2023-06-30'))
    WHEN sn.shop_name = 'Sitilink' THEN (SELECT SUM(ss.sales_cnt)*pr.price FROM shop_sitilink AS ss WHERE ss.product_id = pl.product_id AND (ss.date BETWEEN '2023-06-01' AND '2023-06-30'))
END AS income_fact,
pl.plan_cnt*pr.price AS income_plan,
CASE 
    WHEN sn.shop_name = 'DNS' THEN (SELECT SUM(sd.sales_cnt)*pr.price/(pl.plan_cnt*pr.price) FROM shop_dns AS sd WHERE sd.product_id = pl.product_id AND (sd.date BETWEEN '2023-06-01' AND '2023-06-30'))
    WHEN sn.shop_name = 'MVideo' THEN (SELECT SUM(sm.sales_cnt)*pr.price/(pl.plan_cnt*pr.price) FROM shop_mvideo AS sm WHERE sm.product_id = pl.product_id AND (sm.date BETWEEN '2023-06-01' AND '2023-06-30'))
    WHEN sn.shop_name = 'Sitilink' THEN (SELECT SUM(ss.sales_cnt)*pr.price/(pl.plan_cnt*pr.price) FROM shop_sitilink AS ss WHERE ss.product_id = pl.product_id AND (ss.date BETWEEN '2023-06-01' AND '2023-06-30'))
END AS income_fact_divide_income_plan

FROM products AS pr

INNER JOIN plan AS pl ON pl.product_id = pr.product_id
INNER JOIN shop_dns AS sd ON pr.product_id = sd.product_id
INNER JOIN shop_mvideo AS sm ON pr.product_id = sm.product_id
INNER JOIN shop_sitilink AS ss ON pr.product_id = ss.product_id
INNER JOIN shops AS sn ON pl.shop_id = sn.shop_id

GROUP BY sn.shop_name, pr.product_name, sd.product_id, sm.product_id, 
ss.product_id, pl.plan_cnt, pr.price, pl.product_id

ORDER BY shop_name, product_name, sales_fact, sales_plan, sales_fact_divide_sales_plan, income_fact, income_plan, income_fact_divide_income_plan
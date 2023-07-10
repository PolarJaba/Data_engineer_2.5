CREATE TABLE IF NOT EXISTS products (
    product_id serial PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price float NOT NULL
);

CREATE TABLE IF NOT EXISTS plan (
    product_id BIGINT,
    shop_id BIGINT,
    plan_cnt BIGINT,
    plan_date DATE
);

CREATE TABLE IF NOT EXISTS shops (
    shop_id BIGINT,
    shop_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS shop_dns (
    date DATE,
    product_id BIGINT,
    sales_cnt BIGINT
);

CREATE TABLE IF NOT EXISTS shop_mvideo (
    date DATE,
    product_id BIGINT,
    sales_cnt BIGINT
);

CREATE TABLE IF NOT EXISTS shop_sitilink (
    date DATE,
    product_id BIGINT,
    sales_cnt BIGINT
);
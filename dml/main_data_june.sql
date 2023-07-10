INSERT INTO products (product_id, product_name, price)
VALUES (1, 'Испорченный телефон', 100),
        (2, 'Сарафанное радио', 150),
        (3, 'Патефон', 200);

INSERT INTO plan (product_id, shop_id, plan_cnt, plan_date)
VALUES (1, 1, 15, '2023-06-30'),
        (2, 1, 20, '2023-06-30'),
        (3, 1, 16, '2023-06-30'),
        (1, 2, 17, '2023-06-30'),
        (2, 2, 30, '2023-06-30'),
        (3, 2, 15, '2023-06-30'),
        (1, 3, 25, '2023-06-30'),
        (2, 3, 20, '2023-06-30'),
        (3, 3, 30, '2023-06-30');

INSERT INTO shops (shop_id, shop_name)
VALUES (1, 'DNS'),
        (2, 'Sitilink'),
        (3, 'MVideo');

INSERT INTO shop_dns (date, product_id, sales_cnt)
VALUES ('2023-01-12', 1, 2),
        ('2023-02-12', 2, 2),
        ('2023-06-01', 1, 3),
        ('2023-06-12', 2, 4),
        ('2023-06-12', 1, 7),
        ('2023-06-13', 1, 1),
        ('2023-06-20', 2, 2),
        ('2023-06-21', 2, 2),
        ('2023-06-24', 3, 2),
        ('2023-06-22', 3, 5),
        ('2023-06-27', 3, 4);

INSERT INTO shop_mvideo (date, product_id, sales_cnt)
VALUES ('2023-06-01', 3, 2),
        ('2023-02-12', 2, 2),
        ('2023-06-01', 1, 7),
        ('2023-06-12', 2, 8),
        ('2023-06-12', 1, 9),
        ('2023-06-13', 1, 2),
        ('2023-06-20', 2, 3),
        ('2023-06-21', 2, 7),
        ('2023-06-24', 3, 10),
        ('2023-06-22', 3, 11),
        ('2023-06-27', 3, 14);

INSERT INTO shop_sitilink (date, product_id, sales_cnt)
VALUES ('2023-02-12', 1, 2),
        ('2023-04-12', 2, 2),
        ('2023-06-01', 1, 8),
        ('2023-06-12', 2, 2),
        ('2023-06-12', 1, 1),
        ('2023-06-13', 1, 1),
        ('2023-06-20', 2, 12),
        ('2023-06-21', 2, 2),
        ('2023-06-24', 3, 20),
        ('2023-06-22', 3, 5),
        ('2023-06-27', 3, 4);
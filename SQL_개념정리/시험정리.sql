CREATE TABLE members (
    member_id NUMBER(4) PRIMARY KEY,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(50) NOT NULL,
    email VARCHAR2(100),
    created_at DATE DEFAULT SYSDATE
);
members_seq 시퀀스 생성
CREATE SEQUENCE members_seq;



INSERT INTO members VALUES (members_seq.NEXTVAL, 'semo', 'semo1234', 'semo@kh.kh', TO_DATE('HH24:MI:SS'));
INSERT INTO members VALUES (members_seq.NEXTVAL, 'semo', 'semo1234', 'semo@kh.kh', null);
INSERT INTO members(member_id, username, password, email) VALUES (members_seq.NEXTVAL, 'nemo', 'nemo9876', 'nemo@kh.kh');
INSERT INTO members(member_id, username, password, email) VALUES (members_seq.NEXTVAL, 'momo', 'momo5678', 'momo@kh.kh');
INSERT INTO members(member_id, username, password, email) VALUES (members_seq.NEXTVAL, 'test_user', 'test_password', 'test_user@example.com');

UPDATE members SET email = 'nemo@kh.kh' WHERE email = 'nemo@kh.com';
UPDATE members SET email = 'updated_user@example.com' WHERE username='test_user' ;
UPDATE members SET password = 'new_password' WHERE username='test_user';
UPDATE members SET created_at = SYSDATE WHERE username='test_user';



ALTER DROP created_at FROM members where created_at > '2023-01-01';
ALTER DROP * FROM members where email = 'updated_user@example.com'; 
DELETE members where create_at > '2023-01-01';

SELECT * FROM members;
SELECT email FROM members;
SELECT username FROM members;









ROLLBACK;



INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, '강숙', 'kim1234', 'kimseok@example.com', SYSDATE);



INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, '이민숙', 'lee9876', 'leemin@example.com', SYSDATE);



INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, '박진수', 'park5678', 'parkjin@example.com', SYSDATE);



INSERT INTO members (member_id, username, password, email, created_at)
VALUES (members_seq.NEXTVAL, '최우석', 'choi1234', 'choisoo@example.com', SYSDATE);


CREATE TABLE products (
    product_id NUMBER(4) PRIMARY KEY,
    product_name VARCHAR2(50) NOT NULL,
    price NUMBER(30),
    stock NUMBER(30)
);
CREATE SEQUENCE products_seq;

INSERT INTO products (product_id, product_name, price, stock)
VALUES (products_seq.NEXTVAL, '삼성 TV', 1000000, 10);



INSERT INTO products (product_id, product_name, price, stock)

VALUES (products_seq.NEXTVAL, 'LG 냉장고', 800000, 5);



INSERT INTO products (product_id, product_name, price, stock)

VALUES (products_seq.NEXTVAL, '다이슨 청소기', 500000, 20);



INSERT INTO products (product_id, product_name, price, stock)

VALUES (products_seq.NEXTVAL, '애플 아이폰', 1200000, 15);



INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)

VALUES (orders_seq.NEXTVAL, 1, 1, 1, SYSDATE);



CREATE TABLE orders (
    order_id NUMBER(4) PRIMARY KEY,
    member_id number(4) NOT NULL,
    product_id NUMBER(4),
    quantity NUMBER(30),
    order_date DATE DEFAULT SYSDATE
);
CREATE SEQUENCE orders_seq;


INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)

VALUES (orders_seq.NEXTVAL, 1, 2, 1, SYSDATE);



INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)

VALUES (orders_seq.NEXTVAL, 2, 3, 2, SYSDATE);



INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)

VALUES (orders_seq.NEXTVAL, 3, 4, 1, SYSDATE);



INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)

VALUES (orders_seq.NEXTVAL, 4, 1, 1, SYSDATE);



INSERT INTO orders (order_id, member_id, product_id, quantity, order_date)

VALUES (orders_seq.NEXTVAL, 4, 2, 1, SYSDATE);



--1
SELECT COUNT(product_id) 
FROM products;

SELECT product_name, price, order_date
FROM (SELECT * FROM members WHERE username='강숙')
JOIN orders ON (product_id = product_id);

SELECT SUM(price)
FROM products
WHERE (SELECT username FROM members WHERE username='이만숙');


-- 2

SELECT PRODUCT_NAME, PRICE
FROM products
ORDER BY price desc;

SELECT username,email,created_at
FROM members
WHERE (SELECT * FROM orders WHERE product_name='삼성 TV');

SELECT SUM(price) AS "총금액"
GROUP BY(SELECT * FROM orders WHERE order_date=TO_DATE();
FROM products;


-- 3 
SELECT *
FROM orders
WHERE order_date BETWEEN TO_DATE('23/06/01','YY/MM/DD') AND TO_DATE('23/06/30','YY/MM/DD');

SELECT * 
FROM orders
WHERE product_id > 2;

SELECT MAX(order_date), MIN(order_date)
FROM orders;


-- 4
SELECT AVG(QUANTITY), member_id
FROM orders
GROUP BY MEMBER_ID;

SELECT product_name, stock
FROM products
WHERE stock <= 10;

SELECT product_name, price, stock, quantity
FROM products
JOIN orders ON (product_id=product_id)
WHERE order_date= TO_DATE('23/07/01','YY/MM/DD');










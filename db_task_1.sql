1. 作業編號：#85

2. 大家好，我是個想來體驗看看 pg-sql, docker 的女紙

3. 觀看影片加作業大約1.5個小時

4. 體驗看看

5. 要準備到怎麼樣狀態或條件才好拿到 junior 全端或後端工程師的面試機會?

6. 作業：

-- Q1: 北歐風雙人沙發多少錢; 找到這張沙發的價格和庫存
SELECT name, price, stock
FROM products
WHERE name = '北歐風雙人沙發';

-- Q2: 找出櫃子類且價格在 5000 以下的商品
SELECT *
FROM products
WHERE category = '櫃子' AND price < 5000;

-- Q3: 確認日式雙人床架的庫存狀況
SELECT name, stock
FROM products
WHERE name = '日式雙人床架';

-- Q4: 找 4 萬以下，而且有現貨的沙發; 要同時符合：是沙發、4萬以下、有庫存
SELECT *
FROM products
WHERE price < 40000 AND category = '沙發' AND stock > 0;

-- Q5: 沙發有哪些特價且現貨的品項？ 要找到沙發類且有特價（原價大於優惠價）且還有庫存的商品
SELECT *
FROM products
WHERE category = '沙發' AND price > discount_price AND stock > 0;

-- Q6: 我要找櫃子或桌子; 找出櫃子類或桌子類的商品
SELECT *
FROM products
WHERE category IN ('櫃子', '桌子');

-- Q7: 北歐風雙人沙發和貓抓皮L型沙發哪個還有貨？ 找出這兩張特定沙發的庫存狀況
SELECT name, stock
FROM products
WHERE name IN ('北歐風雙人沙發', '貓抓皮L型沙發');

-- Q8: 客廳的家具有哪些？我要看沙發、櫃子跟桌子; 找出沙發、櫃子和桌子這三種分類的商品
SELECT *
FROM products
WHERE category IN ('沙發', '櫃子', '桌子');

-- Q9: 電腦辦公椅和餐椅四入組的價格是多少？ 
SELECT name, price
FROM products
WHERE name IN ('電腦辦公椅', '餐椅四入組');

-- Q10: 找 10000 到 20000 之間的商品有哪些？
SELECT *
FROM products
WHERE price BETWEEN 10000 AND 20000;

-- Q11: 列出庫存在 5 到 15 之間的商品
SELECT *
FROM products
WHERE stock BETWEEN 5 AND 15;

-- Q12: 列出除了沙發和床架以外的商品
SELECT *
FROM products
WHERE category NOT IN ('沙發', '床架');

-- Q13: 北歐風雙人沙發要調降 2000 元
UPDATE products
SET price = price - 2000
WHERE name = '北歐風雙人沙發';

-- Q14: 電腦辦公椅進了 5 張; 增加庫存數量
UPDATE products 
SET stock = stock + 5 
WHERE name = '電腦辦公椅';

-- Q15: 清掉兒童床架和電競書桌的資料
DELETE FROM products 
WHERE name IN ('兒童床架', '電競書桌');

7. #84 問題
UPDATE products
SET price * 0.9
WHERE stock > 20;

我出的題目：
將庫存為零的商品各補貨6個，並將其原價調整為原來的110%
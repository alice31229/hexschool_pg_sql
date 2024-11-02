-- 作業一：拯救明華國小的資料庫，哪個欄位適合變成外來鍵？
CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO classes (name) VALUES 
    ('三年一班'),
    ('三年二班');

CREATE Table students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    class_id INTEGER,
    gender VARCHAR(50),
    age INTEGER,
    FOREIGN KEY (class_id) REFERENCES classes(id)
);

INSERT INTO students (name, classes_id, gender, age) VALUES
    ('小明', 1, '男', 8),
    ('小華', 2, '女', 9),
    ('小美', 1, '男', 8),
    ('小強', 1, '女', 8),
    ('小智', 2, '男', 9);

SELECT s.id AS 學生編號, s.name AS 姓名, c.name AS 班級, s.gender AS 性別, s.age AS 年齡
FROM students AS s
INNER JOIN classes AS c ON s.class_id = c.id

-- 作業二：第一題的延伸，多了一個班級老師
CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO teachers (name) VALUES 
    ('廖洧杰'),
    ('卡斯伯'),
    ('查理'),
    ('麥可'),
    ('李燕容');

CREATE Table students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    class_id INTEGER,
    teacher_id INTEGER,
    gender VARCHAR(50),
    age INTEGER,
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

INSERT INTO students (name, classes_id, teacher_id, gender, age) VALUES
    ('小明', 1, 1, '男', 8),
    ('小華', 2, 2, '女', 9),
    ('小美', 1, 3, '男', 8),
    ('小強', 1, 4, '女', 8),
    ('小智', 2, 5, '男', 9);

SELECT s.id AS 學生編號, s.name AS 姓名, c.name AS 班級, t.name AS 班級老師, s.gender AS 性別, s.age AS 年齡
FROM students AS s
INNER JOIN classes AS c ON s.class_id = c.id
INNER JOIN teachers AS t ON s.teacher_id = t.id;

-- 作業三：小孩的家庭歸類資料庫，父母資料一直重複實在討厭！
CREATE TABLE parents (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    phone_number VARCHAR(50),
    gender VARCHAR(50)
);

INSERT INTO parents (name, phone_number, gender) VALUES 
    ('王大祥', '0973254254', '男'),
    ('王曉如', '0955717855', '女');

CREATE Table students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    class_id INTEGER,
    teacher_id INTEGER,
    parent_id INTEGER,
    gender VARCHAR(50),
    age INTEGER,
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id),
    FOREIGN KEY (parent_id) REFERENCES parents(id)
);

INSERT INTO students (name, classes_id, teacher_id, parent_id, gender, age) VALUES
    ('小明', 1, 1, 1, '男', 8),
    ('小華', 2, 2, 2, '女', 9),
    ('小美', 1, 3, 1, '男', 8),
    ('小強', 1, 4, 2, '女', 8),
    ('小智', 2, 5, 1, '男', 9);

SELECT s.id AS 小孩編號, s.name AS 姓名, p.name AS 父母名稱, p.phone_number AS 父母電話, p.gender AS 父母性別
FROM students AS s
INNER JOIN parents AS p ON s.parent_id = p.id;

-- #17 題目回答
/*
使用INNER JOIN顯示出 卡斯伯 與 廖洧杰 兩位老師的學生跟家長資訊
（包含學生姓名，家長姓名，家長電話，老師姓名，老師電話）
p.s 其中老師電話並不在作業設定中 故不查詢
*/
SELECT s.name AS 學生姓名, p.name AS 家長姓名, p.phone_number AS 家長電話, t.name AS 老師姓名
FROM students AS s
INNER JOIN parents AS p ON s.parent_id = p.id
INNER JOIN teachers AS t ON s.teacher_id = t.id
WHERE t.name IN ('廖洧杰', '卡斯伯');
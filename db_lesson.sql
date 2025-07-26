  CREATE TABLE `departments`(
    department_id INT unsigned NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    )
    DESC departments;
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type         | Null | Key | Default           | Extra                                         |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| department_id | int unsigned | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)  | NO   |     | NULL              |                                               |
| created_at    | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
4 rows in set (0.00 sec)

ALTER TABLE people MODIFY COLUMN department_id INT unsigned;

INSERT INTO departments (name) VALUES ('営業');
INSERT INTO departments (name)
VALUES
('開発'),
('経理'),
('人事'),
('情報システム');

-- INSERT INTO people (name, email, age, gender,department_name,department_id)
-- VALUES
-- ('佐藤','satou@gmail.com',32,1,'開発',2),
-- ('鈴木','suzuki@gmail.com',21,2,'経理',3),
-- ('高橋','tajakahi@gmail.com',77,2,'人事',4),
-- ('田中','tagaat@gmail.com',42,1,'営業',1),
-- ('渡部','watanaeu@gmail.com',26,1,'開発',2),
-- ('伊藤','itu777ej@gmail.com',33,2,'営業',1),
-- ('中村','nakmuute@gmail.com',52,1,'開発',2),
-- ('小林','kobanndaisuku@gmail.com',98,1,'情報システム',5),
-- ('山本','yamanbannp@gmail.com',56,2,'営業',1),
-- ('加藤','katouttibi@gmail.com',22,1,'開発',2);

INSERT INTO people (name, email, age, gender)
VALUES
('佐藤','satou@gmail.com',32,1),
('鈴木','suzuki@gmail.com',21,2),
('高橋','tajakahi@gmail.com',77,2),
('田中','tagaat@gmail.com',42,1),
('渡部','watanaeu@gmail.com',26,1),
('伊藤','itu777ej@gmail.com',33,2),
('中村','nakmuute@gmail.com',52,1),
('小林','kobanndaisuku@gmail.com',98,1),
('山本','yamanbannp@gmail.com',56,2),
('加藤','katouttibi@gmail.com',22,1);

INSERT INTO people (id,department)
VALUES
ON DUPLICATE KEY UPDATE
(44,2),
(45,3),
(46,4),
(47,1),
(48,2),
(49,1),
(50,2),
(51,5),
(52,1),
(53,2);

UPDATE people SET department_id = 1 WHERE person_id IN (47, 49, 52);
UPDATE people SET department_id = 2 WHERE person_id IN (44, 48, 50, 53);
UPDATE people SET department_id = 3 WHERE person_id IN (45);
UPDATE people SET department_id = 4 WHERE person_id IN (46);
UPDATE people SET department_id = 5 WHERE person_id IN (51);

INSERT INTO reports(person_id,content)
VALUES
(44,'クライアントとのすり合わせを行った'),
(45,'開発業務を行いました'),
(46,'営業との報告業務を行いすり合わせをしました'),
(47,'修正箇所やバグの粗探しを行いました'),
(48,'新機能を追加をしました'),
(49,'新機能のバグを発見しました'),
(50,'新機能の修正を数箇所行いました'),
(51,'既存機能にバグを発見しました'),
(52,'既存機能にアップデートを入れました'),
(53,'クライアントに報告を行いすべての修正箇所の確認をしました');

ALTER TABLE people DROP COLUMN departments_id

SELECT * FROM people ORDER BY age  gender =1 DESC;
SELECT * FROM people WHERE gender = 1 ORDER BY age DESC;

SELECT
  `name`, `email`, `age`
  TABLE
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;
peopleテーブルからWHEREで選択されているカラムの中からSELECTで選択されているレコードに当てはまるものを作成されたものが今回は言われていないので昇り順になる

SELECT * FROM people WHERE age BETWEEN 20 AND 40;
SELECT * FROM people WHERE gender = 1 ORDER BY age BETWEEN 20 AND 40;
SELECT * FROM people WHERE age >= 20 AND gender = 1;
SELECT * FROM people WHERE age <= 40 AND gender = 2;

 SELECT * FROM people WHERE department_id = 1;

 SELECT AVG(age) AS average_age FROM people GROUP BY department_id = 2;

-- 名前と部署名とその人が提出した日報の内容
 SELECT
  people.name, departments.name AS department, content
 FROM
  people
 INNER JOIN
  departments ON people.department_id = departments.department_id
INNER JOIN
  reports ON people.person_id = reports.person_id;

SELECT person.name
FROM people AS person
INNER JOIN reports AS r ON person.person_id = r.person_id;

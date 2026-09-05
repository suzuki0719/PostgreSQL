drop function if exists f;
drop function if exists p;
drop function if exists hello;
drop function if exists f_複合型;

drop table if exists tbl_hello;
drop table if exists tbl_配列テスト;
drop table if exists tbl_範囲テスト;
drop table if exists tbl_型テスト;
drop table if exists tbl_master;
drop table if exists tbl_type;
drop table if exists tbl_複合型;


drop type if exists type_hello;

drop sequence if exists seq_範囲テスト;
create sequence seq_範囲テスト;

--連番を登録
drop sequence if exists seq_連番テスト;
create sequence seq_連番テスト;

drop sequence if exists seq_hello;
create sequence seq_hello;

drop table if exists f;

drop type if exists type_hello;
create type type_hello as (a text,b text);

drop function if exists double_salary;
drop function if exists new_emp;
drop function if exists new_emp2;


drop table if exists emp;
create table emp(
    name text,
    salary numeric,
    age integer,
    cubicle point
);

INSERT INTO emp VALUES ('Bill', 4200, 45, '(2,1)');

CREATE FUNCTION double_salary(emp) RETURNS numeric AS $$
    SELECT $1.salary * 2 AS salary;
$$ LANGUAGE SQL;

SELECT name, double_salary(emp.*) AS dream
    FROM emp
    WHERE emp.cubicle ~= point '(2,1)';

SELECT name, double_salary(ROW(name, salary*1.1, age, cubicle)) AS dream
    FROM emp;


CREATE FUNCTION new_emp() RETURNS emp AS $$
    SELECT text 'None' AS name,
        1000.0 AS salary,
        25 AS age,
        point '(2,2)' AS cubicle;
$$ LANGUAGE SQL;

CREATE FUNCTION new_emp2() RETURNS emp AS $$
    SELECT ROW('None', 1000.0, 25, '(2,2)')::emp;
$$ LANGUAGE SQL;

--関数に渡すデータを調整
SELECT name, double_salary(ROW(name, salary*1.1, age, cubicle)) AS dream
    FROM emp;

SELECT new_emp();
SELECT * FROM new_emp();

--関数表記を使用して属性を抽出することもできます。
SELECT name(new_emp());


--複合型を結果として返す関数を使用する他の方法は、その結果を、その行型を入力として受け付ける関数に渡す、以下のような方法です。
CREATE FUNCTION getname(emp) RETURNS text AS $$
    SELECT $1.name;
$$ LANGUAGE SQL;

SELECT getname(new_emp());
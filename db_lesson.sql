Q1
create table departments (
-> department_id int unsigned not null auto_increment primary key,
-> name varchar(20) not null,
-> created_at timestamp default current_timestamp,
-> updated_at timestamp default current_timestamp on update current_timestamp
-> );


Q2
alter table people add department_id int unsigned after email;


Q3
insert into departments (name)
-> values
->('営業')
->('開発')
->('経理')
->('人事')
->('情報システム')

insert into people (name,email,department_id,age,gender)
-> values
-> ('菅田まさき','suda@gizmo.jp',1,23,1),
-> ('堀北真希','horikita@gizmo.jp',1,24,2),
-> ('加藤せいしろう','kato@gizmo.jp',1,55,1),
-> ('山村もみじ','yamamura@gizmo.jp',2,48,2),
-> ('佐藤たける','sato@gizmo.jp',2,38,1),
-> ('武井えみ','takei@gizmo.jp',2,28,2),
-> ('綾野ごう','ayano@gizmo.jp',2,46,1),
-> ('吉田さおり','yoshida@gizmo.jp',3,51,2),
-> ('吉沢りょう','yoshizawa@gizmo.jp',4,39,1),
-> ('木村ふみの','kimura@gizmo.jp',5,32,2);

insert into reports (person_id,content)
-> value
-> (7,'ああああああああああ'),
-> (8,'いいいいいいいいいい'),
-> (9,'うううううううううう'),
-> (10,'ええええええええええ'),
-> (11,'おおおおおおおおおお'),
-> (12,'かかかかかかかかかか'),
-> (13,'きききききききききき'),
-> (14,'くくくくくくくくくく'),
-> (15,'けけけけけけけけけけ'),
-> (16,'ここここここここここ');


Q4
update people set department_id = 1 where person_id = 1;
update people set department_id = 2 where person_id = 2;
update people set department_id = 3 where person_id = 3;
update people set department_id = 4 where person_id = 4;
update people set department_id = 5 where person_id = 6;


Q5
select name, age from people where gender = 1 order by age desc;


Q6
peopleテーブル上の所属が営業部である人の
「nameカラム（名前）」
「emailカラム（メールアドレス）」
「ageカラム（年齢）」をレコードが作成された順に取得する。

Q7
select name from people where (gender = 2 and age between 20 and 29) or (gender = 1 and age between 40 and 49);


Q8
select * from people where department_id = 1 order by age;


Q9
select avg(age) as average_age from people where department_id = 2 and gender = 2;


Q10
select people.name, departments.name, reports.content
-> from people inner join reports on people.person_id = reports.person_id inner join departments on people.department_id= departments.department_id;

Q11
select name from people where not exists (select person_id from reports where people.person_id = reports.person_id);
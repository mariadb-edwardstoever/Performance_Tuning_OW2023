use information_schema;

select TABLE_NAME, TABLE_TYPE, ENGINE
from TABLES
where TABLE_SCHEMA='openworks';

use openworks;

-- CREATE TABLES WITH DIFFERENT ENGINES
drop table if exists my_innodb; drop table if exists my_aria; drop table if exists my_memory; drop table if exists my_blackhole;
drop table if exists my_temp_innodb; drop table if exists my_temp_aria;
create table my_innodb (id integer, first_name varchar(50), last_name varchar(50), city varchar(50));
insert into  my_innodb values (f_random_integer(1,100), f_random_first_name(), f_random_last_name(), f_random_city());
select * from my_innodb;

create table my_aria (id integer, first_name varchar(50), last_name varchar(50), city varchar(50)) engine=aria;
insert into  my_aria values (f_random_integer(1,100), f_random_first_name(), f_random_last_name(), f_random_city());
select * from my_aria;

/* WHAT HAPPENS TO A TABLE WITH ENGINE MEMORY IF I RESTART MARIABD SERVER? */
create table my_memory (id integer, first_name varchar(50), last_name varchar(50), city varchar(50)) engine=memory;
insert into  my_memory values (f_random_integer(1,100), f_random_first_name(), f_random_last_name(), f_random_city());
select * from my_memory;

create table my_blackhole (id integer, first_name varchar(50), last_name varchar(50), city varchar(50)) engine=blackhole;
insert into  my_blackhole values (f_random_integer(1,100), f_random_first_name(), f_random_last_name(), f_random_city());
select * from my_blackhole;

/* TEMPORARY TABLE INNODB */
/* WHAT HAPPENS TO A TEMPORARY TABLE IF I LOGOUT? */
create temporary table my_temp_innodb (id integer, first_name varchar(50), last_name varchar(50), city varchar(50)) engine=innodb;
insert into  my_temp_innodb values (f_random_integer(1,100), f_random_first_name(), f_random_last_name(), f_random_city());
select * from my_temp_innodb;

/* TEMPORARY TABLE ARIA */
create temporary table my_temp_aria (id integer, first_name varchar(50), last_name varchar(50), city varchar(50)) engine=aria;
insert into  my_temp_aria values (f_random_integer(1,100), f_random_first_name(), f_random_last_name(), f_random_city());
select * from my_temp_aria;

/* TEMPORARY TABLES ARE PRIVATE AND NOT VISIBLE IN INFORMATION_SCHEMA */
select TABLE_NAME, TABLE_TYPE, ENGINE
from information_schema.TABLES
where TABLE_SCHEMA='openworks'
order by  engine, table_name;

/* WE HAVE ONE TABLE THAT IS MYISAM ENGINE. IDENTIFY IT AND ALTER IT TO INNODB ENGINE */
alter table site_user_comments_archive engine=innodb;

/* did it work? */
select TABLE_NAME, TABLE_TYPE, ENGINE
from information_schema.TABLES
where TABLE_SCHEMA='openworks'
order by  engine, table_name;
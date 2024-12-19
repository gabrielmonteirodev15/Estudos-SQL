-- Union , except e intersect

create database teste;
use teste;

create table r(
	a char(2)
);

create table s(
	a char(2)
);

insert into r values ('a1'),('a2'),('a2'),('a3');

insert into s values ('a1'),('a1'),('a2'),('a3'),('a4'),('a5');

select * from r;

select * from s;

select * from s where a not in (select a from r); /*except*/

(select distinct r.a from r) union (select distinct s.a from s); /*União*/
(select r.a from r) union (select  s.a from s);

select distinct r.a from r where r.a in (select s.a from s); /*Intersect */

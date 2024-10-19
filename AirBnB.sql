create database mytest;

create table airbnb_hosts (
host_id int,
age int,
gender varchar(50),
nationality varchar(50)
)

insert into airbnb_hosts (host_id,age,gender,nationality) values (1,25,'Female','American')
insert into airbnb_hosts (host_id,age,gender,nationality) values (2,22,'Male','Canadian')
insert into airbnb_hosts (host_id,age,gender,nationality) values (3,29,'Female','French')
insert into airbnb_hosts (host_id,age,gender,nationality) values (4,31,'Male','German')
insert into airbnb_hosts (host_id,age,gender,nationality) values (5,28,'Female','British') 
insert into airbnb_hosts (host_id,age,gender,nationality) values (6,35,'Male','Australian')
insert into airbnb_hosts (host_id,age,gender,nationality) values (7,26,'Female','Japanese')
insert into airbnb_hosts (host_id,age,gender,nationality) values (8,24,'Male','Chinese')
insert into airbnb_hosts (host_id,age,gender,nationality) values (9,30,'Female','Indian')
insert into airbnb_hosts (host_id,age,gender,nationality) values (10,27,'Male','Brazilian')

select * from airbnb_hosts;

create table airbnb_units (
unit_id int,
host_id int
)

insert into airbnb_units (unit_id, host_id) values(101,1)
insert into airbnb_units (unit_id, host_id) values(102,1)
insert into airbnb_units (unit_id, host_id) values(103,2)
insert into airbnb_units (unit_id, host_id) values(104,3)
insert into airbnb_units (unit_id, host_id) values(105,4)
insert into airbnb_units (unit_id, host_id) values(106,5)
insert into airbnb_units (unit_id, host_id) values(107,6)
insert into airbnb_units (unit_id, host_id) values(108,7)
insert into airbnb_units (unit_id, host_id) values(109,8)
insert into airbnb_units (unit_id, host_id) values(110,9)
insert into airbnb_units (unit_id, host_id) values(111,10)
insert into airbnb_units (unit_id, host_id) values(112,2)
insert into airbnb_units (unit_id, host_id) values(113,3)
insert into airbnb_units (unit_id, host_id) values(114,3)
insert into airbnb_units (unit_id, host_id) values(115,5)
insert into airbnb_units (unit_id, host_id) values(116,7)
insert into airbnb_units (unit_id, host_id) values(117,8)


select * from airbnb_hosts;
select * from airbnb_units;


select airbnb_hosts.nationality as nation, count(airbnb_units.unit_id) as apartment_count
from airbnb_hosts inner join airbnb_units on airbnb_hosts.host_id = airbnb_units.host_id 
where airbnb_hosts.age < 30 group by nationality order by apartment_count desc;
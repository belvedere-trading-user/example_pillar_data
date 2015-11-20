create database services;
use services;
create table service (
id INT AUTO_INCREMENT PRIMARY KEY,
name varchar(20),
server varchar(20),
basedir varchar(20),
interface varchar(20),
maxports int,
port int,
user varchar(20),
workerthreads int,
starttime varchar(20),
stoptime varchar(20)
);
insert into services.service values(1,'serviceB','otherhost','/serviceB','0.0.0.0',1024,14000,'testuser',8,'0 10 * * *','0 12 * * *');
insert into services.service values(2,'serviceC','saltmaster1','/serviceC','0.0.0.0',1024,14001,'testuser',10,'0 12 * * *','0 16 * * *');
insert into services.service values(3,'service2','otherhost2','/service2','0.0.0.0',1024,14002,'testuser',11,'0 13 * * *','0 17 * * *');
insert into services.service values(4,'service3','saltmaster1','/service3','0.0.0.0',1024,14003,'testuser',4,'0 13 * * *','0 17 * * *');

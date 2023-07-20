create database class2; 

use class2;

create table dept(
deptid int(10),
dname varchar(20),
location varchar(30) 
);

desc dept;

insert into dept values (1,'account','china');
insert into dept values('2','Research','Delhi');
insert into dept values('3','Sales','Ahmedabad');
insert into dept values('4','Operation','Nagpur');

select * from dept;

select deptid as id,dname as departmentname from dept;

select distinct deptid from dept;

select distinct location from dept;



create table emp(
empid varchar(10) primary key,
ename varchar(40) not null,
job varchar(15) not null,
salary numeric(8,2), 
deptid varchar(10)  
);

insert into emp values('1','jay','Accountant',50000.90,'1');
insert into emp values('2','sushil','data engg',60000,'2');
insert into emp values('11','sushil','data engg',60000,'2');
insert into emp values('3','vaishali','sales man',40000.90,'3');
insert into emp values('4','gowri','ceo',67000.90,'4');
insert into emp values('5','parsad','data scientist',70000.90,'2');
insert into emp values('6','vjay','data analyst',53000.90,'1');
insert into emp values('7','ajay','cto',45000.90,'4');
insert into emp values('10','ajay','cto',45000.90,'4');
insert into emp values('8','suraj','ca',null,'3');
insert into emp values('9','suraj','ca',null,'3');


select * from emp;


-- write a query to get emp with name sushil there ids only 

select empid
from emp
where ename = 'sushil';

-- write a query to get emp name except sushil there ids only 

select empid, ename
from emp
where ename != 'sushil';

select empid
from emp
where not ename = 'sushil';

-- get details of all emp sal > 50000

select *
from emp
where salary > 50000;

-- get details of all emp sal > 50000 inclusive 

select *
from emp
where salary >= 50000;

-- get names of all emp sal < 50000

select ename
from emp
where salary < 50000;

-- get names of all emp sal < 50000 inclusive

select ename
from emp
where salary <= 50000;

-- query to get all data with name jay and sushil

select * 
from emp
where ename in ('jay','sushil');

select * 
from emp
where ename = 'jay' or ename = 'sushil';

-- query to get all data with name sushil and sal >50000 

select *
from emp 
where ename = 'sushil' and salary > 50000;

-- query to get all data without name jay and sushil

select * 
from emp
where not ename in ('jay','sushil');

-- query to get detials of all emp sal between 50000 and 60000

select *
from emp
where salary between 50000 and 60000;


select * from emp;


select *
from emp 
where ename like '_jay';

select *
from emp 
where job like '%data%';


select min(salary) as 'min_sal' from emp;

select max(salary) as 'max_sal' from emp;

select count(salary) from emp;
select count(empid) from emp;

select sum(salary) from emp;

select avg(salary) from emp;

select sum(salary)/count(salary) from emp;

select empid,ename,salary,salary+((10*salary)/100) as 'bonus' from emp;

delete from emp where ename = 'suraj';

set sql_safe_updates = 0;

drop table emp;
select * from emp;

truncate table emp;

select * 
from emp
order by deptid desc,ename 
limit 5;

select salary from emp order by salary desc limit 1 offset 1 ;

select deptid,count(empid) as count from emp group by deptid;

select deptid,sum(salary) from emp group by deptid;

select deptid, salary, count(salary)
from emp
where salary in (45000.90,60000)
group by deptid , salary;

show index from dept;

create index deptidind on dept(deptid);

drop index deptidind on dept


select * from emp;

update emp
set salary = 50000
where empid = 8;


alter table emp 
add location varchar(20)

alter table emp 
drop location 

alter table emp 
rename column location to city

desc emp

alter table emp
modify column city char(20)

create table dept(
deptid varchar(10) primary key,
dname varchar(20),
location varchar(20)
)


create table emp(
empid varchar(10) primary key,
ename varchar(40) not null,
job varchar(15) not null,
salary numeric(8,2), 
deptid varchar(10),
foreign key (deptid) references dept(deptid)  
)

-- creating a view of all emp from dept id 1 and 2

create view emp12 as
select * from emp where deptid in(1,2);


select * from emp12;

-- eplaceing a view of all emp from dept id 3 and 4
create or replace view emp12 as
select * from emp where deptid in(3,4);

-- drop the view
drop view emp12;

create table student(
rollno varchar(10) primary key,
sname varchar(10), 
age int,
city varchar(10)
);

create table subject(
subid varchar(10),
rollno varchar(10)
);

drop table student;
drop table subject;

insert into subject values('1','1');
insert into subject values('3','2');
insert into subject values('2','3');
insert into subject values('2','4');
insert into subject values('1','5');
insert into subject values('3','6');
insert into subject values('4',null);
insert into subject values('5',null);

insert into student values('1','jay',12,'mumbai');
insert into student values('2','ajay',12,'surat');
insert into student values('3','vjay',10,'nagpur');
insert into student values('4','sanjay',11,'jaipur');
insert into student values('5','jaya',13,'mumbai');
insert into student values('6','jayesh',12,'kalyan');
insert into student values('7','vijaya',13,'goa');
insert into student values('8','jaywanti',11,'bangaluru');

select * from student;

select * from subject;

select *
from student full join subject



select subject.subid, student.sname, student.age
from subject inner join student
where subject.rollno = student.rollno;

select b.sname, a.subid as courseid
from student as b inner join subject as a 
on b.rollno = a.rollno;

select *
from student as b left join subject as a 
on b.rollno = a.rollno;

select b.sname, a.subid
from student as b right join subject as a 
on b.rollno = a.rollno;

select sname, subid
from student full join subject;


select empid, salary,
case
when salary >= 40000 and salary <=50000 then 'Avg Salary'
when salary > 50000 and salary <=60000 then 'High Salary'
else 'not in the range or salary is null'
end as sal_struct
from emp;



-- write a stored procedure to give me count of student with x no age which will be givenn as 
-- input 

delimiter &&
create procedure findage(a int)
begin
select Count(rollno) as lesser from student where age < a;
select Count(rollno) as equal from student where age = a;
select Count(rollno) as higher from student where age > a;
end
&& delimiter ;

call findage(11) ;

drop procedure findage;

delimiter &&
create procedure findage(a int)
begin
select Count(rollno) as lesser from student where age < a;
select Count(rollno) as equal from student where age = a;
select Count(rollno) as higher from student where age > a;
end
&& delimiter ;

-- write a query using subquery to get all emp info who has salary > 50000

select * from emp 
where empid in (select empid from emp  where salary > 50000)

select * from emp 
where salary = (select max(salary) from emp);

select * from emp
where empid in (select empid from emp where salary > 40000 and salary < 60000)




select * from emp
select * from dept

-- write a query to get all emp from account dept;
select * from emp 
where deptid in (select deptid from dept where dname = 'account')

select * 
from emp inner join dept 
on emp.deptid = dept.deptid 
where dept.dname = 'account';



select deptid from dept where dname ='account'

select * from emp where deptid = (select deptid from dept where dname ='account')

select * from emp 
where exists 
(select * from dept where dept.deptid = emp.deptid and dname = 'account');

-- write a query to get all emp from account dept;
select * from emp 
where deptid in (select deptid from dept where dname = 'account')

select * 
from emp e inner join dept d
on e.deptid = d.deptid 
where d.dname = 'account';

-- write a query  with count of emp in each dept where count is greater then 1

select deptid, count(empid) as countings
from emp
group by 1
having count(empid) >2

























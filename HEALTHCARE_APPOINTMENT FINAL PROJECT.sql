SQL  project 

---- Healthcare Appointment Scheduling System -----


create database Healthcare;

use healthcare

create table patients(

patients_id int primary key,
name varchar(30),
date_of_birth varchar(20),
phone_number varchar(20))

create table doctors( 

name varchar(30),
doctor_id int,
place varchar(30),
foreign key (doctor_id) references patients (patients_id))

create table appointment( 

appointment_id int,
doctor_id int,  
patients_id int,
phone_number varchar(15),
foreign key (patients_id) references patients (patients_id),
foreign key (doctor_id) references doctors (doctor_id))

create table  medicalhistories(

history_id int,
patients_id int,
name varchar(30),
records_date varchar(30),
foreign key (patients_id) references patients (patients_id))


create table appiontmentslots(

doctor_id int,
name varchar(30),
slots_date varchar(20),
foreign key (doctor_id) references doctors (doctor_id))

create table record( 

name varchar(30),
record_date varchar(20),
place varchar(30),
doctor_name varchar(10),
patient_name varchar(20),
patients_id int,
foreign key (patients_id) references patients (patients_id))

create table hospital( 

hospital_name varchar(30),
doctor_name varchar(20),
doctor_id int,
 foreign key (doctor_id) references doctors (doctor_id))
 
Insert into patients ( patients_id, name, date_of_birth, phone_number ) values
(1,'vishal','2002-09-11','3655896854'),
(2,'muthuvel','2003-07-12','4545628518'),
(3,'gokulnath','2004-05-13','4458215967'),
(4,'nithish','2001-04-20','4851289624'),
(5,'sarath','2003-09-27','7485120090');

Insert into doctors ( name, doctor_id, place ) values
("vimmal", 1,"chennai"),
("sowdarya",2,"newyork"),
("sachin",3,"america"),
("dharshini",4,"arcot"),
("john",5,"newzealand");

Insert into appointment ( appointment_id, doctor_id, patients_id, phone_number ) values
(101, 1, 1,"7485961230"),
(102, 2, 2,"6352417890"),
(103, 3, 3,"8596741236"),
(104, 4, 4,"7596841256"),
(105, 5, 5,"936195688"); 

Insert into medicalhistories ( history_id, patients_id, name, records_date ) values
(001, 1,"vishal", "2001-02-20"),
(002, 2, "gokulath", "2003-09-27"),
(003, 3, "muthuvel", "2004-03-22"),
(004, 4, "nithish", "2006-01-23"),
(005, 5, "sarath", "2003-09-27"); 

Insert into appiontmentslots ( doctor_id, name, slots_date ) values
(1, "dr.smith","2026-01-11"),
(2, "dr.john", "2027-02-12"),
(3, "dr.sam", "2006-07-13"),
(4,"dr.sound","2005-08-14"),
(5,"dr.maran","2004-04-25");

Insert into record( name, record_date, place, doctor_name, patient_name, patients_id ) values
("saran", "2001-02-20", "chennai", "dr.john", "vishal", 1 ),
("gunal", "2003-09-27", "newyork", "dr.smith", "gokulnath", 2),
("kishore","2004-03-22", "america", "dr.sam", "muthuvel", 3 ),
("babu", "2006-01-23", "arcot", "dr.sound", "nitish", 4 ),
("ravindra","2003-09-27","newzealand", "dr.maran", "sarath", 5 );

Insert into hospital( hospital_name, doctor_name, doctor_id ) values
("apollo","dr.smith", 1),
("kavery"," dr.john", 2),
("rajiv","dr.sam", 3), 
("global","dr.sound", 4),
("health","dr.maran", 5);

select p.name as patientname, p.phone_number as doctorname, d.name, d.place
from patients as p
join doctors as d
on p.patients_id = d.doctor_id

select d.doctor_id, a. appointment_id, a.phone_number
from doctors as d
join appointment as a 
on d.doctor_id = a.doctor_id

select p.patients_id, p.phone_number, m.name, m.records_date
from patients as p
join medicalhistories as m
on p.patients_id = m.history_id

select d.name, d.place, ap.slots_date
from doctors as d
join appiontmentslots as ap
on d.doctor_id = ap.doctor_id

select p.patients_id, p.name, r.name, r.doctor_name, r.record_date 
from patients as p
join record as r
on p.patients_id = r.patients_id

select  h.hospital_name, h.doctor_name, r.place, r.record_date
from hospital as h
join record as r
on h.doctor_id = r.patients_id


select p.patients_id,  d.doctor_id, p.name
from patients as p,
doctors as d
where p.patients_id = d.doctor_id

select d.doctor_id, a.appointment_id, d.place
from appointment as a,
doctors as d
where d.doctor_id = a.appointment_id

select m.history_id, a.patients_id, m.name, m.records_date
from medicalhistories as m,
appointment as a
where m.history_id = a.patients_id

select count(*) from patients

select count(*) from doctors

select count(*) from appointment

select count(*) from medicalhistories

select count(*) from appiontmentslots

select count(*)  from hospital

select count(*) from record

select max(doctor_id) from doctors

select sum(doctor_id) from doctors

select avg(doctor_id) from doctors

select min(doctor_id) from doctors

select max(records_date) from medicalhistories

select count(phone_number) from appointment

select
patients_id,
count(h.doctor_name) as no_of_doc
from
hospital h
left join
record as r on h.doctor_id = r.patients_id
group by
patients_id;

select
doctor_id,
count(r.name) as no_of_na
from 
hospital h
left join
record as r on h.doctor_id = r.patients_id
group by
doctor_id;

select 
patients_id,
count(r.doctor_name) as no_of_doc
from 
hospital
left join
record as r on r.patients_id = r.patients_id
group by
patients_id;

select * from doctors limit 2

select * from patients limit 4

select * from medicalhistories limit 3 offset 1

select * from appointment limit 5 offset 2

select * from record limit 4

select* from patients order by patients_id 

select * from doctors order by place

select * from appointment order by phone_number asc ;

select * from medicalhistories order by records_date asc;

select * from medicalhistories order by history_id desc;


select * from patients

select * from doctors

select * from appointment

select * from medicalhistories

select * from appiontmentslots

select * from record

select * from hospital;

-- IN, OUT and INOUT parameters --

Delimiter $$
create procedure hospitalcount()
begin
declare total int default 0;
select count(patients_id)
into total
from patients ;
select total;
end $$
delimiter ;
call patientscount()

Delimiter $$
create procedure record(
in p_id int )
begin
declare total int default 0;
select count(patients_id)
into total
from record 
where patients_id = p_id;
select total;
end $$
delimiter ;

call record('2');
call record('5');

Delimiter $$
create procedure recordstotal(
in p_id int,
out total int )
begin
declare total int default 0;
select count(patients_id)
into total
from record 
where patients_id = p_id;
select total;
end $$
delimiter ;

call recordstotal('2', @total);
select @total;


Delimiter $$
create procedure incrCount(
INOUT count int,
in incr int
 )
begin
set count = count + incr;
end $$
delimiter ;

set @count = 5;
call incrCount(@count, 5);
select @count;
call incrCount(@count, 1);
select @count;

select * from doctors

DELIMITER //
CREATE PROCEDURE Getcountry1(
IN id INT
)
BEGIN
   IF id = 1 OR id = 4 THEN
      SELECT "India";
   ELSEIF id = 2 OR id = 3 THEN
      SELECT "USA";
   ELSE 
      SELECT "Newzland";
   END IF;
END //
DELIMITER ;

call Getcountry1(1);


DELIMITER //
CREATE PROCEDURE Getcountry2(
IN id INT
)
BEGIN
   CASE id
   WHEN 1 or 4 THEN
      SELECT "India";
   WHEN 2 or 3 THEN
      SELECT "USA";
   ELSE 
      SELECT "Newzland";
   END case;
END //
DELIMITER ;

call Getcountry2(1);
call Getcountry2(5);

-- LOOPS --
DELIMITER $$
create procedure Loopset()
begin
   declare i int;
   declare str varchar(30);
   set i = 1;
   set str = ' ';
looplabel : loop
   if i>10 then 
	    leave looplabel;
   end if;
	 set str = CONCAT(str,i, ' ');
     set i = i+1 ;
end loop ;
     select str;
end $$
DELIMITER ; 
     call Loopset();
     
     
DELIMITER $$
create procedure Loopwhile()
begin
   declare i int;
   declare str varchar(30);
   set i = 1;
   set str = ' ';
   while i<=10 do 
           set str = CONCAT(str,i, ' ');
           set i = i+1 ;
   end while;
   
select str;
end $$
DELIMITER ; 
     call Loopwhile();
     
     
DELIMITER $$
create procedure Looprepeat()
begin
   declare i int;
   declare str varchar(30);
   set i = 1;
   set str = ' ';
REPEAT
           set str = CONCAT(str,i, ' ');
           set i = i+1 ;
	until i>10
END REPEAT;
   
select str;
end $$
DELIMITER ; 
  
  
call Looprepeat();











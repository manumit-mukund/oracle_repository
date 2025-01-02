ALTER SESSION SET container = pdb2;

create immutable table test_immutable (
eno number(10),
name varchar2(20), 
address varchar2(20), 
created_date date, 
constraint test_immutable_pk primary key (eno ) ) 
NO DROP UNTIL 10 DAYS IDLE 
NO DELETE UNTIL 30 DAYS AFTER INSERT;
-- Create BLOOD_TYPE Table
create table blood_type (
   blood_type_id   number primary key,
   blood_type_name varchar2(10) not null
);


alter table blood_type add constraint unique_blood_type_name unique ( blood_type_name );
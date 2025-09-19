-- Create LOCATION Table
create table location (
   location_id number primary key,
   address     varchar2(100) not null,
   city        varchar2(50) not null,
   state       varchar2(50) not null,
   pincode     varchar2(10) not null,
   latitude    float,
   longitude   float
);
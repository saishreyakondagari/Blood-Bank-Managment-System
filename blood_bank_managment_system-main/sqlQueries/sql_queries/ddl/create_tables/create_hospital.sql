-- Create HOSPITAL Table
create table hospital (
   hospital_id    number primary key,
   location_id    number not null,
   hospital_type  varchar2(250) not null,
   contact_number varchar2(20) not null,
   hospital_name  varchar2(100) not null,
 
    -- Foreign Key
   constraint hospital_location_fk foreign key ( location_id )
      references location ( location_id )
);
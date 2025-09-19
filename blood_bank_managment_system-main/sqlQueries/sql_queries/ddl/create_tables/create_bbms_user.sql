-- Create BBMS_USER Table
create table bbms_user (
   user_id        number primary key,
   location_id    number not null,
   person_type_id number not null,
   hospital_id    number, -- Nullable, only for doctors or staff
   name           varchar2(255) not null,
   email          varchar2(100) not null,
   phone          varchar2(15) not null,
   gender         varchar2(10) not null,
   dob            date not null,
   blood_type_id  number not null,
 
    -- Foreign Keys
   constraint bbms_user_location_fk foreign key ( location_id )
      references location ( location_id ),
   constraint bbms_user_person_type_fk foreign key ( person_type_id )
      references person_type ( person_type_id ),
   constraint bbms_user_hospital_fk foreign key ( hospital_id )
      references hospital ( hospital_id ),
   constraint bbms_user_blood_type_fk foreign key ( blood_type_id )
      references blood_type ( blood_type_id )
);

create sequence bbms_user_seq start with 1 increment by 1;
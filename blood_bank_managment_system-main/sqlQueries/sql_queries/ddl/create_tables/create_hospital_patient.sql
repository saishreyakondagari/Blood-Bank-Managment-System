-- Create HOSPITAL_PATIENT Table
create table hospital_patient (
   hospital_patient_id number primary key,
   hospital_id         number not null,
   user_id             number not null,
   admission_date      date not null,
   discharge_date      date,
 
    -- Foreign Keys
   constraint hospital_patient_hospital_fk foreign key ( hospital_id )
      references hospital ( hospital_id ),
   constraint hospital_patient_user_fk foreign key ( user_id )
      references bbms_user ( user_id )
);

create sequence bbms_hospital_patient_seq start with 1 increment by 1;
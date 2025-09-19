-- Create BLOOD_REQUEST Table
create table blood_request (
   request_id          number primary key,
   hospital_id         number not null,
   hospital_patient_id number not null,
   blood_type_id       number not null,
   quantity_requested  number not null,
   request_date        date not null,
   status              varchar2(20) not null,
 
    -- Foreign Keys
   constraint blood_request_hospital_fk foreign key ( hospital_id )
      references hospital ( hospital_id ),
   constraint blood_request_patient_fk foreign key ( hospital_patient_id )
      references hospital_patient ( hospital_patient_id ),
   constraint blood_request_blood_type_fk foreign key ( blood_type_id )
      references blood_type ( blood_type_id )
);

create sequence bbms_blood_req_seq start with 1 increment by 1;
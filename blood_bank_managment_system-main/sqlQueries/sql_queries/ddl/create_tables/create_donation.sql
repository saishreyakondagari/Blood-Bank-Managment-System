-- Create DONATION Table
create table donation (
   donation_id         number primary key,
   blood_bank_id       number not null,
   user_id             number not null,
   blood_type_id       number not null,
   quantity            number not null,
   donation_date       date not null,
   status              varchar2(20) not null,
   hospital_patient_id number,
 
    -- Foreign Keys
   constraint donation_user_fk foreign key ( user_id )
      references bbms_user ( user_id ),
   constraint donation_blood_bank_fk foreign key ( blood_bank_id )
      references blood_bank ( blood_bank_id ),
   constraint donation_blood_type_fk foreign key ( blood_type_id )
      references blood_type ( blood_type_id ),
   constraint donation_hospital_patient_fk foreign key ( hospital_patient_id )
      references hospital_patient ( hospital_patient_id )
);

create sequence bbms_donation_seq start with 1 increment by 1;
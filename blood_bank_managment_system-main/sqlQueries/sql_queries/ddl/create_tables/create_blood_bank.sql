-- Create BLOOD_BANK Table
create table blood_bank (
   blood_bank_id   number primary key,
   location_id     number not null,
   capacity        number not null,
   blood_bank_name varchar2(100) not null,
 
    -- Foreign Key
   constraint blood_bank_location_fk foreign key ( location_id )
      references location ( location_id )
);
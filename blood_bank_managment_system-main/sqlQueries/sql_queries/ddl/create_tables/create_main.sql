begin
   for t in (
      select table_name
        from (
         select 'BLOOD_REQUEST' as table_name
           from dual
         union all
         select 'DONATION'
           from dual
         union all
         select 'HOSPITAL_PATIENT'
           from dual
         union all
         select 'BBMS_USER'
           from dual
         union all
         select 'BLOOD_BANK'
           from dual
         union all
         select 'HOSPITAL'
           from dual
         union all
         select 'BLOOD_TYPE'
           from dual
         union all
         select 'PERSON_TYPE'
           from dual
         union all
         select 'LOCATION'
           from dual
      )
   ) loop
      begin
         execute immediate 'DROP TABLE '
                           || t.table_name
                           || ' CASCADE CONSTRAINTS';
         dbms_output.put_line('Dropped table: ' || t.table_name);
      exception
         when others then
            if sqlcode = -942 then -- ORA-00942: table or view does not exist
               dbms_output.put_line('Table does not exist: ' || t.table_name);
            else
               dbms_output.put_line('Error dropping table '
                                    || t.table_name
                                    || ': '
                                    || sqlerrm);
            end if;
      end;
   end loop;
end;
/

DROP SEQUENCE bbms_user_seq;
DROP SEQUENCE bbms_hospital_patient_seq;
DROP SEQUENCE bbms_blood_req_seq;
DROP SEQUENCE bbms_donation_seq;

@create_location.sql
@create_person_type.sql
@create_blood_type.sql
@create_hospital.sql
@create_blood_bank.sql
@create_bbms_user.sql
@create_hospital_patient.sql
@create_blood_request.sql
@create_donation.sql
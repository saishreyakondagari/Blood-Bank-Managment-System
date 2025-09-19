-- Consistent Hospital Patient Insertions
begin
   begin insert into hospital_patient values (1, 206, 1, to_date('2023-11-01','YYYY-MM-DD'), to_date('2023-11-10','YYYY-MM-DD') ); exception when dup_val_on_index then null; end;
   begin insert into hospital_patient values (2, 206, 2, to_date('2023-12-05','YYYY-MM-DD'), to_date('2023-12-12','YYYY-MM-DD') ); exception when dup_val_on_index then null; end;
   begin insert into hospital_patient values (3, 206, 3, to_date('2023-11-20','YYYY-MM-DD'), to_date('2023-11-25','YYYY-MM-DD') ); exception when dup_val_on_index then null; end;
   begin insert into hospital_patient values (4, 201, 1007, to_date('2023-12-05','YYYY-MM-DD'), to_date('2027-12-12','YYYY-MM-DD') ); exception when dup_val_on_index then null; end;
   begin insert into hospital_patient values (5, 201, 1008, to_date('2023-11-20','YYYY-MM-DD'), to_date('2028-11-25','YYYY-MM-DD') ); exception when dup_val_on_index then null; end;
 
   -- Ensure consistent user and hospital references
end;
/





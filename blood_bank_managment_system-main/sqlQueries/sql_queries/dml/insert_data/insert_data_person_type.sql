-- Consistent Person Type Insertions
begin
   begin insert into person_type values ( 1, 'Doctor' ); exception when dup_val_on_index then null; end;
   begin insert into person_type values ( 2, 'Patient' ); exception when dup_val_on_index then null; end;
   begin insert into person_type values ( 3, 'Donor' ); exception when dup_val_on_index then null; end;
   begin insert into person_type values ( 4, 'Blood Bank Staff' ); exception when dup_val_on_index then null; end;
end;
/
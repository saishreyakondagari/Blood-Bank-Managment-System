-- Consistent Blood Type Insertions
begin
   begin insert into blood_type values ( 1,'A+' ); exception when dup_val_on_index then null; end;
   begin insert into blood_type values ( 2,'A-' ); exception when dup_val_on_index then null; end;
   begin insert into blood_type values ( 3,'B+' ); exception when dup_val_on_index then null; end;
   begin insert into blood_type values ( 4,'B-' ); exception when dup_val_on_index then null; end;
   begin insert into blood_type values ( 5,'O+' ); exception when dup_val_on_index then null; end;
   begin insert into blood_type values ( 6,'O-' ); exception when dup_val_on_index then null; end; 
   begin insert into blood_type values ( 7,'AB+' ); exception when dup_val_on_index then null; end;
   begin insert into blood_type values ( 8,'AB-' ); exception when dup_val_on_index then null; end;
end;
/
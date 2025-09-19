-- Consistent Blood Request Insertions
begin
   BEGIN INSERT INTO BLOOD_REQUEST VALUES (1, 201, 501, 1, 500, TO_DATE('2023-12-01','YYYY-MM-DD'), 'Pending'); EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
   BEGIN INSERT INTO BLOOD_REQUEST VALUES (2, 202, 502, 5, 1000, TO_DATE('2023-12-05','YYYY-MM-DD'), 'Approved'); EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; END;
   begin insert into blood_request values ( 6, 206, 506, 1, 500, to_date('2023-11-21','YYYY-MM-DD'),'Approved' ); exception when dup_val_on_index then null; end;
   begin insert into blood_request values ( 7, 207, 507, 2, 750, to_date('2024-01-03','YYYY-MM-DD'),'Pending' ); exception when dup_val_on_index then null; end;
   begin insert into blood_request values ( 8, 208, 508, 5, 1000, to_date('2024-02-16','YYYY-MM-DD'), 'Fulfilled' ); exception when dup_val_on_index then null; end;
 
    -- Ensure consistent references between tables
end;
/
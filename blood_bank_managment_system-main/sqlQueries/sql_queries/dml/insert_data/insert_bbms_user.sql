-- Consistent User Insertions with Synchronized Location, Blood Type
begin

   begin insert into bbms_user values (1001, 101, 3, null, 'Rahul Sharma', 'rahul.sharma@example.com', '9876543210', 'Male', to_date('1990-05-20','YYYY-MM-DD'), 1 ); exception when dup_val_on_index then null; end;
   begin insert into bbms_user values (1002, 101, 3, null, 'Anita Verma', 'anita.verma@example.com', '9123456780', 'Female', to_date('1985-08-12','YYYY-MM-DD'), 2 ); exception when dup_val_on_index then null; end;
   begin insert into bbms_user values (1003, 101, 3, null, 'Arjun Mehra', 'arjun.mehra@example.com', '9988771122', 'Male', to_date('1990-02-18','YYYY-MM-DD'), 1 ); exception when dup_val_on_index then null; end;
   begin insert into bbms_user values (1004, 102, 3, null, 'Meena Kaur', 'meena.kaur@example.com', '9877123456', 'Female', to_date('1988-06-23','YYYY-MM-DD'), 2 ); exception when dup_val_on_index then null; end;
   begin insert into bbms_user values (1005, 102, 3, null, 'Tarun Gill', 'tarun.gill@example.com', '9776543210', 'Male', to_date('1992-01-30','YYYY-MM-DD'), 3 ); exception when dup_val_on_index then null; end;
   begin insert into bbms_user values (1006, 102, 3, null, 'Neha Dsouza', 'neha.dsouza@example.com', '9345678901', 'Female', to_date('1993-12-12','YYYY-MM-DD'), 4 ); exception when dup_val_on_index then null; end;
   
   BEGIN INSERT INTO bbms_user VALUES (1007, 101, 2, 201, 'Ramesh Gupta', 'ramesh.gupta@example.com', '9001122334', 'Male', TO_DATE('1982-07-15','YYYY-MM-DD'), 1); EXCEPTION WHEN dup_val_on_index THEN NULL; END;
   BEGIN INSERT INTO bbms_user VALUES (1008, 101, 2, 201, 'Sneha Reddy', 'sneha.reddy@example.com', '9877765432', 'Female', TO_DATE('1990-04-10','YYYY-MM-DD'), 2); EXCEPTION WHEN dup_val_on_index THEN NULL; END;
   BEGIN INSERT INTO bbms_user VALUES (1009, 101, 2, 201, 'Vikram Shetty', 'vikram.shetty@example.com', '9123459900', 'Male', TO_DATE('1975-01-28','YYYY-MM-DD'), 3); EXCEPTION WHEN dup_val_on_index THEN NULL; END;
   BEGIN INSERT INTO bbms_user VALUES (1010, 102, 2, 202, 'Fatima Khan','fatima.khan@example.com', '9988772233', 'Female', TO_DATE('1987-11-03','YYYY-MM-DD'), 4); EXCEPTION WHEN dup_val_on_index THEN NULL; END;
   BEGIN INSERT INTO bbms_user VALUES (1011, 102, 2, 202, 'Ajay Nair','ajay.nair@example.com', '9112233445', 'Male', TO_DATE('1993-06-25','YYYY-MM-DD'), 5); EXCEPTION WHEN dup_val_on_index THEN NULL; END;

   BEGIN INSERT INTO bbms_user VALUES (1012, 101, 2, 202, 'Emma Johnson', 'donor3010@example.com', '9003010010', 'Male', TO_DATE('1980-01-01','YYYY-MM-DD'), 1); EXCEPTION WHEN dup_val_on_index THEN NULL; END; 
   BEGIN INSERT INTO bbms_user VALUES (1013, 102, 4, NULL, 'Liam Parker', 'donor3011@example.com', '9003011011', 'Female', TO_DATE('1981-02-02','YYYY-MM-DD'), 2); EXCEPTION WHEN dup_val_on_index THEN NULL; END; 
   BEGIN INSERT INTO bbms_user VALUES (1014, 101, 4, NULL, 'Olivia Davis', 'donor3012@example.com', '9003012012', 'Male', TO_DATE('1982-03-03','YYYY-MM-DD'), 3); EXCEPTION WHEN dup_val_on_index THEN NULL; END; 
   BEGIN INSERT INTO bbms_user VALUES (1015, 102, 4, NULL, 'Noah Thompson', 'donor3013@example.com', '9003013013', 'Female', TO_DATE('1983-04-04','YYYY-MM-DD'), 4); EXCEPTION WHEN dup_val_on_index THEN NULL; END; 
   BEGIN INSERT INTO bbms_user VALUES (1016, 101, 4, NULL, 'Ava Martinez', 'donor3014@example.com', '9003014014', 'Male', TO_DATE('1984-05-05','YYYY-MM-DD'), 5); EXCEPTION WHEN dup_val_on_index THEN NULL; END; 
   BEGIN INSERT INTO bbms_user VALUES (1017, 102, 1, 201, 'Elijah Lee', 'donor3015@example.com', '9003015015', 'Female', TO_DATE('1985-06-06','YYYY-MM-DD'), 6); EXCEPTION WHEN dup_val_on_index THEN NULL; END; 
   BEGIN INSERT INTO bbms_user VALUES (1018, 101, 1, 201, 'Sophia Clark', 'donor3016@example.com', '9003016016', 'Male', TO_DATE('1986-07-07','YYYY-MM-DD'), 7); EXCEPTION WHEN dup_val_on_index THEN NULL; END; 
   BEGIN INSERT INTO bbms_user VALUES (1019, 102, 1, 202, 'Mason Lewis', 'donor3017@example.com', '9003017017', 'Female', TO_DATE('1987-08-08','YYYY-MM-DD'), 8); EXCEPTION WHEN dup_val_on_index THEN NULL; END; 
   BEGIN INSERT INTO bbms_user VALUES (1020, 102, 1, 202, 'Isabella Hall', 'donor3025@example.com', '9003025025', 'Female', TO_DATE('1995-04-16','YYYY-MM-DD'), 1); EXCEPTION WHEN dup_val_on_index THEN NULL; END;

end;
/
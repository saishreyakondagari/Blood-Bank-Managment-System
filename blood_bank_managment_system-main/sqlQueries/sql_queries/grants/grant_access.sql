-- -- Drop existing roles if they exist
-- BEGIN
--    EXECUTE IMMEDIATE 'DROP ROLE bbms_admin_role';
--    EXECUTE IMMEDIATE 'DROP ROLE bbms_donor_role';
--    EXECUTE IMMEDIATE 'DROP ROLE bbms_staff_role';
-- EXCEPTION
--    WHEN OTHERS THEN NULL; -- Ignore if role doesn't exist
-- END;
-- /

-- -- Create new roles
-- CREATE ROLE bbms_admin_role;
-- CREATE ROLE bbms_donor_role;
-- CREATE ROLE bbms_staff_role;

-- -- Grant full privileges to admin
-- GRANT ALL ON location TO bbms_admin_role;
-- GRANT ALL ON person_type TO bbms_admin_role;
-- GRANT ALL ON blood_type TO bbms_admin_role;
-- GRANT ALL ON hospital TO bbms_admin_role;
-- GRANT ALL ON blood_bank TO bbms_admin_role;
-- GRANT ALL ON bbms_user TO bbms_admin_role;
-- GRANT ALL ON hospital_patient TO bbms_admin_role;
-- GRANT ALL ON blood_request TO bbms_admin_role;
-- GRANT ALL ON donation TO bbms_admin_role;

-- -- Grant limited privileges to donors
-- GRANT SELECT, INSERT ON donation TO bbms_donor_role;
-- GRANT SELECT ON blood_type TO bbms_donor_role;
-- GRANT SELECT ON blood_bank TO bbms_donor_role;
-- GRANT SELECT ON bbms_user TO bbms_donor_role;

-- -- Grant operational access to blood bank staff
-- GRANT SELECT, UPDATE ON donation TO bbms_staff_role;
-- GRANT SELECT, UPDATE ON blood_request TO bbms_staff_role;
-- GRANT SELECT ON bbms_user TO bbms_staff_role;
-- GRANT SELECT ON hospital TO bbms_staff_role;

-- -- Drop existing users if they exist
-- BEGIN
--    FOR user_rec IN (
--        SELECT 'BBMS_ADMIN' AS username FROM dual UNION ALL
--        SELECT 'BBMS_DONOR' FROM dual UNION ALL
--        SELECT 'BBMS_STAFF' FROM dual
--    ) LOOP
--        BEGIN
--            EXECUTE IMMEDIATE 'DROP USER ' || user_rec.username || ' CASCADE';
--        EXCEPTION
--            WHEN OTHERS THEN
--                IF SQLCODE != -1918 THEN NULL; END IF; -- Ignore 'user does not exist'
--        END;
--    END LOOP;
-- END;
-- /

-- -- Create BBMS_ADMIN and assign admin role
-- BEGIN
--     EXECUTE IMMEDIATE 'CREATE USER bbms_admin IDENTIFIED BY "AdminPass123#" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp';
--     EXECUTE IMMEDIATE 'GRANT bbms_admin_role TO bbms_admin';
--     EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO bbms_admin';
-- EXCEPTION
--     WHEN OTHERS THEN
--         IF SQLCODE = -1920 THEN NULL; ELSE RAISE; END IF;
-- END;
-- /

-- -- Create BBMS_DONOR and assign donor role
-- BEGIN
--     EXECUTE IMMEDIATE 'CREATE USER bbms_donor IDENTIFIED BY "DonorPass123#" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp';
--     EXECUTE IMMEDIATE 'GRANT bbms_donor_role TO bbms_donor';
--     EXECUTE IMMEDIATE 'GRANT CONNECT TO bbms_donor';
-- EXCEPTION
--     WHEN OTHERS THEN
--         IF SQLCODE = -1920 THEN NULL; ELSE RAISE; END IF;
-- END;
-- /

-- -- Create BBMS_STAFF and assign staff role
-- BEGIN
--     EXECUTE IMMEDIATE 'CREATE USER bbms_staff IDENTIFIED BY "StaffPass123#" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp';
--     EXECUTE IMMEDIATE 'GRANT bbms_staff_role TO bbms_staff';
--     EXECUTE IMMEDIATE 'GRANT CONNECT TO bbms_staff';
-- EXCEPTION
--     WHEN OTHERS THEN
--         IF SQLCODE = -1920 THEN NULL; ELSE RAISE; END IF;
-- END;
-- /

-- -- Commit changes
-- COMMIT;




--new



-- Drop existing roles if they exist
BEGIN
   EXECUTE IMMEDIATE 'DROP ROLE bbms_admin_role';
   EXECUTE IMMEDIATE 'DROP ROLE bbms_donor_role';
   EXECUTE IMMEDIATE 'DROP ROLE bbms_patient_role';
   EXECUTE IMMEDIATE 'DROP ROLE bbms_staff_role';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

-- Create roles
CREATE ROLE bbms_admin_role;
CREATE ROLE bbms_donor_role;
CREATE ROLE bbms_patient_role;
CREATE ROLE bbms_staff_role;

-- Grant privileges to admin
BEGIN
    FOR tbl IN (SELECT table_name FROM user_tables) LOOP
        EXECUTE IMMEDIATE 'GRANT ALL ON ' || tbl.table_name || ' TO bbms_admin_role';
    END LOOP;
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON onboard_user TO bbms_admin_role';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON donate_blood_main_flow TO bbms_admin_role';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON add_blood_request TO bbms_admin_role';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON update_inventory_and_status TO bbms_admin_role';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON check_blood_availability TO bbms_admin_role';
END;
/

-- Donor privileges
GRANT SELECT ON blood_bank TO bbms_donor_role;
GRANT SELECT ON blood_type TO bbms_donor_role;
GRANT SELECT ON donation TO bbms_donor_role;
GRANT SELECT ON bbms_user TO bbms_donor_role;
GRANT INSERT ON donation TO bbms_donor_role;
GRANT EXECUTE ON onboard_user TO bbms_donor_role;
GRANT EXECUTE ON donate_blood_main_flow TO bbms_donor_role;

-- Patient privileges
GRANT SELECT ON hospital TO bbms_patient_role;
GRANT SELECT ON blood_type TO bbms_patient_role;
GRANT SELECT ON blood_bank TO bbms_patient_role;
GRANT INSERT ON blood_request TO bbms_patient_role;
GRANT EXECUTE ON onboard_user TO bbms_patient_role;
GRANT EXECUTE ON add_blood_request TO bbms_patient_role;

-- Staff privileges
GRANT SELECT, UPDATE ON donation TO bbms_staff_role;
GRANT SELECT, UPDATE ON blood_request TO bbms_staff_role;
GRANT SELECT ON bbms_user TO bbms_staff_role;
GRANT SELECT ON hospital TO bbms_staff_role;
GRANT EXECUTE ON update_inventory_and_status TO bbms_staff_role;
GRANT EXECUTE ON check_blood_availability TO bbms_staff_role;

-- Drop users if exist
BEGIN
   FOR user_rec IN (
       SELECT 'BBMS_ADMIN' AS username FROM dual UNION ALL
       SELECT 'BBMS_DONOR' FROM dual UNION ALL
       SELECT 'BBMS_PATIENT' FROM dual UNION ALL
       SELECT 'BBMS_STAFF' FROM dual
   ) LOOP
       BEGIN
           EXECUTE IMMEDIATE 'DROP USER ' || user_rec.username || ' CASCADE';
       EXCEPTION
           WHEN OTHERS THEN
               IF SQLCODE != -1918 THEN NULL; END IF;
       END;
   END LOOP;
END;
/

-- DROP USER bbms_admin;
-- DROP USER bbms_donor;
-- DROP USER bbms_patient;
-- DROP USER bbms_staff;


-- Create users and assign roles
BEGIN
    EXECUTE IMMEDIATE 'CREATE USER bbms_admin IDENTIFIED BY "AdminPass123#" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp';
    EXECUTE IMMEDIATE 'GRANT bbms_admin_role TO bbms_admin';
    EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO bbms_admin';

    EXECUTE IMMEDIATE 'CREATE USER bbms_donor IDENTIFIED BY "DonorPass123#" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp';
    EXECUTE IMMEDIATE 'GRANT bbms_donor_role TO bbms_donor';
    EXECUTE IMMEDIATE 'GRANT CONNECT TO bbms_donor';

    EXECUTE IMMEDIATE 'CREATE USER bbms_patient IDENTIFIED BY "PatientPass123#" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp';
    EXECUTE IMMEDIATE 'GRANT bbms_patient_role TO bbms_patient';
    EXECUTE IMMEDIATE 'GRANT CONNECT TO bbms_patient';

    EXECUTE IMMEDIATE 'CREATE USER bbms_staff IDENTIFIED BY "StaffPass123#" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp';
    EXECUTE IMMEDIATE 'GRANT bbms_staff_role TO bbms_staff';
    EXECUTE IMMEDIATE 'GRANT CONNECT TO bbms_staff';
END;
/

COMMIT;




ALTER USER bbms_admin QUOTA UNLIMITED ON DATA;
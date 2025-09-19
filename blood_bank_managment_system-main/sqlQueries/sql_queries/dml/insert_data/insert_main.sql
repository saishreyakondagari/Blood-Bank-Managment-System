-- Runn 3-7 and then use onboard user.sql and then run 11.

@insert_location.sql
@insert_data_person_type.sql
@insert_data_blood_type.sql
@insert_hospital.sql
@insert_blood_bank.sql

-- @insert_bbms_user.sql -- use onboard user.sql instead of this.

@insert_hospital_patient.sql

-- These below are taken care by bussiness logic.
-- @insert_data_blood_request.sql 
-- @insert_donation.sql
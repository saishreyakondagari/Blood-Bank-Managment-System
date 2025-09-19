DROP TRIGGER trg_validate_patient_dates;

CREATE OR REPLACE TRIGGER trg_validate_patient_dates 
    BEFORE INSERT OR UPDATE ON HOSPITAL_PATIENT 
    FOR EACH ROW BEGIN 
    IF :NEW.discharge_date IS NOT NULL AND :NEW.discharge_date < :NEW.admission_date 
    THEN RAISE_APPLICATION_ERROR(-20010, 'Discharge date must be after admission date.'); 
    END IF; 
END; 

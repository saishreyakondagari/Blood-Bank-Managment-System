CREATE OR REPLACE VIEW Current_Inventory_Status AS
SELECT 
    BB.blood_bank_id AS Blood_Bank_ID,
    BB.blood_bank_name AS Blood_Bank_Name,
    BT.blood_type_name AS Blood_Type_Name,
    COUNT(D.donation_id) AS Available_Units
FROM 
    BLOOD_BANK BB
JOIN 
    DONATION D ON D.blood_bank_id = BB.blood_bank_id
JOIN 
    BLOOD_TYPE BT ON D.blood_type_id = BT.blood_type_id
WHERE 
    D.status = 'Available' -- Assuming blood is usable for 6 weeks
GROUP BY 
    BB.blood_bank_id,
    BB.blood_bank_name,
    BT.blood_type_name;




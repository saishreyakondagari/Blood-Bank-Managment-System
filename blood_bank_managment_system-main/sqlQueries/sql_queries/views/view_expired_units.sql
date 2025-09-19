CREATE OR REPLACE VIEW Expired_Units AS
SELECT 
    D.Donation_ID,
    BB.Blood_Bank_Name,
    BT.Blood_Type_Name,
    D.Donation_Date AS Donation_Date,
    SYSDATE AS Expiry_Date
FROM 
    Donation D
JOIN Blood_Bank BB ON D.Blood_Bank_ID = BB.Blood_Bank_ID
JOIN Blood_Type BT ON D.Blood_Type_ID = BT.Blood_Type_ID
WHERE 
    D.Donation_Date < SYSDATE - 90;  -- 12-week shelf life


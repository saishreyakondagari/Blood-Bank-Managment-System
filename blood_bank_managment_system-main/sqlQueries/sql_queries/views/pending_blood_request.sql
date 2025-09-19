CREATE OR REPLACE VIEW Pending_Blood_Requests AS
SELECT 
    BR.Request_ID,
    H.Hospital_Name,
    HP.Hospital_Patient_ID,
    U.Name AS Patient_Name,
    BT.Blood_Type_Name,
    BR.Quantity_Requested,
    BR.Request_Date
FROM 
    Blood_Request BR
JOIN Hospital H ON BR.Hospital_ID = H.Hospital_ID
JOIN Hospital_Patient HP ON BR.Hospital_Patient_ID = HP.Hospital_Patient_ID
JOIN BBMS_User U ON HP.User_ID = U.User_ID
JOIN Blood_Type BT ON BR.Blood_Type_ID = BT.Blood_Type_ID
WHERE 
    BR.Status = 'Pending';
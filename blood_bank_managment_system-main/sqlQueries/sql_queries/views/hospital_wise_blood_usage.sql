CREATE OR REPLACE VIEW Hospital_Wise_Blood_Usage AS
SELECT 
    H.Hospital_ID,
    H.Hospital_Name,
    BT.Blood_Type_Name,
    COUNT(BR.Request_ID) AS Units_Consumed
FROM 
    Hospital H
JOIN Blood_Request BR ON BR.Hospital_ID = H.Hospital_ID
JOIN Blood_Type BT ON BR.Blood_Type_ID = BT.Blood_Type_ID
WHERE 
    BR.Status = 'Fulfilled' -- Fulfilled/ Approved/ Pending 
GROUP BY 
    H.Hospital_ID, 
    H.Hospital_Name, 
    BT.Blood_Type_Name;
SELECT Rental_c_00Dam00000GjFZb__dll.Customer_c__c as Party__c
  , Concat(Rental_c_00Dam00000GjFZb__dll.Customer_c__c, "_", Rental_c_00Dam00000GjFZb__dll.Airline_Membership_Number_c__c) as Party_Identification_ID__c
  , "Loyalty Program" as Party_Identification_Type__c
  , "Airline Membership" as Identification_Name__c
  , Rental_c_00Dam00000GjFZb__dll.Airline_Membership_Number_c__c  as Identification_Number__c
  FROM Rental_c_00Dam00000GjFZb__dll
 WHERE Rental_c_00Dam00000GjFZb__dll.Airline_Membership_Number_c__c <> '' 
   AND Rental_c_00Dam00000GjFZb__dll.Airline_Membership_Number_c__c <> ""

UNION

SELECT Rental_c_00Dam00000GjFZb__dll.Customer_c__c as Party__c
  , Concat(Rental_c_00Dam00000GjFZb__dll.Customer_c__c, "_", Rental_c_00Dam00000GjFZb__dll.Driver_License_Number_c__c ) as Party_Identification_ID__c
  , "Person Identification" as Party_Identification_Type__c
  , "Driver License" as Identification_Name__c
  , Rental_c_00Dam00000GjFZb__dll.Driver_License_Number_c__c as Identification_Number__c
  FROM Rental_c_00Dam00000GjFZb__dll
 WHERE Rental_c_00Dam00000GjFZb__dll.Driver_License_Number_c__c <> '' 
   AND Rental_c_00Dam00000GjFZb__dll.Driver_License_Number_c__c <> ""

UNION

SELECT Rental_c_00Dam00000GjFZb__dll.Customer_c__c as Party__c
  , Concat(Rental_c_00Dam00000GjFZb__dll.Customer_c__c, "_", Rental_c_00Dam00000GjFZb__dll.Motor_Club_Number_c__c) as Party_Identification_ID__c
  , "Loyalty Program" as Party_Identification_Type__c
  , "Motor Club Membership" as Identification_Name__c
  , Rental_c_00Dam00000GjFZb__dll.Motor_Club_Number_c__c  as Identification_Number__c
  FROM Rental_c_00Dam00000GjFZb__dll
 WHERE Rental_c_00Dam00000GjFZb__dll.Motor_Club_Number_c__c <> '' 
   AND Rental_c_00Dam00000GjFZb__dll.Motor_Club_Number_c__c <> ""

UNION

SELECT Rental_c_00Dam00000GjFZb__dll.Customer_c__c as Party__c
  , Concat(Rental_c_00Dam00000GjFZb__dll.Customer_c__c, "_", Rental_c_00Dam00000GjFZb__dll.RAVG_Retail_Membership_Number_c__c) as Party_Identification_ID__c
  , "Loyalty Program" as Party_Identification_Type__c
  , "RAVG Retail Membership" as Identification_Name__c
  , Rental_c_00Dam00000GjFZb__dll.RAVG_Retail_Membership_Number_c__c  as Identification_Number__c
  FROM Rental_c_00Dam00000GjFZb__dll
 WHERE Rental_c_00Dam00000GjFZb__dll.RAVG_Retail_Membership_Number_c__c <> '' 
   AND Rental_c_00Dam00000GjFZb__dll.RAVG_Retail_Membership_Number_c__c <> ""
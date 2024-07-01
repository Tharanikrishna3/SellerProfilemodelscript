Feature: Seller Profile model -Seller manage model Testing

@Scenario1SellerManagemodel
  Scenario: If the records are not present in seller table compared with ED, we have to insert the record with current time stamp and seller level should be 1 and SF user Id is 0
  Given Test data setup with this data to be deleted or updated "DELETE FROM  DBLFMSXR.FMST_O_SP_SELLER WHERE SELLER_CNUM ='ZZ03NB826' WITH UR"
  Then Triggering the model through FMSV_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMST_O_SP_SELLER WHERE SELLER_CNUM ='ZZ03NB826' AND SELLER_LEVEL_ID =1 AND SF_USER_ID =0 WITH UR"
  
  
  @Scenario2SellerManagemodel
  Scenario: If the records not available in ED and Open seller table, we have to cancel it in Seller table and delete date is 
   Given Test data setup with this data to be deleted or updated "DELETE FROM DBLFMSXR.FMST_R_ED_EXTRACT WHERE EE_TALENT_ID = '0G1755649' WITH UR"
  Then Triggering the model through FMSV_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMST_O_SP_SELLER WHERE SELLER_CNUM='0G1755649' AND DLET_DATE ='2024-04-29' WITH UR"
  
   @Scenario3SellerManagemodel
  Scenario: If we have any changes compared with ED and open seller, we have to update it in Seller table[Updated fields are employee type, notes, email id] 
   Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_R_ED_EXTRACT SET EE_NAME='TharaniK',IID='Tharanikk@ibm.com',EE_NOTES_ID ='Automation' WHERE EE_TALENT_ID ='2J6600897' WITH UR"
  Then Triggering the model through FMSV_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMST_O_SP_SELLER WHERE SELLER_CNUM ='2J6600897' AND SELLER_FIRST_NAME ='TharaniK' AND SELLER_NOTES_ID ='Automation' AND SELLER_EMAIL ='Tharanikk@ibm.com' WITH UR"
  
  @Scenario4SellerManagemodel
  Scenario: If the record having mismatch[Lm1 and Lm2] we have to end dated with current date -1 in Line mgmt and also Func mgmt tables and insert the new record in line mgmt table 
  Given Check the data populated fine or not after triggering model in Line management table with this EE_TALENT_ID "496561744"
  
  @Scenario5SellerManagemodel
  Scenario: If the LM1_CNUM in seller table is INVALID Then end dated in Line mgt table and insert the same seller's which is not having invalid as cnum in line mgmt table. 
  Given Check the data populated fine or not after triggering model in Line management table with invalid sellercnum "988547744"
  
   @Scenario6SellerManagemodel
  Scenario: If the records mismatch in ED and Line mgmt table Other than cnum,email, name, notes id, we have to update in line mgmt table 
  Given Check the data populated fine or not after triggering model in Line management table with updated values in sellercnum "970728897","TharaniV@ibm.com","TharaniVenkat","Checknotess"
  
   @Scenario7SellerManagemodel
  Scenario: If the record is there in Open seller OR ED, if not present in Line mgmt table, we have to insert in line mgmt table 
  Test data setup with this data to be deleted or updated "DELETE  FROM DBLFMSXR.FMSV1_O_SP_SELLER_LINE_MGMT WHERE LM1_CNUM='3D2686897' WITH UR"
  Then Triggering the model through FMSV_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT *  FROM DBLFMSXR.FMSV1_O_SP_SELLER_LINE_MGMT WHERE LM1_CNUM='3D2686897' WITH UR"
  
  @Scenario8SellerManagemodel
  Scenario: If the records not available in ED and Open seller table, we have to cancel it in Seller table and delete date is (current date-1) and delete the same in position table also 
   Given Check the data populated fine or not after triggering model If the record not present in ed extract table
   
   @Scenario9SellerManagemodel
  Scenario: If the record is not in open seller table, we have to remove it in seller table 
   Given Test data setup with this data to be deleted or updated "DELETE FROM DBLFMSXR.FMST_O_SP_OPEN_SELLER WHERE OPEN_SELLER_CNUM ='#A2428897' WITH UR"
  Then Triggering the model through FMSV_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMST_O_SP_SELLER WHERE SELLER_CNUM ='#A2428897' AND DLET_DATE  IS NOT NULL WITH UR"
  
  
 
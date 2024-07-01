Feature: Seller Profile model -Seller Level Manage model Testing

 @Scenario12SellerLevelManagemodel
  Scenario: Validating seller record with Seller Elig table based upon the seller level,if its different then update it in Seller table
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMSV1_O_SP_SELLER SET SELLER_LEVEL_ID ='8' WHERE SELLER_ID =16 WITH UR"
  Then Triggering the Seller Level Manage model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER WHERE SELLER_ID='16' AND SELLER_LEVEL_ID ='4' WITH UR"
  
  @Scenario3SellerLevelManagemodel
  Scenario: Checking non executive records in elig table and test seller level id populated properly in seller table.
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMSV1_O_SP_SELLER SET SELLER_LEVEL_ID ='8' WHERE SELLER_ID =19 WITH UR"
  Then Triggering the Seller Level Manage model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER WHERE SELLER_ID='16' AND SELLER_LEVEL_ID ='1' WITH UR"
  
  
  @Scenario4SellerLevelManagemodel
  Scenario: make cancel for executive record and validate the seller level id in Seller table
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_ELIG SET APPR_STATUS ='Canceled' WHERE SELLER_ID =16 WITH UR"
  Then Triggering the Seller Level Manage model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER WHERE SELLER_ID='16' AND SELLER_LEVEL_ID ='1' WITH UR"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_ELIG SET APPR_STATUS ='Approved' WHERE SELLER_ID =16 WITH UR"
  
  @Scenario5SellerLevelManagemodel
  Scenario: Verify whether function mgmt table FLM details updated properly in seller table with seller id.
   Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMSV1_O_SP_SELLER SET SELLER_LEVEL_ID ='8' WHERE SELLER_ID =251 WITH UR"
  Then Triggering the Seller Level Manage model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER WHERE SELLER_ID='251' AND SELLER_LEVEL_ID ='2' WITH UR"
  
  @Scenario6SellerLevelManagemodel
  Scenario: Verify whether function mgmt table FLM details updated properly in seller table with seller id if we have status is canceled in fung mgmt table
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_FUNC_MGMT SET APPR_STATUS='Canceled' WHERE FM1_CNUM LIKE '%0416C8897%' WITH UR"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMSV1_O_SP_SELLER SET SELLER_LEVEL_ID ='8' WHERE SELLER_ID =251 WITH UR"
  Then Triggering the Seller Level Manage model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER WHERE SELLER_ID='251' AND SELLER_LEVEL_ID ='8' WITH UR"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_FUNC_MGMT SET APPR_STATUS='Approved' WHERE FM1_CNUM LIKE '%0416C8897%' WITH UR"
  
  @Scenario7SellerLevelManagemodel
  Scenario: Change FM1 as Fm2 and Fm2 as FM1 and check it in Seller table, the level id's are updated properly
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMSV1_O_SP_SELLER_FUNC_MGMT SET FM1_CNUM ='73264866',FM2_CNUM ='ZZ01C9826' WHERE SELLER_FUNC_MGMT_ID ='7583641'"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMSV1_O_SP_SELLER SET SELLER_LEVEL_ID ='8' WHERE SELLER_ID =585 WITH UR"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMSV1_O_SP_SELLER SET SELLER_LEVEL_ID ='8' WHERE SELLER_ID =596 WITH UR"
  Then Triggering the Seller Level Manage model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER WHERE SELLER_ID='596' AND SELLER_LEVEL_ID ='2' WITH UR"
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER WHERE SELLER_ID='585' AND SELLER_LEVEL_ID ='3' WITH UR"
  
  @Scenario8SellerLevelManagemodel
  Scenario: Verify Whether LM1 and Lm2 details levels updated properly in Seller table
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER SET SELLER_LEVEL_ID =5 WHERE SELLER_CNUM ='Z29222668'"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER SET SELLER_LEVEL_ID =5 WHERE SELLER_CNUM ='231885706'"
  Then Triggering the Seller Level Manage model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER WHERE SELLER_ID='206' AND SELLER_LEVEL_ID ='2' WITH UR"
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER WHERE SELLER_CNUM ='231885706' AND SELLER_LEVEL_ID ='3' WITH UR"
  
  @Scenario9SellerLevelManagemodel
  Scenario: Verify Whether Seller level id populated properly based upon open seller record.
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER SET SELLER_LEVEL_ID =5 WHERE SELLER_CNUM ='#A2428897'"
  Then Triggering the Seller Level Manage model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER WHERE SELLER_CNUM ='#A2428897' AND SELLER_LEVEL_ID ='2' WITH UR"
  
   @Scenario10SellerLevelManagemodel
   Scenario: Verify Whether The Entitle user table updated properly after model ran
   Given Test data setup with this data to be deleted or updated "DELETE FROM DBLFMSXR.ENTITLE_USER WHERE USER_CNUM ='#A2428897'"
   Then Triggering the Seller Level Manage model through FMST_O_SP_KAFKA_MSG table
   Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.ENTITLE_USER WHERE USER_CNUM ='#A2428897' WITH UR"
 
   @Scenario11SellerLevelManagemodel
  Scenario: Verify Whether The ENTITLE_SCOPE_EE_COPY updated properly after model ran
  Given Test data setup with this data to be deleted or updated "DELETE FROM DBLFMSXR.ENTITLE_SCOPE_EE_COPY WHERE EE_USER_ID = 28748 AND USER_ID =28748 AND EE_PLAN_APSK =0"
  Then Triggering the Seller Level Manage model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.ENTITLE_SCOPE_EE_COPY WHERE EE_USER_ID = 28748 AND USER_ID =28748 AND EE_PLAN_APSK =0"
 
  
  
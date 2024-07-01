Feature: Seller Profile model -Seller Level Manage model Testing

  @Scenario1SellerReconcilemodel
  Scenario: Seller profile record should be canceled when Seller is not eligible for that period
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMSV1_O_SP_SELLER_PROFILE SET DLET_DATE ='2024-06-30' WHERE SELLER_PROFILE_ID =912804 AND APPR_STATUS ='Approved' WITH UR"
    Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_ELIG SET DLET_DATE ='2024-03-31' WHERE SELLER_id=690 AND APPR_STATUS ='Approved' WITH UR"
  Then Triggering the Seller reconcile model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER_PROFILE WHERE SELLER_PROFILE_ID =912804  AND APPR_STATUS LIKE '%Canceled%' WITH UR"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_ELIG SET DLET_DATE =NULL WHERE SELLER_id=690 AND APPR_STATUS ='Approved' WITH UR"
  
    @Scenario2SellerReconcilemodel
  Scenario: Seller profile record should not be  canceled when Seller is  eligible for that period
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMSV1_O_SP_SELLER_PROFILE SET DLET_DATE ='2024-06-30' WHERE SELLER_PROFILE_ID =912804 AND APPR_STATUS ='Approved' WITH UR"
    Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_ELIG SET DLET_DATE ='2024-07-31' WHERE SELLER_id=690 AND APPR_STATUS ='Approved' WITH UR"
  Then Triggering the Seller reconcile model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER_PROFILE WHERE SELLER_PROFILE_ID =912804  AND APPR_STATUS LIKE '%Approved%' WITH UR"
  #Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_ELIG SET DLET_DATE =NULL WHERE SELLER_id=690 AND APPR_STATUS ='Approved' WITH UR"
  
  
    @Scenario3SellerReconcilemodel
  Scenario: Seller profile and ipl records should be canceled when Seller is not  eligible for that period
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMSV1_O_SP_SELLER_PROFILE SET DLET_DATE ='2024-06-30' WHERE SELLER_PROFILE_ID =885060 AND APPR_STATUS ='Approved' WITH UR"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_ELIG SET DLET_DATE ='2024-03-31' WHERE SELLER_id=690 AND APPR_STATUS ='Approved' WITH UR"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_IPL_LETTER SET APPR_STATUS ='Approved' WHERE SELLER_PROFILE_ID =885060 AND LATEST_VER_INDC ='1' ORDER BY CREATE_TIMESTAMP DESC LIMIT 1"
  Then Triggering the Seller reconcile model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT *  FROM DBLFMSXR.FMST_O_IPL_LETTER WHERE SELLER_PROFILE_ID =885060 AND APPR_STATUS ='Canceled' AND LATEST_VER_INDC ='1' ORDER BY CREATE_TIMESTAMP DESC LIMIT 1"
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER_PROFILE WHERE SELLER_PROFILE_ID =885060  AND APPR_STATUS LIKE '%Canceled%' WITH UR"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_ELIG SET DLET_DATE =NULL WHERE SELLER_id=690 AND APPR_STATUS ='Approved' WITH UR"
  
    @Scenario4SellerReconcilemodel
  Scenario: Seller profile and ipl records should be canceled when Seller is pending status in seller elig table
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMSV1_O_SP_SELLER_PROFILE SET DLET_DATE ='2024-06-30' WHERE SELLER_PROFILE_ID =885060 AND APPR_STATUS ='Approved' WITH UR"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_ELIG SET DLET_DATE ='2024-03-31' WHERE SELLER_id=690 AND APPR_STATUS ='Approved' WITH UR"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_IPL_LETTER SET APPR_STATUS ='Approved' WHERE SELLER_PROFILE_ID =885060 AND LATEST_VER_INDC ='1' ORDER BY CREATE_TIMESTAMP DESC LIMIT 1"
  Then Triggering the Seller reconcile model through FMST_O_SP_KAFKA_MSG table
  Then Check the data populated fine or not after triggering model "SELECT *  FROM DBLFMSXR.FMST_O_IPL_LETTER WHERE SELLER_PROFILE_ID =885060 AND APPR_STATUS ='Canceled' AND LATEST_VER_INDC ='1' ORDER BY CREATE_TIMESTAMP DESC LIMIT 1"
  Then Check the data populated fine or not after triggering model "SELECT * FROM DBLFMSXR.FMSV1_O_SP_SELLER_PROFILE WHERE SELLER_PROFILE_ID =885060  AND APPR_STATUS LIKE '%Canceled%' WITH UR"
  Given Test data setup with this data to be deleted or updated "UPDATE DBLFMSXR.FMST_O_SP_SELLER_ELIG SET DLET_DATE =NULL WHERE SELLER_id=690 AND APPR_STATUS ='Approved' WITH UR"
  
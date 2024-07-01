Feature: Eligibility Type Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lx-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/PRelig_type"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Eligibility Type Page
      
	@Scenario1eligtype
  Scenario: Verify Eligibility Type Page having all the fields all list_grid_card views
    And Check view having all the below fields
		|  Eligibility type  |   Eligibility description  |  Confirm eligibility days | Start date |  End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    |  Eligibility type  |   Eligibility description  |  Confirm eligibility days | Start date |  End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    |  Eligibility type  |   Eligibility description  |  Confirm eligibility days | Start date |  End date  |  Status  |
    
    
    @Scenario2eligtype
  Scenario Outline: Verify Add Edit and cancel working fine in Eligibility Type page
  Given delete the existing data in table "UPDATE DBLFMSXR.FMSV1_R_SP_ELIG_TYPE SET APPR_STATUS='Canceled' WHERE ELIG_TYPE ='L'"
  Given delete the existing data in table "UPDATE DBLFMSXR.FMSV1_R_SP_ELIG_TYPE SET APPR_STATUS='Canceled' WHERE ELIG_TYPE ='K'"
  Then add new record in Eligibility Type page with below values and check db "<Elig_type>""<Elig_description>""<Confirm_elig_days>""<Effective_Date>""<Delete_Date>""<QUERY>"
	Then Search for elig_type "2022 1H"
	Then check edit function is working fine for Elig type "K"
	Then Search for elig_type "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| Elig_type | Elig_description  |Confirm_elig_days  | Effective_Date|  Delete_Date |  QUERY  |
	| L | TEST | 90 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_SP_ELIG_TYPE|
	
	@Scenario3eligtype
  Scenario Outline: Verify Add Edit and cancel working fine in Eligibility type Page
 Given delete the existing data in table "UPDATE DBLFMSXR.FMSV1_R_SP_ELIG_TYPE SET APPR_STATUS='Canceled' WHERE ELIG_TYPE ='K'"
 Given delete the existing data in table "UPDATE DBLFMSXR.FMSV1_R_SP_ELIG_TYPE SET APPR_STATUS='Canceled' WHERE ELIG_TYPE ='L'"
  Then add new record in Eligibility Type page with below values and check db "<Elig_type>""<Elig_description>""<Confirm_elig_days>""<Effective_Date>""<Delete_Date>""<QUERY>"
	Then Search for elig_type "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
      |  Eligibility type  |   Eligibility description  |  Confirm eligibility days | Start date |  End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
     |  Eligibility type  |   Eligibility description  |  Confirm eligibility days | Start date |  End date  |  Status  |
  Examples:
	| Elig_type | Elig_description  |Confirm_elig_days  | Effective_Date|  Delete_Date |  QUERY  |
	| L | TEST | 90 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_SP_ELIG_TYPE|
	
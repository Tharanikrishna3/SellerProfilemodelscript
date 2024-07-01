Feature: Employee Type Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lx-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/PRemployee_type"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Employee Type Page
      
	@Scenario1emptype
  Scenario: Verify Employee Type Page having all the fields all list_grid_card views
    And Check view having all the below fields
		|   Employee type name  |   IPL indicator  |  Seller profile indicator | Start date |  End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    |   Employee type name  |   IPL indicator  |  Seller profile indicator | Start date |  End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    |   Employee type name  |   IPL indicator  |  Seller profile indicator | Start date |  End date  |  Status  |
    
    
    @Scenario2emptype
  Scenario Outline: Verify Add Edit and cancel working fine in Employee Type page
  Given delete the existing data in table "UPDATE DBLFMSXR.FMSV1_R_SP_EMPLOYEE_TYPE SET APPR_STATUS='Canceled' WHERE EMPLOYEE_TYPE ='K'"
  Then add new record in Employee Type page with below values and check db "<Employee_type>""<Employee_type_name>""<IPL_indicator>""<Seller_profile_indicator>""<Effective_Date>""<Delete_Date>""<QUERY>"
	Then Search for employee_type "2022 1H"
	Then check edit function is working fine for Emp type
	Then Search for ipl_status "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| Employee_type | Employee_type_name  |IPL_indicator  | Seller_profile_indicator | Effective_Date|  Delete_Date |  QUERY  |
	| K | TEST | 1 | 1 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_SP_EMPLOYEE_TYPE|
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in Employee type Page
  Given delete the existing data in table "UPDATE DBLFMSXR.FMSV1_R_SP_EMPLOYEE_TYPE SET APPR_STATUS='Canceled' WHERE EMPLOYEE_TYPE ='K'"
  Then add new record in Employee Type page with below values and check db "<Employee_type>""<Employee_type_name>""<IPL_indicator>""<Seller_profile_indicator>""<Effective_Date>""<Delete_Date>""<QUERY>"
	Then Search for employee_type "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
      |   Employee type name  |   IPL indicator  |  Seller profile indicator | Start date |  End date  |  Status  |
  Then check view history working properly  
   And Che	ck view having all the below fields 
     |   Employee type name  |   IPL indicator  |  Seller profile indicator | Start date |  End date  |  Status  | 
  Examples:
	| Employee_type | Employee_type_name  |IPL_indicator  | Seller_profile_indicator | Effective_Date|  Delete_Date |  QUERY  |
	| K | TEST | 1 | 1 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_SP_EMPLOYEE_TYPE|
	
Feature: Plan Length Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lx-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/PDplan_length"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Plan Length page
      
	@Scenario1PLPlanlength
  Scenario: Verify Plan Length page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Plan length name  |   Plan length months  |   Start Date  |  End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Plan length name  |   Plan length months  |   Start Date  |  End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Plan length name  |   Plan length months  |   Start Date  |  End date  |  Status  |
    
    
    @Scenario2PL
  Scenario Outline: Verify Add Edit and cancel working fine in Plan Length page
  Then add new record in Plan length page with below values and check db "<Plan_length_name>""<Plan_length_month>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list 
	Then Search for plan_method "2022 1H"
	Then check edit function is working fine for Plan length '12'
	Then Search for plan_method "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| Plan_length_name  |   Plan_length_month  |  Effective_Date  | Delete_Date  | QUERY |
	| Test | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_R_IPD_PLAN_LENGTH |
	
	@Scenario3PL
  Scenario Outline: Verify Add Edit and cancel working fine in Plan Length page
  Then add new record in Plan length page with below values and check db "<Plan_length_name>""<Plan_length_month>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list 
  Then Search for plan_method "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
    | Plan length name  |   Plan length months  |   Start Date  |  End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
   | Plan length name  |   Plan length months  |   Start Date  |  End date  |  Status  | 
  Examples:
	| Plan_length_name  |   Plan_length_month  |  Effective_Date  | Delete_Date  | QUERY |
	| Test | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_R_IPD_PLAN_LENGTH |
	
Feature: Territory Overlap Category verification

Background:
      Given User navigates to Home page "https://web-sfat-lx-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/PDplan_length"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Territory Overlap Category page
      
	@Scenario1PL
  Scenario: Verify Territory Overlap Category page having all the fields all list_grid_card views
    And Check view having all the below fields
		| PDT territory overlap category  |  TO rule code |  TO category name  | Start Date  |  End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | PDT territory overlap category  |  TO rule code |  TO category name  | Start Date  |  End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | PDT territory overlap category  |  TO rule code |  TO category name  | Start Date  |  End date  |  Status  |
    
    
    @Scenario2PL
  Scenario Outline: Verify Add Edit and cancel working fine in Territory Overlap Category page
  Then add new record in Territory Overlap Category page with below values and check db "<PDT_territory_overlap_category>""<TO_rule_code>""<TO_category_name>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list 
	Then Search for Territory_Overlap_Category "2022 1H"
	Then check edit function is working fine for Territory Overlap Category
	Then Search for Territory_Overlap_Category "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| PDT_territory_overlap_category  |   TO_rule_code  | TO_category_name  | Effective_Date  | Delete_Date  | QUERY |
	| Test | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_R_IPD_PLAN_LENGTH |
	
	@Scenario3PL
  Scenario Outline: Verify Add Edit and cancel working fine in Plan Length page
  Then add new record in Territory Overlap Category page with below values and check db "<PDT_territory_overlap_category>""<TO_rule_code>""<TO_category_name>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list 
  Then Search for Territory_Overlap_Category "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
    | PDT territory overlap category  |  TO rule code |  TO category name  | Start Date  |  End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | PDT territory overlap category  |  TO rule code |  TO category name  | Start Date  |  End date  |  Status  | 
  Examples:
	| PDT_territory_overlap_category  |   TO_rule_code  | TO_category_name  | Effective_Date  | Delete_Date  | QUERY |
	| Test | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_R_IPD_PLAN_LENGTH |
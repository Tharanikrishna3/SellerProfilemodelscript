Feature: PDT Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to PDT Page
      
	@Scenario1ipl
  Scenario: Verify PDT page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Leverage type |  Plan type  |  Elements  |   OTE  |  Plan length  | Effective  | Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Leverage type |  Plan type  |  Elements  |   OTE  |  Plan length  | Effective  | Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Leverage type |  Plan type  |  Elements  |   OTE  |  Plan length  | Effective  | Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in PDT page
  Then add new record in OTE  page with below values and check db "<Leverage_type>""<Plan_type>""<Elements>""<OTE>""<Plan_length>""<Effective_Date>"
  Then Moving to back to list 
	Then Search for ipl_status "2022 1H"
	Then check edit function is working fine for IPL status
  Examples:
	| Leverage_type  |   Plan_type  |  Elements  | Elements  | Plan_length  | Effective_Date |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in PDT  PAGE
  Then add new record in OTE  page with below values and check db "<Leverage_type>""<Plan_type>""<Elements>""<OTE>""<Plan_length>""<Effective_Date>"
  Then Moving to back to list  
  Then Search for ipl_status "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Leverage type |  Plan type  |  Elements  |   OTE  |  Plan length  | Effective  | Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Leverage type |  Plan type  |  Elements  |   OTE  |  Plan length  | Effective  | Status  |
  Examples:
	| Leverage_type  |   Plan_type  |  Elements  | Elements  | Plan_length  | Effective_Date |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
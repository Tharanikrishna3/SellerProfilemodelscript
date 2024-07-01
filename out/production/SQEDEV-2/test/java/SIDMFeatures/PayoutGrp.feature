Feature: Payout Group verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Payout Group Page
      
	@Scenario1ipl
  Scenario: Verify Payout Group page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Payout group name |  IE category code |  Start Date  |   End Date  | Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Payout group name |  IE category code |  Start Date  |   End Date  | Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Payout group name |  IE category code |  Start Date  |   End Date  | Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in Payout Group page
  Then add new record in Payout group page with below values and check db "<Payout_grp_name>""<IE_cat_code>""<Effective_Date>""End_date>"
  Then Moving to back to list 
	Then Search for Payout_grp "2022 1H"
	Then check edit function is working fine for Payout Group page
  Examples:
	| Payout_grp_name  |   IE_cat_code  |  Effective_Date  | End_date  | 
	| K | 06 | 2022-01-01  |  2022-06-30   | 
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in Payout Group Page
  Then add new record in Payout group page with below values and check db "<Payout_grp_name>""<IE_cat_code>""<Effective_Date>""End_date>"
  Then Moving to back to list  
  Then Search for Payout_grp "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Payout group name |  IE category code |  Start Date  |   End Date  | Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Payout group name |  IE category code |  Start Date  |   End Date  | Status  |
   Examples:
	| Payout_grp_name  |   IE_cat_code  |  Effective_Date  | End_date  | 
	| K | 06 | 2022-01-01  |  2022-06-30   | 
	
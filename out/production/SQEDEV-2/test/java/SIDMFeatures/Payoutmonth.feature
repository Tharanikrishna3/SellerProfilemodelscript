Feature: Payout Month verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Payout Month Page
      
	@Scenario1ipl
  Scenario: Verify Payout Month page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Payout Month |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Payout Month |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Payout Month |  Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in Payout Month page
  Then add new record in Payout Month page with below values and check db "<Payout_month>"
  Then Moving to back to list 
	Then Search for Payout_Month "2022 1H"
	Then check edit function is working fine for Payout Month page
  Examples:
	| Payout_month  | 
	| K | 
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in Payout Month Page
  Then add new record in Payout Month page with below values and check db "<Payout_month>"
  Then Moving to back to list  
  Then Search for Payout_month "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Payout Month |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Payout Month |  Status  |
     Examples:
	| Payout_month  | 
	| K | 
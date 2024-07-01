Feature: Payout Country verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Payout Country Page
      
	@Scenario1ipl
  Scenario: Verify Payout Country page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Payout Country |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Payout Country |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Payout Country |  Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in Payout Country page
  Then add new record in Payout Country page with below values and check db "<Payout_country>"
  Then Moving to back to list 
	Then Search for Payout_Country "2022 1H"
	Then check edit function is working fine for Payout Country page
  Examples:
	| Payout_country  | 
	| K | 
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in Payout Country Page
  Then add new record in Payout Country page with below values and check db "<Payout_country>"
  Then Moving to back to list  
  Then Search for Payout_country "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Payout Country |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Payout Country |  Status  |
     Examples:
	| Payout_country  | 
	| K | 
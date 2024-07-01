Feature: Payout Curve Link Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Payout Curve Link Page
      
	@Scenario1ipl
  Scenario: Verify Payout Curve Link page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Payout Curve | 	Measurement Set | Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Payout Curve | 	Measurement Set | Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Payout Curve | 	Measurement Set | Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in Payout Curve Link page
  Then add new record in Payout Curve Link page with below values and check db "<Payout_curve>""<Measurement_set>"
  Then Moving to back to list 
	Then Search for Payout_Curve_link "2022 1H"
	Then check edit function is working fine for Payout Curve Link page
  Examples:
	| Payout_curve  |   Measurement_set  |  
	| K | 06 |  
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in Payout Curve Link Page
  Then add new record in Payout Curve Link page with below values and check db "<Min_quota_amt>""<Max_Quota_amt>""<Payout_table>"
  Then Moving to back to list  
  Then Search for Payout_Curve_link "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Payout Curve | 	Measurement Set | Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Payout Curve | 	Measurement Set | Status  |
    Examples:
	| Payout_curve  |   Measurement_set  |  
	| K | 06 |
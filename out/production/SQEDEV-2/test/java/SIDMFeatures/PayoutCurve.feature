Feature: Payout Curve verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Payout Curve Page
      
	@Scenario1ipl
  Scenario: Verify Payout Curve page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Payout Curve Name | Calculation Type |  Ref Incentive Element Position |  Ref Measurement Definition Category | Start date  | End date  | Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Payout Curve Name | Calculation Type |  Ref Incentive Element Position |  Ref Measurement Definition Category | Start date  | End date  | Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Payout Curve Name | Calculation Type |  Ref Incentive Element Position |  Ref Measurement Definition Category | Start date  | End date  | Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in Payout Curve page
  Then add new record in Payout Curve page with below values and check db "<Payout_Curve_name>""<Calculation_type>""<Ref_incentive_element_position>""<Ref_measurement_def_category>""<Start_Date>""<End_date>"
  Then Moving to back to list 
	Then Search for Payout_Curve "2022 1H"
	Then check edit function is working fine for Payout Curve page
  Examples:
	| Payout_Curve_name  |   Calculation_type  |  Ref_incentive_element_position  | Ref_measurement_def_category | Start_Date  | End_date  | 
	| K | 06 | 2022-01-01  |  2022-06-30   | 
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in Payout Curve Page
  Then add new record in Payout Curve page with below values and check db "<Payout_Curve_name>""<Calculation_type>""<Ref_incentive_element_position>""<Ref_measurement_def_category>""<Start_Date>""<End_date>"
  Then Moving to back to list  
  Then Search for Payout_curve "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Payout Curve Name | Calculation Type |  Ref Incentive Element Position |  Ref Measurement Definition Category | Start date  | End date  | Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Payout Curve Name | Calculation Type |  Ref Incentive Element Position |  Ref Measurement Definition Category | Start date  | End date  | Status  |
    Examples:
	| Payout_Curve_name  |   Calculation_type  |  Ref_incentive_element_position  | Ref_measurement_def_category | Start_Date  | End_date  | 
	| K | 06 | 2022-01-01  |  2022-06-30   |  
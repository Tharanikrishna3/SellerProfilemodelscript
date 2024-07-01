Feature: Payout Calc verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Payout Calc Page
      
	@Scenario1ipl
  Scenario: Verify Payout Calc page having all the fields all list_grid_card views
    And Check view having all the below fields
		|Payout Calc Sequence|Payout Calc Name|Quota Calc Period|TI Calc Period|Min Percentage Achieved|Min Calc Period|Max Percentage Achieved|Max Calc Period|FP Subtract Percentage|Payout Factor|FP Add Percentage|Max FP Percentage Achieved|Payout Rate|Payout Tier|Commission Adjustment Amount|Ref Min Percentage Achieved|Ref Max Percentage Achieved|Min Achieved Amount|Max Achieved Amount|Status|
    Then Navigate to Grid view 
    And Check view having all the below fields 
    |Payout Calc Sequence|Payout Calc Name|Quota Calc Period|TI Calc Period|Min Percentage Achieved|Min Calc Period|Max Percentage Achieved|Max Calc Period|FP Subtract Percentage|Payout Factor|FP Add Percentage|Max FP Percentage Achieved|Payout Rate|Payout Tier|Commission Adjustment Amount|Ref Min Percentage Achieved|Ref Max Percentage Achieved|Min Achieved Amount|Max Achieved Amount|Status|
    Then Navigate to Card view
    And Check view having all the below fields 
    |Payout Calc Sequence|Payout Calc Name|Quota Calc Period|TI Calc Period|Min Percentage Achieved|Min Calc Period|Max Percentage Achieved|Max Calc Period|FP Subtract Percentage|Payout Factor|FP Add Percentage|Max FP Percentage Achieved|Payout Rate|Payout Tier|Commission Adjustment Amount|Ref Min Percentage Achieved|Ref Max Percentage Achieved|Min Achieved Amount|Max Achieved Amount|Status|
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in Payout Calc page
  Then add new record in Payout Calc page with below values and check db "<Payout_Curve_name>""<Calculation_type>""<Ref_incentive_element_position>""<Ref_measurement_def_category>""<Start_Date>""<End_date>"
  Then Moving to back to list 
	Then Search for Payout_Calc "2022 1H"
	Then check edit function is working fine for Payout Calc page
  Examples:
	| Payout_Curve_name  |   Calculation_type  |  Ref_incentive_element_position  | Ref_measurement_def_category | Start_Date  | End_date  | 
	| K | 06 | 2022-01-01  |  2022-06-30   | 
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in Payout Calc Page
  Then add new record in Payout Calc page with below values and check db "<Payout_Curve_name>""<Calculation_type>""<Ref_incentive_element_position>""<Ref_measurement_def_category>""<Start_Date>""<End_date>"
  Then Moving to back to list  
  Then Search for Payout_calc "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     |Payout Calc Sequence|Payout Calc Name|Quota Calc Period|TI Calc Period|Min Percentage Achieved|Min Calc Period|Max Percentage Achieved|Max Calc Period|FP Subtract Percentage|Payout Factor|FP Add Percentage|Max FP Percentage Achieved|Payout Rate|Payout Tier|Commission Adjustment Amount|Ref Min Percentage Achieved|Ref Max Percentage Achieved|Min Achieved Amount|Max Achieved Amount|Status|
  Then check view history working properly  
   And Check view having all the below fields 
    |Payout Calc Sequence|Payout Calc Name|Quota Calc Period|TI Calc Period|Min Percentage Achieved|Min Calc Period|Max Percentage Achieved|Max Calc Period|FP Subtract Percentage|Payout Factor|FP Add Percentage|Max FP Percentage Achieved|Payout Rate|Payout Tier|Commission Adjustment Amount|Ref Min Percentage Achieved|Ref Max Percentage Achieved|Min Achieved Amount|Max Achieved Amount|Status|
    Examples:
	| Payout_Curve_name  |   Calculation_type  |  Ref_incentive_element_position  | Ref_measurement_def_category | Start_Date  | End_date  | 
	| K | 06 | 2022-01-01  |  2022-06-30   |  
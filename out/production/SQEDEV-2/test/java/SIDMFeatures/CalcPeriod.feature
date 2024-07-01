Feature: Calc Type Page verification

Background:
      Given User navigates to Home page ""
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Calc Type Page
      
	@Scenario1sm
  Scenario: Verify Calc Type Page page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Calculation name  |   Calculation type  |   Start date  |  	End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Calculation name  |   Calculation type  |   Start date  |  	End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Calculation name  |   Calculation type  |   Start date  |  	End date  |  Status  |
    
    
    @Scenario2sm
  Scenario Outline: Verify Add Edit and cancel working fine in Calc Type Page
  Then add new record in Calc Type page with below values "<Calc_name>""<Calc_type>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then check Db having all datas ""
	Then Search button click "2022 1H"
	Then check edit function is working fine "L"
	Then Search button click "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| Calc_name  |   Calc_type  |  Effective_Date  | Delete_Date  |
	
	
	@Scenario3sm
  Scenario Outline: Verify Add Edit and cancel working fine in Calc Type page
  Then add new record in Calc Type page with below values "<Calc_Period_Name>""<Calc_Period_code>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then Search button click "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
    | Calculation name  |   Calculation type  |   Start date  |  	End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Calculation name  |   Calculation type  |   Start date  |  	End date  |  Status  |
  Examples:
	| Calc_name  |   Calc_type  |  Effective_Date  | Delete_Date  |
	
	
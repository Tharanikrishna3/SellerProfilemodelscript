Feature: Calc Period Page verification

Background:
      Given User navigates to Home page ""
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Calc Period Page
      
	@Scenario1sm
  Scenario: Verify Calc Period Page page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Calc Period Name  |   Calc Period Code  |   Start date  |  	End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Calc Period Name  |   Calc Period Code  |   Start date  |  	End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Calc Period Name  |   Calc Period Code  |   Start date  |  	End date  |  Status  |
    
    
    @Scenario2sm
  Scenario Outline: Verify Add Edit and cancel working fine in Calc Period Page
  Then add new record in Calc Period page with below values "<Calc_Period_Name>""<Calc_Period_code>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then check Db having all datas ""
	Then Search button click "2022 1H"
	Then check edit function is working fine "L"
	Then Search button click "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| Calc_Period_Name  |   Calc_Period_code  |  Effective_Date  | Delete_Date  |
	
	
	@Scenario3sm
  Scenario Outline: Verify Add Edit and cancel working fine in Salary method page
  Then add new record in Calc Period page with below values "<Calc_Period_Name>""<Calc_Period_code>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then Search button click "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
    | Calc Period Name  |   Calc Period Code  |   Start date  |  	End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Calc Period Name  |   Calc Period Code  |   Start date  |  	End date  |  Status  |
  Examples:
	| Calc_Period_Name  |   Calc_Period_code  |  Effective_Date  | Delete_Date  |
	
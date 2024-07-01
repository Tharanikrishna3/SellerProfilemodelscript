Feature: Incentive Element verification

Background:
      Given User navigates to Home page ""
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Incentive Element
	@Scenario1sm
  Scenario: Verify Incentive Element  page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Position| Description  |  Type  |  Weight  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Position| Description  |  Type  |  Weight  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Position| Description  |  Type  |  Weight  |  Status  |
    
    
    @Scenario2sm
  Scenario Outline: Verify Add Edit and cancel working fine in Incentive element page
  Then add new record in Incentive Element page with below values "<Position>""<Description>""<Type>""<Weight>"
  Then Moving to back to list 
  Then check Db having all datas ""
	Then Search button click "2022 1H"
	Then check edit function is working fine "L"
	Then Search button click "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| Position  |   Description  |  Type  |  Weight | 
	
	
	@Scenario3sm
  Scenario Outline: Verify Add Edit and cancel working fine in Incentive element page
  Then add new record in Incentive Element page with below values "<Position>""<Description>""<Type>""<Weight>"
  Then Moving to back to list 
  Then Search button click "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Position| Description  |  Type  |  Weight  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
     | Position| Description  |  Type  |  Weight  |  Status  |
  Examples:
	| Position  |   Description  |  Type  |  Weight | 
	
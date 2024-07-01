Feature: Incentive Element Description Page verification

Background:
      Given User navigates to Home page ""
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Incentive Element Description
	@Scenario1sm
  Scenario: Verify Incentive Element Description Page having all the fields all list_grid_card views
    And Check view having all the below fields
		| IE description |   		IE long description  | Start date  |  	End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
   | IE description |   		IE long description  | Start date  |  	End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | IE description |   		IE long description  | Start date  |  	End date  |  Status  |
    
    
    @Scenario2sm
  Scenario Outline: Verify Add Edit and cancel working fine in Incentive element Category page
  Then add new record in Calc Basis page with below values "<IE_description>""<IE_long_description>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then check Db having all datas ""
	Then Search button click "2022 1H"
	Then check edit function is working fine "L"
	Then Search button click "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| IE_description  |   IE_long_description  |Effective_Date  | Delete_Date  |
	
	
	@Scenario3sm
  Scenario Outline: Verify Add Edit and cancel working fine in Incentive element Category page
  Then add new record in Calc Basis page with below values "<IE_description>""<IE_long_description>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then Search button click "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
    | IE description |   		IE long description  | Start date  |  	End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
     | IE description |   		IE long description  | Start date  |  	End date  |  Status  |
  Examples:
	| IE_description  |   IE_long_description  |Effective_Date  | Delete_Date  |
	
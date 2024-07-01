Feature: Incentive Element Position Page verification

Background:
      Given User navigates to Home page ""
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Incentive Element Position
	@Scenario1sm
  Scenario: Verify Incentive Element Position page having all the fields all list_grid_card views
    And Check view having all the below fields
		| IE code |   IE ID  | IE position name |  	IPL IE sequence  | Main Element Indicator | Start date  |  	End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | IE code |   IE ID  | IE position name |  	IPL IE sequence  | Main Element Indicator | Start date  |  	End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | IE code |   IE ID  | IE position name |  	IPL IE sequence  | Main Element Indicator | Start date  |  	End date  |  Status  |
    
    
    @Scenario2sm
  Scenario Outline: Verify Add Edit and cancel working fine in Incentive element Position pagemain_ele
  Then add new record in Incentive Ele Position page with below values "<IE_ID>""<IE_code>""<IE_Position_name>""<IPL_IE_seq>""<Main_ele_ind>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then check Db having all datas ""
	Then Search button click "2022 1H"
	Then check edit function is working fine "L"
	Then Search button click "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| IE_ID  |   IE_code  |  IE_Position_name  |  IPL_IE_seq |  Main_ele_ind  |Effective_Date  | Delete_Date  |
	
	
	@Scenario3sm
  Scenario Outline: Verify Add Edit and cancel working fine in Incentive element Poistion page
   Then add new record in Incentive Ele Position page with below values "<IE_ID>""<IE_code>""<IE_Position_name>""<IPL_IE_seq>""<Main_ele_ind>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then Search button click "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
      | IE code |   IE ID  | IE position name |  	IPL IE sequence  | Main Element Indicator | Start date  |  	End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
      | IE code |   IE ID  | IE position name |  	IPL IE sequence  | Main Element Indicator | Start date  |  	End date  |  Status  |
  Examples:
	| IE_ID  |   IE_code  |  IE_Position_name  |  IPL_IE_seq |  Main_ele_ind  |Effective_Date  | Delete_Date  |
	
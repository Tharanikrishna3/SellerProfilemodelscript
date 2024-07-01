Feature: Lock Quota Page verification

Background:
      Given User navigates to Home page ""
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Lock Quota
	@Scenario1sm
  Scenario: Verify Lock Quota Page page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Lock quota name|   	Lock quota code  | 	Start Date |  	End Date  |  Status | 
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Lock quota name|   	Lock quota code  | 	Start Date |  	End Date  |  Status | 
    Then Navigate to Card view
    And Check view having all the below fields 
    | Lock quota name|   	Lock quota code  | 	Start Date |  	End Date  |  Status | 
    
    
    @Scenario2sm
  Scenario Outline: Verify Add Edit and cancel working fine in Lock Quota Page
  Then add new record in Lock Quota page with below values "<Lock_quota_name>""<Lock_quota_code>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then check Db having all datas ""
	Then Search button click "2022 1H"
	Then check edit function is working fine "L"
	Then Search button click "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| Lock_quota_name  |   Lock_quota_code  |Effective_Date  | Delete_Date  |
	
	
	@Scenario3sm
  Scenario Outline: Verify Add Edit and cancel working fine in Lock Quota Page
   Then add new record in Lock Quota page with below values "<Lock_quota_name>""<Lock_quota_code>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then Search button click "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Lock quota name|   	Lock quota code  | 	Start Date |  	End Date  |  Status | 
  Then check view history working properly  
   And Check view having all the below fields 
     | Lock quota name|   	Lock quota code  | 	Start Date |  	End Date  |  Status | 
    Examples:
	| Lock_quota_name  |   Lock_quota_code  |Effective_Date  | Delete_Date  |
	
Feature: Incentive Element Type Page verification

Background:
      Given User navigates to Home page ""
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Incentive Element Type
	@Scenario1sm
  Scenario: Verify Incentive Element Type Page page having all the fields all list_grid_card views
    And Check view having all the below fields
		|IE type name|IE category|  IE Period  |  Calculation type  |  IE weight display  |  Default Quota Indicator  |  Lock quota  |  Salary method  |  Start Date  | End Date  | Status |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    |IE type name|IE category|  IE Period  |  Calculation type  |  IE weight display  |  Default Quota Indicator  |  Lock quota  |  Salary method  |  Start Date  | End Date  | Status |
    Then Navigate to Card view
    And Check view having all the below fields 
    |IE type name|IE category|  IE Period  |  Calculation type  |  IE weight display  |  Default Quota Indicator  |  Lock quota  |  Salary method  |  Start Date  | End Date  | Status |
    
    
    @Scenario2sm
  Scenario Outline: Verify Add Edit and cancel working fine in Incentive element Type page
  Then add new record in Incentive Ele type page with below values "<IE_type_name>""<IE_category>""<IE_period>""<Calc_type>""<IE_weight_display>""<DEfaukt_quota_ind>""<Lock_quota>""<salary_method>""<Effective_Date>""<Delete_Date>""<default_base_quota>""<Dafault_quota>""<Netnewele>""<reqoppinterritory>""<Teamsize>"
  Then Moving to back to list 
  Then check Db having all datas ""
	Then Search button click "2022 1H"
	Then check edit function is working fine "L"
	Then Search button click "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| IE_type_name  |   IE_category  |  IE_period  |  Calc_type |  IE_weight_display  |  DEfaukt_quota_ind  |  Lock_quota  |salary_method  | Effective_Date  |  Delete_Date |  default_base_quota  |  Dafault_quota  |  Netnewele  |  reqoppinterritory  |  Teamsize  |
	
	 
	@Scenario3sm
  Scenario Outline: Verify Add Edit and cancel working fine in Incentive element Type page
  Then add new record in Incentive Ele type page with below values "<IE_type_name>""<IE_category>""<IE_period>""<Calc_type>""<IE_weight_display>""<DEfaukt_quota_ind>""<Lock_quota>""<salary_method>""<Effective_Date>""<Delete_Date>""<default_base_quota>""<Dafault_quota>""<Netnewele>""<reqoppinterritory>""<Teamsize>"
  Then Moving to back to list 
  Then Search button click "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     |IE type name|IE category|  IE Period  |  Calculation type  |  IE weight display  |  Default Quota Indicator  |  Lock quota  |  Salary method  |  Start Date  | End Date  | Status |
  Then check view history working properly  
   And Check view having all the below fields 
     |IE type name|IE category|  IE Period  |  Calculation type  |  IE weight display  |  Default Quota Indicator  |  Lock quota  |  Salary method  |  Start Date  | End Date  | Status |
  Examples:
	| IE_type_name  |   IE_category  |  IE_period  |  Calc_type |  IE_weight_display  |  DEfaukt_quota_ind  |  Lock_quota  |salary_method  | Effective_Date  |  Delete_Date |  default_base_quota  |  Dafault_quota  |  Netnewele  |  reqoppinterritory  |  Teamsize  |
	
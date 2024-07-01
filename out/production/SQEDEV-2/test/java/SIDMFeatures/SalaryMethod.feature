Feature: Salary Method Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lx-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/PDsalary_method"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Salary method page
      
	@Scenario1smk
  Scenario: Verify Salary method page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Salary method code  |   Salary method name  |   Effective Date  |  Delete date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Salary method code  |   Salary method name  |   Effective Date  |  Delete date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Salary method code  |   Salary method name  |   Effective Date  |  Delete date  |  Status  |
    
    
    @Scenario2sm
  Scenario Outline: Verify Add Edit and cancel working fine in Salary method page
  Given delete the existing data in table "UPDATE DBLFMSXR.FMST_R_IPD_SALARY_METHOD SET APPR_STATUS='Canceled' WHERE SALARY_METHOD_CD ='L'"
  Then add new record in salary method page with below values "<Salary_method_code>""<Salary_method_name>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then check Db having all datas "SELECT SALARY_METHOD_CD FROM DBLFMSXR.FMST_R_IPD_SALARY_METHOD WHERE SALARY_METHOD_CD='L' AND APPR_STATUS='APPROVED'"
	Then Search button click "2022 1H"
	Then check edit function is working fine "L","Testcheck"
	Then Search button click "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| Salary_method_code  |   Salary_method_name  |  Effective_Date  | Delete_Date  |
	| L | Actual to end of period (C) | 2022-01-01  |  2022-06-30   |
	
	@Scenario3sm
  Scenario Outline: Verify Add Edit and cancel working fine in Salary method page
  Given delete the existing data in table "UPDATE DBLFMSXR.FMST_R_IPD_SALARY_METHOD SET APPR_STATUS='Canceled' WHERE SALARY_METHOD_CD ='L'"
  Then add new record in salary method page with below values "<Salary_method_code>""<Salary_method_name>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then Search button click "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
    | Salary method code  |   Salary method name  |   Effective Date  |  Delete date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Salary method code  |   Salary method name  |   Effective Date  |  Delete date  |  Status  | 
  Examples:
	| Salary_method_code  |   Salary_method_name  |  Effective_Date  | Delete_Date  |
	| L | Actual to end of period (C) | 2022-01-01  |  2022-06-30   |
	
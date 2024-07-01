Feature: Scenario Period Page verification

Background:
      Given User navigates to Home page ""
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Salary Period page
      
	@Scenario1sm
  Scenario: Verify Scenario Period page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Scenario Period Code  |   Scenario Period Name  |   Start date |  End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Scenario Period Code  |   Scenario Period Name  |   Start date |  End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Scenario Period Code  |   Scenario Period Name  |   Start date |  End date  |  Status  |
    
    
    @Scenario2sm
  Scenario Outline: Verify Add Edit and cancel working fine in Scenario Period page
  Then add new record in Scenario method page with below values "<Salary_Period_code>""<Salary_Period_name>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then check Db having all datas "SELECT SALARY_METHOD_CD FROM DBLFMSXR.FMST_R_IPD_SALARY_METHOD WHERE SALARY_METHOD_CD='L' AND APPR_STATUS='APPROVED'"
	Then Search button click "2022 1H"
	Then check edit function is working fine "L","Testcheck"
	Then Search button click "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| Salary_Period_code  |   Salary_Period_name  |  Effective_Date  | Delete_Date  |
	| L | Actual to end of period (C) | 2022-01-01  |  2022-06-30   |
	
	@Scenario3sm
  Scenario Outline: Verify Add Edit and cancel working fine in Scenario Period page
  Then add new record in Scenario method page with below values "<Salary_Period_code>""<Salary_Period_name>""<Effective_Date>""<Delete_Date>"
  Then Moving to back to list 
  Then Search button click "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
    | Scenario Period Code  |   Scenario Period Name  |   Start date |  End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Scenario Period Code  |   Scenario Period Name  |   Start date |  End date  |  Status  |
 Examples:
	| Salary_Period_code  |   Salary_Period_name  |  Effective_Date  | Delete_Date  |
	| L | Actual to end of period (C) | 2022-01-01  |  2022-06-30   |
	
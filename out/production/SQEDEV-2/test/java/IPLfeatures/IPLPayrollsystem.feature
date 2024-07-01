Feature: IPL Payroll System Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to IPL Payroll System PAGE
      
	@Scenario1ipl
  Scenario: Verify IPL Payroll System page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Payroll System Id |   Payroll System Description  |   Start Date  |  End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Payroll System Id |   Payroll System Description  |   Start Date  |  End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Payroll System Id |   Payroll System Description  |   Start Date  |  End date  |  Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in IPL Payroll System PAGE
  Then add new record in IPL Payroll System page with below values and check db "<Payroll_system_id>""<Payroll_system_desc>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list 
	Then Search for ipl_payroll "2022 1H"
	Then check edit function is working fine for IPL Payroll System
  Examples:
	| Payroll_system_id  |   Payroll_system_desc  |  Effective_Date  | Delete_Date  | QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in IPL Payroll System PAGE
  Then add new record in IPL Payroll System page with below values and check db "<Payroll_system_id>""<Payroll_system_desc>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list  
  Then Search for ipl_payroll "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Payroll System Id |   Payroll System Description  |   Start Date  |  End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Payroll System Id |   Payroll System Description  |   Start Date  |  End date  |  Status  |
  Examples:
	| Payroll_system_id  |   Payroll_system_desc  |  Effective_Date  | Delete_Date  | QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
Feature: IPL Status Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to IPL STATUS PAGE
      
	@Scenario1ipl
  Scenario: Verify IPL STATUS page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Status Cd  |   Status Desc  |   Start Date  |  End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Status Cd  |   Status Desc  |   Start Date  |  End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Status Cd  |   Status Desc  |   Start Date  |  End date  |  Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in IPL STATUS PAGE
  Then add new record in IPL STATUS page with below values and check db "<Status_Cd>""<Status_Desc>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list 
	Then Search for ipl_status "2022 1H"
	Then check edit function is working fine for IPL status
  Examples:
	| Status_Cd  |   Status_Desc  |  Effective_Date  | Delete_Date  | QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in IPL STATUS PAGE
  Then add new record in IPL STATUS page with below values and check db "<Status_Cd>""<Status_Desc>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list  
  Then Search for ipl_status "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Status Cd  |   Status Desc  |   Start Date  |  End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Status Cd  |   Status Desc  |   Start Date  |  End date  |  Status  | 
  Examples:
	| Status_Cd  |   Status_Desc  |  Effective_Date  | Delete_Date  | QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	 @Scenario4ipl
  Scenario Outline: Verify  cancel working fine in IPL STATUS PAGE
  Then add new record in IPL STATUS page with below values and check db "<Status_Cd>""<Status_Desc>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list 
	Then Search for ipl_status "2022 1H"
	Then check cancel functionality working fine
  Examples:
	| Status_Cd  |   Status_Desc  |  Effective_Date  | Delete_Date  | QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
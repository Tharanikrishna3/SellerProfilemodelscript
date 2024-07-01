Feature: NLS User Prefrence Key Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to NLS User Prefrence Key PAGE
      
	@Scenario1ipl
  Scenario: Verify NLS User Prefrence Key page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Function  |   Business Key Column  |   Description Column |  Start Date  | End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Function  |   Business Key Column  |   Description Column |  Start Date  | End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Function  |   Business Key Column  |   Description Column |  Start Date  | End date  |  Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add and Edit working fine in NLS Reference  Page
  Then add new record in NLS Reference page with below values and check db "<Function>""<Business_Key_Column>""<Description_column>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list 
	Then Search for NLS_Reference "2022 1H"
	Then check edit function is working fine for NLS Reference
  Examples:
	| Function  |   Business_Key_Column  | Description_column  |  Effective_Date  | Delete_Date  | QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in NLS Reference
   Then add new record in NLS Reference page with below values and check db "<Function>""<Business_Key_Column>""<Description_column>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list  
  Then Search for NLS_Reference "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Function  |   Business Key Column  |   Description Column |  Start Date  | End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Function  |   Business Key Column  |   Description Column |  Start Date  | End date  |  Status  |
   Examples:
	| Function  |   Business_Key_Column  | Description_column  |  Effective_Date  | Delete_Date  | QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
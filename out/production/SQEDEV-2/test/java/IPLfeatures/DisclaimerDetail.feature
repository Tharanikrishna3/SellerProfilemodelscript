Feature: Disclaimer Detail Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Disclaimer Detail
      
	@Scenario1ipl
  Scenario: Verify Disclaimer Detail page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Disclaimer  |  Language |  Disclaimer Text  | Start Date  |  End date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Disclaimer  |  Language |  Disclaimer Text  | Start Date  |  End date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Disclaimer  |  Language |  Disclaimer Text  | Start Date  |  End date  |  Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in Disclaimer Detail Page
  Then add new record in Disclaimer Detail page with below values and check db "<Disclaimer>""<Language	>""<Disclaimer_text>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list 
	Then Search for disclaimer_detail "2022 1H"
	Then check edit function is working fine for Disclaimer Detail
  Examples:
	| Disclaimer  |   Language  |  Disclaimer_text  | Effective_Date  |  Delete_Date  | QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
	@Scenario3ipl
  Scenario Outline: Verify View and View History screen working fine in Disclaimer DetailPAge
  Then add new record in Disclaimer Detail page with below values and check db "<Disclaimer>""<Language	>""<Disclaimer_text>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list  
  Then Search for disclaimer_detail "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Disclaimer  |  Language |  Disclaimer Text  | Start Date  |  End date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Disclaimer  |  Language |  Disclaimer Text  | Start Date  |  End date  |  Status  |
  Examples:
	| Disclaimer  |   Language  |  Disclaimer_text  | Effective_Date  |  Delete_Date  | QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
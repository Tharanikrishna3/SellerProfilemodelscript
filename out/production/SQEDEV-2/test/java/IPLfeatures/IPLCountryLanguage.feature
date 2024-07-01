Feature: IPL Country Language Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to IPL Country Language PAGE
      
	@Scenario1iplcountrylang
  Scenario: Verify IPL Country Language page having all the fields all list_grid_card views
    And Check view having all the below fields
		|  Language  | Country default |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    |  Language  | Country default |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    |  Language  | Country default |  Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in IPL Country Language PAGE
  Then add new record in IPL Country Language page with below values and check db "<Language>""<Country_default>""<Status>"
  Then Moving to back to list 
	Then Search for ipl_Country_Language "2022 1H"
	Then check edit function is working fine for IPL Country Language
  Examples:
	| Language  |   Country_default  |  Status  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in IPL Conutry Language PAGE
 Then add new record in IPL Country Language page with below values and check db "<Language>""<Country_default>""<Status>"
  Then Moving to back to list  
  Then Search for ipl_Country_Language "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
    |  Language  | Country default |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
     |  Language  | Country default |  Status  |
  Examples:
	| Language  |   Country_default  |  Status  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
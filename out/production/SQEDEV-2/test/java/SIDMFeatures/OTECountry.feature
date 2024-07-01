Feature: OTE Country Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to OTE Country Page
      
	@Scenario1ipl
  Scenario: Verify OTE Country page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Country | Seller level  | OTE percent  | Paymix base percent  |  Paymix TI percent | Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Country | Seller level  | OTE percent  | Paymix base percent  |  Paymix TI percent | Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Country | Seller level  | OTE percent  | Paymix base percent  |  Paymix TI percent | Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in OTE Country page
  Then add new record in OTE Country page with below values and check db "<Country>""<Seller_level>""<OTE_percent>""<Paymix_base_percent>""<Paymix_TI_Percent>"
  Then Moving to back to list 
	Then Search for OTE_country_page "2022 1H"
	Then check edit function is working fine for OTE Country page
  Examples:
	| Country  |   Seller_level  |  OTE_percent  | Paymix_base_percent  | Paymix_TI_Percent  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in OTE Conutry PAGE
  Then add new record in OTE Country page with below values and check db "<Conutry>""<Seller_level>""<OTE_percent>""<Paymix_base_percent>""<Paymix-TI_Percent>""<Status>"
  Then Moving to back to list  
  Then Search for ipl_status "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Country | Seller level  | OTE percent  | Paymix base percent  |  Paymix TI percent | Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Country | Seller level  | OTE percent  | Paymix base percent  |  Paymix TI percent | Status  |
  Examples:
	| Country  |   Seller_level  |  OTE_percent  | Paymix_base_percent  | Paymix_TI_Percent  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
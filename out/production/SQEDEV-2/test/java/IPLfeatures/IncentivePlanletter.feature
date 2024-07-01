Feature: Incentive Plan letter Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Incentive Plan Letter PAGE
      
	@Scenario1ipl
  Scenario: Verify IPL page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Seller Name |  Organization  |   Sales Role |  Manager  |  Start date  |  End date  |  Status |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Seller Name |  Organization  |   Sales Role |  Manager  |  Start date  |  End date  |  Status |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Seller Name |  Organization  |   Sales Role |  Manager  |  Start date  |  End date  |  Status |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add  and Edit working fine in IPL PAGE
  Then add new record in IPL page with below values and check db "<Seller_Name>""<Organization>""<Sales_role>""<Manager>""<Start_date>""<End_date>"
  Then Moving to back to list 
	Then Search for ipl_page "2022 1H"
	Then check edit function is working fine for IPL Page
  Examples:
	| Seller_Name  |   Organization  |  Sales_role  | Manager  | Start_date  | End_date  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
	@Scenario3ipl
  Scenario Outline: Verify view and View History screens working fine in IPL Page
  Then add new record in IPL page with below values and check db "<Status_Cd>""<Status_Desc>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list  
  Then Search for ipl "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Seller Name |  Organization  |   Sales Role |  Manager  |  Start date  |  End date  |  Status |
  Then check view history working properly  
   And Check view having all the below fields 
    | Seller Name |  Organization  |   Sales Role |  Manager  |  Start date  |  End date  |  Status |
   Examples:
	| Seller_Name  |   Organization  |  Sales_role  | Manager  | Start_date  | End_date  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
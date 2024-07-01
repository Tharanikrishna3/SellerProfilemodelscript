Feature: OTE Group Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to OTE Group Page
      
	@Scenario1ipl
  Scenario: Verify OTE Group page having all the fields all list_grid_card views
    And Check view having all the below fields
		| OTE group name | 	Start Date  | 	End Date  | Status|  
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | OTE group name | 	Start Date  | 	End Date  | Status|  
    Then Navigate to Card view
    And Check view having all the below fields 
    | OTE group name | 	Start Date  | 	End Date  | Status|  
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in OTE Group page
  Then add new record in OTE Group page with below values and check db "<OTE_grp_name>""<Start_Date>""<End_date>"
  Then Moving to back to list 
	Then Search for OTE_country_page "2022 1H"
	Then check edit function is working fine for OTE Country page
  Examples:
	| OTE_grp_name  |   Start_Date  |  End_date  | 
	| K | 06 | 2022-01-01  |  2022-06-30   |
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in OTE Conutry PAGE
  Then add new record in OTE Group page with below values and check db "<OTE_grp_name>""<Start_Date>""<End_date>"
  Then Moving to back to list  
  Then Search for ipl_status "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | OTE group name | 	Start Date  | 	End Date  | Status|  
  Then check view history working properly  
   And Check view having all the below fields 
    | OTE group name | 	Start Date  | 	End Date  | Status|  
  Examples:
	| OTE_grp_name  |   Start_Date  |  End_date  | 
	| K | 06 | 2022-01-01  | 
	
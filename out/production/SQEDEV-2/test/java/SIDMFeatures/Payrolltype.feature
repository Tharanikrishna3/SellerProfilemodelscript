Feature: Payroll Type verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Payroll Type Page
      
	@Scenario1ipl
  Scenario: Verify Payroll Type page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Country | Payroll type 1 |  Payroll type 2 | Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Country | Payroll type 1 |  Payroll type 2 | Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Country | Payroll type 1 |  Payroll type 2 | Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in Payroll Type page
  Then add new record in Payroll type page with below values and check db "<Country>""<Payroll_type1>""<Payroll_type2>"
  Then Moving to back to list 
	Then Search for Payroll_type "2022 1H"
	Then check edit function is working fine for Payroll type page
  Examples:
	| Country  |   Payroll_type1  |  Payroll_type2  |
	| K | 06 | 2022-01-01  |  2022-06-30   | 
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in Payout Group Page
  Then add new record in Payroll type page with below values and check db "<Country>""<Payroll_type1>""<Payroll_type2>"
  Then Moving to back to list  
  Then Search for Payroll_type "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
      | Country | Payroll type 1 |  Payroll type 2 | Status  |
  Then check view history working properly  
   And Check view having all the below fields 
     | Country | Payroll type 1 |  Payroll type 2 | Status  |
   Examples:
	| Country  |   Payroll_type1  |  Payroll_type2  |
	| K | 06 | 2022-01-01  |  2022-06-30   | 
	
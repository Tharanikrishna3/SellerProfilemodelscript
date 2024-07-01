Feature: PDT Tag Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to PDT Tag Page
      
	@Scenario1ipl
  Scenario: Verify PDT Tag page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Tag| Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Tag| Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Tag| Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in PDT Tag page
  Then add new record in OTE Tag page with below values and check db "<Tag>"
  Then Moving to back to list 
	Then Search for OTE_Tag "2022 1H"
	Then check edit function is working fine for OTE Tag Page
  Examples:
	| Tag  |   
	| K |
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in PDT  PAGE
  Then add new record in OTE  page with below values and check db "<Tag>"
  Then Moving to back to list  
  Then Search for ipl_status "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Tag| Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Tag| Status  |
  Examples:
	| Tag  |
	| K |
	
Feature: Seller Position Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lx-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/PRseller"
    	Then Login into application with the id "jabaker@us.ibm.com","123"
    	Then Navigate to Seller Page
    	Then Search for seller record "Deric"
      Then Navigate to Seller Position Page
      
	@Scenario1Sellerposition
  Scenario: Verify Seller Position page having all the fields all list_grid_card_view_view_viewhistory screens
    And Check view having all the below fields
		| Job family  | Position code | Speciality | Band  | Department | Start Date  | End Date | Status | Account code  | Currency  |
    #Then Navigate to Grid view 
    #And Check view having all the below fields 
    #| Job family  | Position code | Speciality | Band  | Department | Start Date  | End Date | Status | Account code  | Currency  |
    Then Navigate to Card view
    And Check view having all the below fields 
   | Job family  | Position code | Speciality | Band  | Department | Start Date  | End Date | Status | Account code  | Currency  |
   Then Navigate to List view
    Then check view working properly in sellerposition
  And Check view having all the below fields
    | Job family  | Position code | Speciality | Band  | Department | Start Date  | End Date | Status | Account code  | Currency  |
   Then check view history working properly 
	And Check view having all the below fields
    | Job family  | Position code | Speciality | Band  | Department | Start Date  | End Date | Status | Account code  | Currency  |
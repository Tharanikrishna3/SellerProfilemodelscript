Feature: Sales Role Exception Page verification

  Background:
     Given Login into SFAT application with the id "lbwinsto@us.ibm.com"
     When user navigates to Sales Role Country

	@Scenario1fm
  Scenario: Verify Sales Role Exception page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesroleexcep "Seller","Status"
    Then user checks data on Card Screen in salesroleexcep "Seller","Status"
    Then user checks data on Grid Screen in salesroleexcep "Seller","Status"
    Then user checks data on View Screen in salesroleexcep "Seller","Status"
    Then user checks data on View History Screen in salesroleexcep "Seller","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Sales Role Exception
  Given User clicks on Add button
  And user provides all required inputs in salesroleexcep "<Seller>"
  Then record should be added successfully
  And user clicks on Cancel button in salesroleexcep
	Then record should be Canceled successfully
  Examples:
|Seller|
| | 
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Sales Role Exception
 	Given User clicks on Add button
  And user provides all required inputs in salesroleexcep "<Seller>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesroleexcep
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Seller|
| | 
  
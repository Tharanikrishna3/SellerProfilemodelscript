Feature: Sales Role Tag value Page verification

  Background:
     Given Login into SFAT application with the id "thaisnb@br.ibm.com"
     When user navigates to Sales Role tag value
	@Scenario1fm
  Scenario: Verify Sales Role tag value page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesroletagvalue "Sales role tag value","Status"
    Then user checks data on Card Screen in salesroletagvalue "Sales role tag value","Status"
    Then user checks data on Grid Screen in salesroletagvalue "Sales role tag value","Status"
    Then user checks data on View Screen in salesroletagvalue "Sales role tag value","Status"
    Then user checks data on View History Screen in salesroletagvalue "Sales role tag value","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Sales Role tag Link
  Given User clicks on Add button
  And user provides all required inputs in salesroletagvalue "<Sales role tag value>"
  Then record should be added successfully
  And user clicks on Cancel button in salesroletagvalue
	Then record should be Canceled successfully
  Examples:
|Sales role tag value|
||
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Sales Role tag Link
 	Given User clicks on Add button
  And user provides all required inputs in salesroletagvalue "<Sales role tag value>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesroletagvalue
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Sales role tag value|
||
  
Feature: Sales Role Tag link Page verification

  Background:
     Given Login into SFAT application with the id "thaisnb@br.ibm.com"
     When user navigates to Sales Role tag Link
	@Scenario1fm
  Scenario: Verify Sales Role tag Link page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesroletaglink "Sales role tag value","Status"
    Then user checks data on Card Screen in salesroletaglink "Sales role tag value","Status"
    Then user checks data on Grid Screen in salesroletaglink "Sales role tag value","Status"
    Then user checks data on View Screen in salesroletaglink "Sales role tag value","Status"
    Then user checks data on View History Screen in salesroletaglink "Sales role tag value","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Sales Role tag Link
  Given User clicks on Add button
  And user provides all required inputs in salesroletaglink "<Sales role tag value>"
  Then record should be added successfully
  And user clicks on Cancel button in salesroletaglink
	Then record should be Canceled successfully
  Examples:
|Sales role tag value|
||
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Sales Role tag Link
 	Given User clicks on Add button
  And user provides all required inputs in salesroletaglink "<Sales role tag value>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesroletaglink
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Sales role tag value|
||
  
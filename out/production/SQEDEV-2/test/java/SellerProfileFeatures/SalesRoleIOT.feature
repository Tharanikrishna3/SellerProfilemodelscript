Feature: Sales Role IOT Page verification

  Background:
     Given Login into SFAT application with the id "lrydzew@us.ibm.com"
     When user navigates to Sales Role IOT
	@Scenario1fm
  Scenario: Verify Sales Role IOT page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesroleiot "IOT","Status"
    Then user checks data on Card Screen in salesroleiot "IOT","Status"
    Then user checks data on Grid Screen in salesroleiot "IOT","Status"
    Then user checks data on View Screen in salesroleiot "IOT","Status"
    Then user checks data on View History Screen in salesroleiot "IOT","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Sales Role IOT
  Given User clicks on Add button
  And user provides all required inputs in salesroleiot "<IOT>""<Status>"
  Then record should be added successfully
  And user clicks on Cancel button in salesroleiot
	Then record should be Canceled successfully
  Examples:
|IOT|
||
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Sales Role IOT
 	Given User clicks on Add button
  And user provides all required inputs in salesroleiot "<IOT>""<Status>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesroleiot
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|IOT|
||
  
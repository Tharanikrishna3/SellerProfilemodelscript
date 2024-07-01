Feature: Previous Sales Role page verification

  Background:
     Given Login into SFAT application with the id "lrydzew@us.ibm.com"
     When user navigates to Previous Sales Role
	@Scenario1fm
  Scenario: Verify Previous Sales Role  page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in prevsalesrole "Sales role (prior cycle)","Status"
    Then user checks data on Card Screen in prevsalesrole "Sales role (prior cycle)","Status"
    Then user checks data on Grid Screen in prevsalesrole "Sales role (prior cycle)","Status"
    Then user checks data on View Screen in prevsalesrole "Sales role (prior cycle)","Status"
    Then user checks data on View History Screen in prevsalesrole "Sales role (prior cycle)","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Sales Role IOT
  Given User clicks on Add button
  And user provides all required inputs in prevsalesrole "<Sales role (prior cycle)>"
  Then record should be added successfully
  And user clicks on Cancel button in prevsalesrole
	Then record should be Canceled successfully
  Examples:
|Sales role (prior cycle)|
||
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Sales Role IOT
 	Given User clicks on Add button
  And user provides all required inputs in prevsalesrole "<Sales role (prior cycle)>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in prevsalesrole
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Sales role (prior cycle)|
||
  
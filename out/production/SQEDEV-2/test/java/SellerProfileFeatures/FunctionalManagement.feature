Feature: Functional Management Page verification

  Background:
     Given Login into SFAT application with the id "claudiobahia@ibm.com"
     When user navigates to Functional Management Screen

	@Scenario1fm
  Scenario: Verify Functional Management page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in funcmgmt "Function Manager 1 name","Function Manager 1 CNUM","Function Manager 1 email","Function Manager 2 name","Function Manager 2 CNUM","Function Manager 2 email","Start Date","End Date","Function Manager 1 notes ID","Function Manager 2 notes ID"
    Then user checks data on Card Screen in funcmgmt "Function Manager 1 name","Function Manager 1 CNUM","Function Manager 1 email","Function Manager 2 name","Function Manager 2 CNUM","Function Manager 2 email","Start Date","End Date","Function Manager 1 notes ID","Function Manager 2 notes ID"
    Then user checks data on Grid Screen in funcmgmt "Function Manager 1 name","Function Manager 1 CNUM","Function Manager 1 email","Function Manager 2 name","Function Manager 2 CNUM","Function Manager 2 email","Start Date","End Date","Function Manager 1 notes ID","Function Manager 2 notes ID"
    Then user checks data on View Screen in funcmgmt "Function Manager 1 name","Function Manager 1 CNUM","Function Manager 1 email","Function Manager 2 name","Function Manager 2 CNUM","Function Manager 2 email","Start Date","End Date","Function Manager 1 notes ID","Function Manager 2 notes ID"
    Then user checks data on View History Screen in funcmgmt "Function Manager 1 name","Function Manager 1 CNUM","Function Manager 1 email","Function Manager 2 name","Function Manager 2 CNUM","Function Manager 2 email","Start Date","End Date","Function Manager 1 notes ID","Function Manager 2 notes ID"


  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Functional Management page
  Given User clicks on Add button
  And user provides all required inputs in funcmgmt "<Function Manager 1 name>""<Function Manager 1 CNUM>""<Function Manager 1 email>""<Function Manager 2 name>""<Function Manager 2 CNUM>""<Function Manager 2 email>""<Start Date>""<End Date>""<Function Manager 1 notes ID>""<Function Manager 2 notes ID>"
  Then record should be added successfully
  And user clicks on Cancel button in funcmgmt
	Then record should be Canceled successfully
  Examples:
|Function Manager 1 name|Function Manager 1 CNUM|Function Manager 1 email|Function Manager 2 name|Function Manager 2 CNUM|Function Manager 2 email|Start Date|End Date|Function Manager 1 notes ID|Function Manager 2 notes ID|
|     |        ||  ||  |   |        ||       |           |     |
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Functional Management page
 	Given User clicks on Add button
  And user provides all required inputs in funcmgmt "<Function Manager 1 name>""<Function Manager 1 CNUM>""<Function Manager 1 email>""<Function Manager 2 name>""<Function Manager 2 CNUM>""<Function Manager 2 email>""<Start Date>""<End Date>""<Function Manager 1 notes ID>""<Function Manager 2 notes ID>"
  Then record should be added successfully
And user clicks on Action button to select Edit option in funcmgmt
  And user Edit some fields in Edit Screen "Function Manager 1 notes ID"
	Then record should be udpated successfully
  Examples:
|Function Manager 1 name|Function Manager 1 CNUM|Function Manager 1 email|Function Manager 2 name|Function Manager 2 CNUM|Function Manager 2 email|Start Date|End Date|Function Manager 1 notes ID|Function Manager 2 notes ID|
|     |        ||  ||  |   |        ||       |           |     |
  
 	
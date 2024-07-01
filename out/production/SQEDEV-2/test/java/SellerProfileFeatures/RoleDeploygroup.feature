Feature: Role Deploy Group Page verification

  Background:
     Given Login into SFAT application with the id "jdoss@us.ibm.com"
     When user navigates to Role Deploy Group

	@Scenario1fm
  Scenario: Verify Role Deploy grp  page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in roledeploygrp "Role deployment group name","Start Date","End Date"
    Then user checks data on Card Screen in roledeploygrp "Role deployment group name","Start Date","End Date"
    Then user checks data on Grid Screen in roledeploygrp "Role deployment group name","Start Date","End Date"
    Then user checks data on View Screen in roledeploygrp "Role deployment group name","Start Date","End Date"
    Then user checks data on View History Screen in roledeploygrp "Role deployment group name","Start Date","End Date"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Role Deploy Group
  Given User clicks on Add button
  And user provides all required inputs in roledeploygrp "<Role deployment group name>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Cancel button in roledeploygrp
	Then record should be Canceled successfully
  Examples:
|Role deployment group name|Start Date|End Date|
|     |        ||
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Profile dropdown page
 	Given User clicks on Add button
  And user provides all required inputs in roledeploygrp "<Job role group name>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in roledeploygrp
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Role deployment group name|Start Date|End Date|
|     |        ||
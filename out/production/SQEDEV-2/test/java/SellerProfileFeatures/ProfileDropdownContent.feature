Feature: Profile dropdown content Page verification

  Background:
     Given Login into SFAT application with the id "dnowak@de.ibm.com"
     When user navigates to  Profile dropdown content Screen

	@Scenario1fm
  Scenario: Verify Profile dropdown content  page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in profdrpdwncontent "Profile dropdown content name","Status"
    Then user checks data on Card Screen in profdrpdwncontent "Profile dropdown content name","Status"
    Then user checks data on Grid Screen in profdrpdwncontent "Profile dropdown content name","Status"
    Then user checks data on View Screen in profdrpdwncontent "Profile dropdown content name","Status"
    Then user checks data on View History Screen in profdrpdwncontent "Profile dropdown content name","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Profile dropdown content page
  Given User clicks on Add button
  And user provides all required inputs in profdrpdwncontent "<Profile dropdown content name>"
  Then record should be added successfully
  And user clicks on Cancel button in profdrpdwncontent
	Then record should be Canceled successfully
  Examples:
|Profile dropdown content name|
| |
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Profile dropdown content page
 	Given User clicks on Add button
  And user provides all required inputs in profdrpdwncontent "<Profile dropdown content name>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in profdrpdwncontent
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
  Examples:
|Profile dropdown content name|
| |
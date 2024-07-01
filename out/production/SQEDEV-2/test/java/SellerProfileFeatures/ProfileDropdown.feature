Feature: Profile dropdown Page verification

  Background:
     Given Login into SFAT application with the id "dnowak@de.ibm.com"
     When user navigates to  Profile dropdown Screen

	@Scenario1fm
  Scenario: Verify Profile dropdown  page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in profdrpdwn "Organization group","Profile dropdown name","Profile dropdown sequence","Start Date","End Date"
    Then user checks data on Card Screen in profdrpdwn "Organization group","Profile dropdown name","Profile dropdown sequence","Start Date","End Date"
    Then user checks data on Grid Screen in profdrpdwn "Organization group","Profile dropdown name","Profile dropdown sequence","Start Date","End Date"
    Then user checks data on View Screen in profdrpdwn "Organization group","Profile dropdown name","Profile dropdown sequence","Start Date","End Date"
    Then user checks data on View History Screen in profdrpdwn "Organization group","Profile dropdown name","Profile dropdown sequence","Start Date","End Date"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Profile dropdown page
  Given User clicks on Add button
  And user provides all required inputs in profdrpdwn "<Organization group>""<Profile dropdown name>""<Profile dropdown sequence>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Cancel button in profdrpdwn
	Then record should be Canceled successfully
  Examples:
|Organization group|Profile dropdown name|Profile dropdown sequence|Start Date|End Date|
|     |        ||   |  |
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Profile dropdown page
 	Given User clicks on Add button
  And user provides all required inputs in profdrpdwn "<Job role group name>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in profdrpdwn
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
     Examples:
|Organization group|Profile dropdown name|Profile dropdown sequence|Start Date|End Date|
|     |        ||   |  |
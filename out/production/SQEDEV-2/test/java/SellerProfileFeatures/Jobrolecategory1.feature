Feature: Job Role Category 1 Page verification

  Background:
     Given Login into SFAT application with the id "dnowak@de.ibm.com"
     When user navigates to Job Role Category 1 screen

	@Scenario1fm
  Scenario: Verify Job Role Category 1  page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in jobcat1 "Job role category 1 description","Start Date","End Date","Status"
    Then user checks data on Card Screen in jobcat1 "Job role category 1 description","Start Date","End Date","Status"
    Then user checks data on Grid Screen in jobcat1 "Job role category 1 description","Start Date","End Date","Status"
    Then user checks data on View Screen in jobcat1 "Job role category 1 description","Start Date","End Date","Status"
    Then user checks data on View History Screen in jobcat1 "Job role category 1 description","Start Date","End Date","Status"


  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Job Role Category 1 page
  Given User clicks on Add button
  And user provides all required inputs in jobcat1 "<Job role category 1 description>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Cancel button in jobcat1
	Then record should be Canceled successfully
  Examples:
|Job role category 1 description|Start Date|End Date|
|     |        ||
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Job Role Category 1 page
 	Given User clicks on Add button
  And user provides all required inputs in jobcat1 "<Job role category 1 description>""<Start Date>""<End Date>"
  Then record should be added successfully
And user clicks on Action button to select Edit option in jobcat1
  And user Edit some fields in Edit Screen "Function Manager 1 notes ID"
	Then record should be udpated successfully
  Examples:
|Job role category 1 description|Start Date|End Date|
|     |        ||
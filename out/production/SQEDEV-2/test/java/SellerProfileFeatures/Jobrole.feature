Feature: Job Role Page verification

  Background:
     Given Login into SFAT application with the id "dnowak@de.ibm.com"
     When user navigates to Job Role Screen

	@Scenario1fm
  Scenario: Verify Job Role page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in jobrole "Job role type","Job role category 1","Job role category 2","Job role category 3","Start Date","End Date","Job role description"
    Then user checks data on Card Screen in jobrole "Job role group name","Start Date","End Date","Status"
    Then user checks data on Grid Screen in jobrole "Job role group name","Start Date","End Date","Status"
    Then user checks data on View Screen in jobrole "Job role group name","Start Date","End Date","Status"
    Then user checks data on View History Screen in jobrole "Job role group name","Start Date","End Date","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Job Role page
  Given User clicks on Add button
  And user provides all required inputs in jobrole "<Job role type>""<Job role category 1>""<Job role category 2>""<Job role category 3>""<Start Date>""<End Date>""<Job role description>"
  Then record should be added successfully
  And user clicks on Cancel button in jobrole
	Then record should be Canceled successfully
  Examples:
|Job role type|Job role category 1|Job role category 2|Job role category 3|Start Date|End Date|Job role description|
|     |        ||
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Job Role page
 	Given User clicks on Add button
  And user provides all required inputs in jobrole "<Job role group name>""<Start Date>""<End Date>"
  Then record should be added successfully
And user clicks on Action button to select Edit option in jobrole
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
    Examples:
|Job role group name|Start Date|End Date|
|     |        ||
  
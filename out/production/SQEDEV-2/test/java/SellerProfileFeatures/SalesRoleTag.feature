Feature: Sales Role TagPage verification

  Background:
     Given Login into SFAT application with the id "thaisnb@br.ibm.com"
     When user navigates to Sales Role Tag
	@Scenario1fm
  Scenario: Verify Sales Role tag  page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesroletag "Sales role tag name","Start Date","End Date","Status"
    Then user checks data on Card Screen in salesroletag "Sales role tag name","Start Date","End Date","Status"
    Then user checks data on Grid Screen in salesroletag "Sales role tag name","Start Date","End Date","Status"
    Then user checks data on View Screen in salesroletag "Sales role tag name","Start Date","End Date","Status"
    Then user checks data on View History Screen in salesroletag "Sales role tag name","Start Date","End Date","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Sales Role 
  Given User clicks on Add button
  And user provides all required inputs in salesroletag "<Sales role tag name>""<Start Date>""<End Date>""<Status>"
  Then record should be added successfully
  And user clicks on Cancel button in salesroletag
	Then record should be Canceled successfully
  Examples:
|Sales role tag name|Start Date|End Date|Status|
|| | | |
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Sales Role
 	Given User clicks on Add button
  And user provides all required inputs in salesroletag "<Sales role tag value>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesroletag
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
  Examples:
|Sales role tag name|Start Date|End Date|Status|
|| | | |
  
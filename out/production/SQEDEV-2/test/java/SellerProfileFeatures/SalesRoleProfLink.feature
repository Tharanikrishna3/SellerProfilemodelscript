Feature: Sales Role Profile Link Page verification

  Background:
     Given Login into SFAT application with the id "thaisnb@br.ibm.com"
     When user navigates to Sales Role Profile Link
	@Scenario1fm
  Scenario: Verify Sales Role Profile Link page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesroleproflink "Profile dropdown","	Profile dropdown content","Status"
    Then user checks data on Card Screen in salesroleproflink "Profile dropdown","	Profile dropdown content","Status"
    Then user checks data on Grid Screen in salesroleproflink "Profile dropdown","	Profile dropdown content","Status"
    Then user checks data on View Screen in salesroleproflink "Profile dropdown","	Profile dropdown content","Status"
    Then user checks data on View History Screen in salesroleproflink "Profile dropdown","	Profile dropdown content","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Sales Role Profile Link
  Given User clicks on Add button
  And user provides all required inputs in salesroleproflink "<Profile dropdown>""<	Profile dropdown content>""<Status>"
  Then record should be added successfully
  And user clicks on Cancel button in salesroleproflink
	Then record should be Canceled successfully
  Examples:
|Profile dropdown|	Profile dropdown content|Status|
||||
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Sales Role Profile Link
 	Given User clicks on Add button
  And user provides all required inputs in salesroleproflink "<Profile dropdown>""<	Profile dropdown content>""<Status>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesroleproflink
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Profile dropdown|	Profile dropdown content|Status|
||||
 
  
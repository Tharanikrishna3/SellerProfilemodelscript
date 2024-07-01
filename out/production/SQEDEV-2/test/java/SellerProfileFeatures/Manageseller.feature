Feature: Manage Seller verification

  Background:
     Given Login into SFAT application with the id "scornell@us.ibm.com"
     When user navigates to Manager Seller
	@Scenario1fm
  Scenario: Verify Manage Seller page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in manageseller "IOT","IMT","Upline Sales Manager"
    Then user checks data on Card Screen in manageseller "IOT","IMT","Upline Sales Manager"
    Then user checks data on Grid Screen in manageseller "IOT","IMT","Upline Sales Manager"
    Then user checks data on View Screen in manageseller "IOT","IMT","Upline Sales Manager"
    Then user checks data on View History Screen in manageseller "IOT","IMT","Upline Sales Manager"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Manage Seller
  Given User clicks on Add button
  And user provides all required inputs in manageseller "<IOT>""<IMT>""<Upline Sales Manager>"
  Then record should be added successfully
  And user clicks on Cancel button in manageseller
	Then record should be Canceled successfully
  Examples:
|IOT|IMT|Upline Sales Manager|
| | | |
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Manage Seller page
 	Given User clicks on Add button
  And user provides all required inputs in manageseller "<IOT>""<IMT>""<Upline Sales Manager>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in manageseller
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
   Examples:
|IOT|IMT|Upline Sales Manager|
| | | |
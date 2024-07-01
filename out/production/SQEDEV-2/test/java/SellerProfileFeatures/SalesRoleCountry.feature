Feature: Sales Role Country Page verification

  Background:
     Given Login into SFAT application with the id "lbwinsto@us.ibm.com"
     When user navigates to Sales Role Country

	@Scenario1fm
  Scenario: Verify Sales Role Country page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesrolecty "Country","Exclude","Status"
    Then user checks data on Card Screen in salesrolecty "Country","Exclude","Status"
    Then user checks data on Grid Screen in salesrolecty "Country","Exclude","Status"
    Then user checks data on View Screen in salesrolecty "Country","Exclude","Status"
    Then user checks data on View History Screen in salesrolecty "Country","Exclude","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Role Deploy Group
  Given User clicks on Add button
  And user provides all required inputs in salesrolecty "<Country>""<Exclude">
  Then record should be added successfully
  And user clicks on Cancel button in salesrolecty
	Then record should be Canceled successfully
  Examples:
|Counrty|Exclude|
| | |
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Profile dropdown page
 	Given User clicks on Add button
  And user provides all required inputs in salesrolecty "<Country>""<Exclude">
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesrolecty
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Counrty|Exclude|
| | |
  
Feature: Eligibility Type Page verification

  Background:
     Given Login into SFAT application with the id "claudiobahia@ibm.com"
     When user navigates to Eligibility Type

	@Scenario1fm
  Scenario: Verify Eligibility Type page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in eligtype "Eligibility type","Eligibility description","Confirm eligibility days","Start Date","End Date"
    Then user checks data on Card Screen in eligtype "Eligibility type","Eligibility description","Confirm eligibility days","Start Date","End Date"
    Then user checks data on Grid Screen in eligtype "Eligibility type","Eligibility description","Confirm eligibility days","Start Date","End Date"
    Then user checks data on View Screen in eligtype "Eligibility type","Eligibility description","Confirm eligibility days","Start Date","End Date"
    Then user checks data on View History Screen in eligtype "Eligibility type","Eligibility description","Confirm eligibility days","Start Date","End Date"


  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Eligibility type Screen
  Given User clicks on Add button
  And user provides all required inputs in eligtype "<Eligibility type>""<Eligibility description>""<Confirm eligibility days>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Cancel button in eligtype
	Then record should be Canceled successfully
  Examples:
|Eligibility type|Eligibility description|Confirm eligibility days|Start Date|End Date|
|     |        ||  ||
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Eligibility type Screen
 Given User clicks on Add button
  And user provides all required inputs in eligtype "<Eligibility type>""<Eligibility description>""<Confirm eligibility days>""<Start Date>""<End Date>"
  Then record should be added successfully
And user clicks on Action button to select Edit option in eligtype
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
  Examples:
|Eligibility type|Eligibility description|Confirm eligibility days|Start Date|End Date|
|     |        ||  ||
  
 	
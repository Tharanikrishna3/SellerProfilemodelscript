Feature: Seller Eligibility verification

  Background:
     Given Login into SFAT application with the id "scornell@us.ibm.com"
     When user navigates to Seller Eligibility
	@Scenario1fm
  Scenario: Verify Sales Eligibility page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in sellerelig "Eligibility type","	Start Date","End Date","Status"
    Then user checks data on Card Screen in sellerelig "Eligibility type","	Start Date","End Date","Status"
    Then user checks data on Grid Screen in sellerelig "Eligibility type","	Start Date","End Date","Status"
    Then user checks data on View Screen in sellerelig "Eligibility type","	Start Date","End Date","Status"
    Then user checks data on View History Screen in sellerelig "Eligibility type","	Start Date","End Date","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Seller Eligibility 
  Given User clicks on Add button
  And user provides all required inputs in sellerelig "<Eligibility type>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Cancel button in sellerelig
	Then record should be Canceled successfully
  Examples:
|Eligibility type|Start Date|End Date|
| | | |
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Seller Eligibility
 	Given User clicks on Add button
  And user provides all required inputs in sellerelig "<Eligibility type>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in sellerelig
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
  Examples:
|Eligibility type|Start Date|End Date|
| | | |
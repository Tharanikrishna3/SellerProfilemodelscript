Feature: Seller Level Link verification

  Background:
     Given Login into SFAT application with the id "scornell@us.ibm.com"
     When user navigates to Seller Level Link
	@Scenario1fm
  Scenario: Verify Sales Level Link page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in sellerlevellnk "Seller level group","	Seller level","Start Date","End Date","Status"
    Then user checks data on Card Screen in sellerlevellnk "Seller level group","	Seller level","Start Date","End Date","Status"
    Then user checks data on Grid Screen in sellerlevellnk "Seller level group","	Seller level","Start Date","End Date","Status"
    Then user checks data on View Screen in sellerlevellnk "Seller level group","	Seller level","Start Date","End Date","Status"
    Then user checks data on View History Screen in sellerlevellnk "Seller level group","	Seller level","Start Date","End Date","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Seller Level Group 
  Given User clicks on Add button
  And user provides all required inputs in sellerlevellnk "<Seller level group>""<Seller level>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Cancel button in sellerlevellnk
	Then record should be Canceled successfully
  Examples:
|Seller level group|Seller level|Start Date|End Date|
| | | |
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Seller Level Group
 	Given User clicks on Add button
  And user provides all required inputs in sellerlevellnk "<Seller level group>""<Seller level>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in sellerlevellnk
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
   Examples:
|Seller level group|Seller level|Start Date|End Date|
| | | |
Feature: SEller Comp setup Page verification

  Background:
     Given Login into SFAT application with the id "claudiobahia@ibm.com"
     When user navigates to SEller comp setup

	@Scenario1fm
  Scenario: Verify Seller Comp setup page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in sellercompsetup "Seller","Seller Comp Step","	Effective Date","Delete Date","Status"
    Then user checks data on Card Screen in sellercompsetup "Seller","Seller Comp Step","	Effective Date","Delete Date","Status"
    Then user checks data on Grid Screen in sellercompsetup "Seller","Seller Comp Step","	Effective Date","Delete Date","Status"
    Then user checks data on View Screen in sellercompsetup "Seller","Seller Comp Step","	Effective Date","Delete Date","Status"
    Then user checks data on View History Screen in sellercompsetup "Seller","Seller Comp Step","	Effective Date","Delete Date","Status"


  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in SEller Comp setup
  Given User clicks on Add button
  And user provides all required inputs in sellercompsetup "<Seller>""<Seller Comp Step>""<Effective Date>""<Delete Date>"
  Then record should be added successfully
  And user clicks on Cancel button in sellercompsetup
	Then record should be Canceled successfully
  Examples:
|Seller|Seller Comp Step|	Effective Date|Delete Date|
|     |        ||  ||  |   |        ||       |           |     |
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Seller comp setup
 	Given User clicks on Add button
  And user provides all required inputs in sellercompsetup "<Seller>""<Seller Comp Step>""<Effective Date>""<Delete Date>"
  Then record should be added successfully
And user clicks on Action button to select Edit option in sellercompsetup
  And user Edit some fields in Edit Screen "Function Manager 1 notes ID"
	Then record should be udpated successfully
  Examples:
|Seller|Seller Comp Step|	Effective Date|Delete Date|
|     |        ||  ||  |   |        ||       |           |     |
  
 	
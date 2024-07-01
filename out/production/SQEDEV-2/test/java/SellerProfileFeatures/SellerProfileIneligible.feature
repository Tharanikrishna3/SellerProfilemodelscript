Feature: Seller Profile ineligible Page verification

  Background:
     Given Login into SFAT application with the id "thaisnb@br.ibm.com"
     When user navigates to Seller Profile Ineligible
	@Scenario1fm
  Scenario: Verify Seller Profile Ineiligible page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in sellerpforinelig "Seller Id","Sales Role Ineligible Id","Org Id","Effective Date","Delete Date","Status"
    Then user checks data on Card Screen in sellerpforinelig "Seller Id","Sales Role Ineligible Id","Org Id","Effective Date","Delete Date","Status"
    Then user checks data on Grid Screen in sellerpforinelig "Seller Id","Sales Role Ineligible Id","Org Id","Effective Date","Delete Date","Status"
    Then user checks data on View Screen in sellerpforinelig "Seller Id","Sales Role Ineligible Id","Org Id","Effective Date","Delete Date","Status"
    Then user checks data on View History Screen in sellerpforinelig "Seller Id","Sales Role Ineligible Id","Org Id","Effective Date","Delete Date","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Seller Profile Ineligible
  Given User clicks on Add button
  And user provides all required inputs in sellerpforinelig "<Seller Id>""<Sales Role Ineligible Id>""<Org Id>""<Effective Date>""<Delete Date>"
  Then record should be added successfully
  And user clicks on Cancel button in sellerpforinelig
	Then record should be Canceled successfully
  Examples:
|Seller Id|Sales Role Ineligible Id|Org Id|Effective Date|Delete Date|
||||
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Seller profile Ineligible
 	Given User clicks on Add button
  And user provides all required inputs in sellerpforinelig "<Seller Id>""<Sales Role Ineligible Id>""<Org Id>""<Effective Date>""<Delete Date>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in sellerpforinelig
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Seller Id|Sales Role Ineligible Id|Org Id|Effective Date|Delete Date|
||||
 
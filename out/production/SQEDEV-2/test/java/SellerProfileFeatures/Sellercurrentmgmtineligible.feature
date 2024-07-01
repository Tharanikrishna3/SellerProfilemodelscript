Feature: Seller Current management ineligible Page verification

  Background:
     Given Login into SFAT application with the id "thaisnb@br.ibm.com"
     When user navigates to Seller Current Management Ineligible
	@Scenario1fm
  Scenario: Verify Seller Current Management Ineiligible page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in sellercurrentmgmtinelig "Seller Id","Manager Type","Status","Manager 1 Serial Number","Manager 1 Name","Manager 2 Serial","Manager 2 Name","Effective Date","Delete Date","Status"
    Then user checks data on Card Screen in sellercurrentmgmtinelig "Seller Id","Manager Type","Status","Manager 1 Serial Number","Manager 1 Name","Manager 2 Serial","Manager 2 Name","Effective Date","Delete Date","Status"
    Then user checks data on Grid Screen in sellercurrentmgmtinelig "Seller Id","Manager Type","Status","Manager 1 Serial Number","Manager 1 Name","Manager 2 Serial","Manager 2 Name","Effective Date","Delete Date","Status"
    Then user checks data on View Screen in sellercurrentmgmtinelig "Seller Id","Manager Type","Status","Manager 1 Serial Number","Manager 1 Name","Manager 2 Serial","Manager 2 Name","Effective Date","Delete Date","Status"
    Then user checks data on View History Screen in sellercurrentmgmtinelig "Seller Id","Manager Type","Status","Manager 1 Serial Number","Manager 1 Name","Manager 2 Serial","Manager 2 Name","Effective Date","Delete Date","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Seller current Management Ineligible
  Given User clicks on Add button
  And user provides all required inputs in sellercurrentmgmtinelig "<Seller Id>""<Manager Type>""<Manager 1 Serial Number>""<Manager 1 Name>""<Manager 2 Serial>""<Manager 2 Name>""<Effective Date>""<Delete Date>"
  Then record should be added successfully
  And user clicks on Cancel button in sellercurrentmgmtinelig
	Then record should be Canceled successfully
  Examples:
|Seller Id|Manager Type|Manager 1 Serial Number|Manager 1 Name|Manager 2 Serial|Manager 2 Name|Effective Date|Delete Date|
||||
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Seller current Management Ineligible
 	Given User clicks on Add button
  And user provides all required inputs in sellercurrentmgmtinelig "<Seller Id>""<Manager Type>""<Manager 1 Serial Number>""<Manager 1 Name>""<Manager 2 Serial>""<Manager 2 Name>""<Effective Date>""<Delete Date>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in sellercurrentmgmtinelig
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Seller Id|Manager Type|Manager 1 Serial Number|Manager 1 Name|Manager 2 Serial|Manager 2 Name|Effective Date|Delete Date|
||||
 
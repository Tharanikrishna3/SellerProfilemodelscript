Feature: Sales role ineligible Page verification

  Background:
     Given Login into SFAT application with the id "thaisnb@br.ibm.com"
     When user navigates to Sales Role Ineligible
	@Scenario1fm
  Scenario: Verify Sales Role Ineiligible page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesroleinelig "Role Type","Role Description","Job Role Category 3 Ineligible Id","Effective Date","Delete Date","Status"
    Then user checks data on Card Screen in salesroleinelig "Role Type","Role Description","Job Role Category 3 Ineligible Id","Effective Date","Delete Date","Status"
    Then user checks data on Grid Screen in salesroleinelig "Role Type","Role Description","Job Role Category 3 Ineligible Id","Effective Date","Delete Date","Status"
    Then user checks data on View Screen in salesroleinelig "Role Type","Role Description","Job Role Category 3 Ineligible Id","Effective Date","Delete Date","Status"
    Then user checks data on View History Screen in salesroleinelig "Role Type","Role Description","Job Role Category 3 Ineligible Id","Effective Date","Delete Date","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Sales Role Ineligible
  Given User clicks on Add button
  And user provides all required inputs in salesroleinelig "<Role Type>""<Role Description>""<Job Role Category 3 Ineligible Id>""<Effective Date>""<Delete Date>"
  Then record should be added successfully
  And user clicks on Cancel button in salesroleinelig
	Then record should be Canceled successfully
  Examples:
|Role Type|Role Description|Job Role Category 3 Ineligible Id|Effective Date|Delete Date|
||||
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Sales Role Ineligible
 	Given User clicks on Add button
  And user provides all required inputs in salesroleinelig "<Role Type>""<Role Description>""<Job Role Category 3 Ineligible Id>""<Effective Date>""<Delete Date>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesroleinelig
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Role Type|Role Description|Job Role Category 3 Ineligible Id|Effective Date|Delete Date|
||||
 
Feature: Job Role Category 3 Ineligible Page verification

  Background:
     Given Login into SFAT application with the id "thaisnb@br.ibm.com"
     When user navigates to Job Role Category 3 Ineligible 
	@Scenario1fm
  Scenario: Verify  Job Role Category 3 Ineligible  page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in jobrolecatinelig "Job Role Category 3 Description","Effective Date","	Delete Date","Status"
    Then user checks data on Card Screen in jobrolecatinelig "Job Role Category 3 Description","Effective Date","	Delete Date","Status"
    Then user checks data on Grid Screen in jobrolecatinelig "Job Role Category 3 Description","Effective Date","	Delete Date","Status"
    Then user checks data on View Screen in jobrolecatinelig "Job Role Category 3 Description","Effective Date","	Delete Date","Status"
    Then user checks data on View History Screen in jobrolecatinelig "Job Role Category 3 Description","Effective Date","	Delete Date","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Job Role Category 3 Ineligible 
  Given User clicks on Add button
  And user provides all required inputs in jobrolecatinelig "<Job Role Category 3 Description>""<Effective Date>""<Delete Date>"
  Then record should be added successfully
  And user clicks on Cancel button in jobrolecatinelig
	Then record should be Canceled successfully
  Examples:
|Job Role Category 3 Description|Effective Date|Delete Date|
 | | | | |
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Job Role Category 3 Ineligible 
 	Given User clicks on Add button
  And user provides all required inputs in jobrolecatinelig "<Job Role Category 3 Description>""<Effective Date>""<Delete Date>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in jobrolecatinelig
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Job Role Category 3 Description|Effective Date|Delete Date|
||||
 
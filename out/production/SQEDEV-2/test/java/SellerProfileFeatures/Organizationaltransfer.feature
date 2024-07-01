Feature: Organization Transfer Page verification

  Background:
     Given Login into SFAT application with the id "thaisnb@br.ibm.com"
     When user navigates to Organizational Transfer
	@Scenario1fm
  Scenario: Verify Organizational Transfer page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in orgtransfer "SELLER PROFILE ID","NEW ORG ID","Start Date","End Date","Status"
    Then user checks data on Card Screen in orgtransfer "SELLER PROFILE ID","NEW ORG ID","Start Date","End Date","Status"
    Then user checks data on Grid Screen in orgtransfer "SELLER PROFILE ID","NEW ORG ID","Start Date","End Date","Status"
    Then user checks data on View Screen in orgtransfer "SELLER PROFILE ID","NEW ORG ID","Start Date","End Date","Status"
    Then user checks data on View History Screen in orgtransfer "SELLER PROFILE ID","NEW ORG ID","Start Date","End Date","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Organizational Transfer
  Given User clicks on Add button
  And user provides all required inputs in orgtransfer "<SELLER PROFILE ID>""<NEW ORG ID>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Cancel button in orgtransfer
	Then record should be Canceled successfully
  Examples:
|SELLER PROFILE ID|NEW ORG ID|Start Date|End Date|
 | | | | |
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Organizational Transfer
 	Given User clicks on Add button
  And user provides all required inputs in orgtransfer "<SELLER PROFILE ID>""<NEW ORG ID>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in orgtransfer
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|SELLER PROFILE ID|NEW ORG ID|Start Date|End Date|
||||
 
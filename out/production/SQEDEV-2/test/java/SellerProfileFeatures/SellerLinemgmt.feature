Feature: Sales Role IE Account List Page verification

  Background:
     Given Login into SFAT application with the id "lrydzew@us.ibm.com"
     When user navigates to Sales Role IE Account List

	@Scenario1fm
  Scenario: Verify Sales Role IE Account List page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesroleieactlist "Account List Group","Account List Name","Role Description","Role Type","IE ID","Status"
    Then user checks data on Card Screen in salesroleieactlist "Account List Group","Account List Name","Role Description","Role Type","IE ID","Status"
    Then user checks data on Grid Screen in salesroleieactlist "Account List Group","Account List Name","Role Description","Role Type","IE ID","Status"
    Then user checks data on View Screen in salesroleieactlist "Account List Group","Account List Name","Role Description","Role Type","IE ID","Status"
    Then user checks data on View History Screen in salesroleieactlist "Account List Group","Account List Name","Role Description","Role Type","IE ID","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Sales Role IE Account List
  Given User clicks on Add button
  And user provides all required inputs in salesroleieactlist "<Account List Group>""<Account List Name>""<Role Description>""<Role Type>""<IE ID>"
  Then record should be added successfully
  And user clicks on Cancel button in salesroleieactlist
	Then record should be Canceled successfully
  Examples:
|Account List Group|Account List Name|Role Description|Role Type|IE ID|
| | ||||
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Sales Role IE Account List
 	Given User clicks on Add button
  And user provides all required inputs in salesroleieactlist "<Account List Group>""<Account List Name>""<Role Description>""<Role Type>""<IE ID>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesroleieactlist
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
  Examples:
|Account List Group|Account List Name|Role Description|Role Type|IE ID|
| | ||||
  
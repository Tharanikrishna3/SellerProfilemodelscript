Feature: Stacking Exception Page verification

  Background:
     Given Login into SFAT application with the id "thaisnb@br.ibm.com"
     When user navigates to Stacking Exception

	@Scenario1fm
  Scenario: Verify Stacking Exception page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in stackexcep "Role Deployment Group 1","Role Deployment Group 2","Stacking Rule Indicator","	Start date","End date","Status"
    Then user checks data on Card Screen in stackexcep "Role Deployment Group 1","Role Deployment Group 2","Stacking Rule Indicator","	Start date","End date","Status"
    Then user checks data on Grid Screen in stackexcep "Role Deployment Group 1","Role Deployment Group 2","Stacking Rule Indicator","	Start date","End date","Status"
    Then user checks data on View Screen in stackexcep "Role Deployment Group 1","Role Deployment Group 2","Stacking Rule Indicator","	Start date","End date","Status"
    Then user checks data on View History Screen in stackexcep "Role Deployment Group 1","Role Deployment Group 2","Stacking Rule Indicator","	Start date","End date","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Stacking Exception
  Given User clicks on Add button
  And user provides all required inputs in stackexcep "<Role Deployment Group 1>""<	Role Deployment Group 2>""<Stacking Rule Indicator>""<Start date>""<End date>"
  Then record should be added successfully
  And user clicks on Cancel button in stackexcep
	Then record should be Canceled successfully
  Examples:
|Role Deployment Group 1|	Role Deployment Group 2|	Stacking Rule Indicator|	Stacking Rule Indicator|Start date|End date|
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Stacking Exception
 	Given User clicks on Add button
  And user provides all required inputs in stackexcep "<Role Deployment Group 1>""<	Role Deployment Group 2>""<Stacking Rule Indicator>""<Start date>""<End date>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in stackexcep
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Role Deployment Group 1|	Role Deployment Group 2|	Stacking Rule Indicator|	Stacking Rule Indicator|Start date|End date|
  
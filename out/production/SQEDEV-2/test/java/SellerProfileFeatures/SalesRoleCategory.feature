Feature: Sales Role Category Page verification

  Background:
     Given Login into SFAT application with the id "thorta@br.ibm.com"
     When user navigates to Sales Role Category

	@Scenario1fm
  Scenario: Verify Sales Role Category page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesrolecat "Sales role category description","Sales role category customer prefix","Sales role ctgy dflt indc","Status","Start date","End date"
    Then user checks data on Card Screen in salesrolecat "Sales role category description","Sales role category customer prefix","Sales role ctgy dflt indc","Status","Start date","End date"
    Then user checks data on Grid Screen in salesrolecat "Sales role category description","Sales role category customer prefix","Sales role ctgy dflt indc","Status","Start date","End date"
    Then user checks data on View Screen in salesrolecat "Sales role category description","Sales role category customer prefix","Sales role ctgy dflt indc","Status","Start date","End date"
    Then user checks data on View History Screen in salesrolecat "Sales role category description","Sales role category customer prefix","Sales role ctgy dflt indc","Status","Start date","End date"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Role Deploy Group
  Given User clicks on Add button
  And user provides all required inputs in salesrolecat "<Sales role category description>""<Sales role category customer prefix>""<Sales role ctgy dflt indc>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Cancel button in salesrolecat
	Then record should be Canceled successfully
  Examples:
|Sales role category description|Sales role category customer prefix|Sales role ctgy dflt indc|Start Date|End Date|
|     |        || | |
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Profile dropdown page
 	Given User clicks on Add button
  And user provides all required inputs in salesrolecat "<Job role group name>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesrolecat
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Sales role category description|Sales role category customer prefix|Sales role ctgy dflt indc|Start Date|End Date|
|     |        || | |
  
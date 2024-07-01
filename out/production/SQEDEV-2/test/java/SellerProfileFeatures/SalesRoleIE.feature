Feature: Sales Role IE Page verification

  Background:
     Given Login into SFAT application with the id "lrydzew@us.ibm.com"
     When user navigates to Sales Role IE

	@Scenario1fm
  Scenario: Verify Sales Role IE page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesroleie "Organization","Sales Role / Level / Location","Plan type / Leverage Type / OTE / Length","Incentive Elements","Original Sales Role / Level / Location","Status"
    Then user checks data on Card Screen in salesroleie "Organization","Sales Role / Level / Location","Plan type / Leverage Type / OTE / Length","Incentive Elements","Original Sales Role / Level / Location","Status"
    Then user checks data on Grid Screen in salesroleie "Organization","Sales Role / Level / Location","Plan type / Leverage Type / OTE / Length","Incentive Elements","Original Sales Role / Level / Location","Status"
    Then user checks data on View Screen in salesroleie "Organization","Sales Role / Level / Location","Plan type / Leverage Type / OTE / Length","Incentive Elements","Original Sales Role / Level / Location","Status"
    Then user checks data on View History Screen in salesroleie "Organization","Sales Role / Level / Location","Plan type / Leverage Type / OTE / Length","Incentive Elements","Original Sales Role / Level / Location","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Sales Role IE
  Given User clicks on Add button
  And user provides all required inputs in salesroleie "<Organization>""<Sales Role / Level / Location>""<Plan type / Leverage Type / OTE / Length>""<Incentive Elements>""<Original Sales Role / Level / Location>"
  Then record should be added successfully
  And user clicks on Cancel button in salesroleie
	Then record should be Canceled successfully
  Examples:
|Organization|Sales Role / Level / Location|Plan type / Leverage Type / OTE / Length|Incentive Elements|Original Sales Role / Level / Location|Status|
| | ||||
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Sales Role IE
 	Given User clicks on Add button
  And user provides all required inputs in salesroleie "<Organization>""<Sales Role / Level / Location>""<Plan type / Leverage Type / OTE / Length>""<Incentive Elements>""<Original Sales Role / Level / Location>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesroleie
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
 Examples:
|Organization|Sales Role / Level / Location|Plan type / Leverage Type / OTE / Length|Incentive Elements|Original Sales Role / Level / Location|Status|
| | ||||
  
Feature: IPL Work follow Page verification

  Background:
     Given Login into SFAT application with the id "dnowak@de.ibm.com"
     When user navigates to IPL Work follow

	@Scenario1fm
  Scenario: Verify IPL Work follow page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in iplwrkfollow "Country","HR reconciliation required before IPL offer","IPL offered by line manager","Start Date","End Date"
    Then user checks data on Card Screen in iplwrkfollow "Country","HR reconciliation required before IPL offer","IPL offered by line manager","Start Date","End Date"
    Then user checks data on Grid Screen in iplwrkfollow "Country","HR reconciliation required before IPL offer","IPL offered by line manager","Start Date","End Date"
    Then user checks data on View Screen in iplwrkfollow "Country","HR reconciliation required before IPL offer","IPL offered by line manager","Start Date","End Date"
    Then user checks data on View History Screen in iplwrkfollow "Country","HR reconciliation required before IPL offer","IPL offered by line manager","Start Date","End Date"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in IPL Work follow
  Given User clicks on Add button
  And user provides all required inputs in iplwrkfollow "<Country>""<HR reconciliation required before IPL offer>""<IPL offered by line manager>""<Open Seller Description>""<Start Date>""<End Date>"
  Then record should be added successfully
  And user clicks on Cancel button in iplwrkfollow
	Then record should be Canceled successfully
  Examples:
|Country|HR reconciliation required before IPL offer|IPL offered by line manager|Start Date|End Date|
|     |        ||
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in IPL Work Follow
 	Given User clicks on Add button
  And user provides all required inputs in iplwrkfollow "<Country>""<HR reconciliation required before IPL offer>""<IPL offered by line manager>""<Open Seller Description>""<Start Date>""<End Date>"
  Then record should be added successfully
And user clicks on Action button to select Edit option in iplwrkfollow
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
    Examples:
|Country|HR reconciliation required before IPL offer|IPL offered by line manager|Start Date|End Date|
|     |        ||
  
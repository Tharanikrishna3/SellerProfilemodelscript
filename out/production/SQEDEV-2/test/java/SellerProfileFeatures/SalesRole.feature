Feature: Sales Role Page verification

  Background:
     Given Login into SFAT application with the id "thaisnb@br.ibm.com"
     When user navigates to Sales Role
	@Scenario1fm
  Scenario: Verify Sales Role page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in salesrole "Organization","salesrolelocation","Plantype","Incentive Elements","Originalsalesrole","Status"
    Then user checks data on Card Screen in salesrole "Organization","salesrolelocation","Plantype","Incentive Elements","Originalsalesrole","Status"
    Then user checks data on Grid Screen in salesrole "Organization","salesrolelocation","Plantype","Incentive Elements","Originalsalesrole","Status"
    Then user checks data on View Screen in salesrole "Organization","salesrolelocation","Plantype","Incentive Elements","Originalsalesrole","Status"
    Then user checks data on View History Screen in salesrole "Organization","salesrolelocation","Plantype","Incentive Elements","Originalsalesrole","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Sales Role 
  Given User clicks on Add button
  And user provides all required inputs in salesrole "<Organization>""<Job role group name>""<Job role category 2>""<Job role>""<Job role category 1>""<Job role category 3>""<PDT>""<Seller level group>""<Start Date>""<End Date>""<Role description>"
  Then record should be added successfully
  And user clicks on Cancel button in salesrole
	Then record should be Canceled successfully
  Examples:
|Organization|Job role group name|Job role category 2|Job role|Job role category 1|Job role category 3|PDT|Seller level group|Start Date|End Date|Role description|
|| | | |
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Sales Role
 	Given User clicks on Add button
  And user provides all required inputs in salesrole "<Organization>""<Job role group name>""<Job role category 2>""<Job role>""<Job role category 1>""<Job role category 3>""<PDT>""<Seller level group>""<Start Date>""<End Date>""<Role description>"
  Then record should be added successfully
  And user clicks on Action button to select Edit option in salesrole
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
  Examples:
|Organization|Job role group name|Job role category 2|Job role|Job role category 1|Job role category 3|PDT|Seller level group|Start Date|End Date|Role description|
|| | | |
Feature: Open Seller Page verification

  Background:
     Given Login into SFAT application with the id "dnowak@de.ibm.com"
     When user navigates to Open Seller

	@Scenario1fm
  Scenario: Verify Open Seller page having all the fields in list/card/grid/view/ViewHistory views
    Then user checks data on List Screen in openseller "Open Seller Country","Open Seller Serial Number","Open Seller Name","Open Seller Description","Seller Level","Manager Name","Manager Serial Number","Manager Country","Placed Seller Date","Placed Seller Country Number","Start date","End date","Status"
    Then user checks data on Card Screen in openseller "Open Seller Country","Open Seller Serial Number","Open Seller Name","Open Seller Description","Seller Level","Manager Name","Manager Serial Number","Manager Country","Placed Seller Date","Placed Seller Country Number","Start date","End date","Status"
    Then user checks data on Grid Screen in openseller "Open Seller Country","Open Seller Serial Number","Open Seller Name","Open Seller Description","Seller Level","Manager Name","Manager Serial Number","Manager Country","Placed Seller Date","Placed Seller Country Number","Start date","End date","Status"
    Then user checks data on View Screen in openseller "Open Seller Country","Open Seller Serial Number","Open Seller Name","Open Seller Description","Seller Level","Manager Name","Manager Serial Number","Manager Country","Placed Seller Date","Placed Seller Country Number","Start date","End date","Status"
    Then user checks data on View History Screen in openseller "Open Seller Country","Open Seller Serial Number","Open Seller Name","Open Seller Description","Seller Level","Manager Name","Manager Serial Number","Manager Country","Placed Seller Date","Placed Seller Country Number","Start date","End date","Status"



  @Scenario2fm
  Scenario Outline: Verify Whether the add functionality working Properly in Open Seller Page
  Given User clicks on Add button
  And user provides all required inputs in openseller "<Open Seller Country>""<Open Seller Serial Number>""<Open Seller Name>""<Open Seller Description>""<Seller Level>""<Manager Name>""<Manager Serial Number>""<Manager Country>""<Placed Seller Date>""<Placed Seller Country Number>""<Start date>""<End date>"
  Then record should be added successfully
  And user clicks on Cancel button in openseller
	Then record should be Canceled successfully
  Examples:
|Open Seller Country|Open Seller Serial Number|Open Seller Name|Open Seller Description|Seller Level|Manager Name|Manager Serial Number|Manager Country|Placed Seller Date|Placed Seller Country Number|Start date|End date|
|     |        ||
  
 
 	@Scenario3fm
 	Scenario: Verify Whether Edit working properly in Open Seller Page
 	Given User clicks on Add button
  And user provides all required inputs in openseller "<Open Seller Country>""<Open Seller Serial Number>""<Open Seller Name>""<Open Seller Description>""<Seller Level>""<Manager Name>""<Manager Serial Number>""<Manager Country>""<Placed Seller Date>""<Placed Seller Country Number>""<Start date>""<End date>"
  Then record should be added successfully
And user clicks on Action button to select Edit option in openseller
  And user Edit some fields in Edit Screen ""
	Then record should be udpated successfully
    Examples:
|Open Seller Country|Open Seller Serial Number|Open Seller Name|Open Seller Description|Seller Level|Manager Name|Manager Serial Number|Manager Country|Placed Seller Date|Placed Seller Country Number|Start date|End date|
|     |        ||
  
Feature: IPL Curreny Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to IPL Currency PAGE
      
	@Scenario1ipl
  Scenario: Verify IPL Currency page having all the fields all list_grid_card views
    And Check view having all the below fields
		|  Currency Code  | Currency Name  |  Currency Precision  | Currency Precision	Equivalent Indicator  |  	Start Date  |   End Date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    |  Currency Code  | Currency Name  |  Currency Precision  | Currency Precision	Equivalent Indicator  |  	Start Date  |   End Date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    |  Currency Code  | Currency Name  |  Currency Precision  | Currency Precision	Equivalent Indicator  |  	Start Date  |   End Date  |  Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in IPL Currency PAGE
  Then add new record in IPL Currency page with below values and check db "<Currency_cd>""<Currency_name>""<Currency_position>""<Equivalent_Ind>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list 
	Then Search for ipl_currency "2022 1H"
	Then check edit function is working fine for IPL status
  Examples:
	| Currency_cd  |   Currency_name  |  Currency_position  | Equivalent_Ind  | Effective_Date  |  Delete_Date  |  QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in IPL STATUS PAGE
 Then add new record in IPL Currency page with below values and check db "<Currency_cd>""<Currency_name>""<Currency_position>""<Equivalent_Ind>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list  
  Then Search for ipl_status "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     |  Currency Code  | Currency Name  |  Currency Precision  | Currency Precision	Equivalent Indicator  |  	Start Date  |   End Date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    |  Currency Code  | Currency Name  |  Currency Precision  | Currency Precision	Equivalent Indicator  |  	Start Date  |   End Date  |  Status  |
  Examples:
	| Currency_cd  |   Currency_name  |  Currency_position  | Equivalent_Ind  | Effective_Date  |  Delete_Date  |  QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
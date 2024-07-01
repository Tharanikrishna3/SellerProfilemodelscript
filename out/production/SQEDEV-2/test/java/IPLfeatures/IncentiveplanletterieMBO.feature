Feature: IPL Country Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to IPL Country PAGE
      
	@Scenario1ipl
  Scenario: Verify IPL Country page having all the fields all list_grid_card views
    And Check view having all the below fields
		|  Country Number  | Bluepages Country |  Country Name  |FMS Instance  | IOT  | IMT  |  Currency  |  Payroll System  | Country Factor  |  ISO Country  | 	Start Date  |   End Date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    |  Country Number  | Bluepages Country |  Country Name  |FMS Instance  | IOT  | IMT  |  Currency  |  Payroll System  | Country Factor  |  ISO Country  | 	Start Date  |   End Date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    |  Country Number  | Bluepages Country |  Country Name  |FMS Instance  | IOT  | IMT  |  Currency  |  Payroll System  | Country Factor  |  ISO Country  | 	Start Date  |   End Date  |  Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in IPL Country PAGE
  Then add new record in IPL Country page with below values and check db "<Country_no>""<Bluepages_country>""<Country_name>""<FMS_Instance>""<IOT>""<IMT>""<Currency>""<Payroll_systems>""<Country_factor>""<ISO_country>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list 
	Then Search for ipl_Country "2022 1H"
	Then check edit function is working fine for IPL Country
  Examples:
	| Country_no  |   Bluepages_country  |  Country_name  | FMS_Instance  |  IOT  |  IMT  |  Currency  |  Payroll_systems  |  Country_factor  |  ISO_country  |Effective_Date  |  Delete_Date  |  QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in IPL STATUS PAGE
 Then add new record in IPL Country page with below values and check db "<Country_no>""<Bluepages_country>""<Country_name>""<FMS_Instance>""<IOT>""<IMT>""<Currency>""<Payroll_systems>""<Country_factor>""<ISO_country>""<Effective_Date>""<Delete_Date>""<QUERY>"
  Then Moving to back to list  
  Then Search for ipl_Country "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     |  Country Number  | Bluepages Country |  Country Name  |FMS Instance  | IOT  | IMT  |  Currency  |  Payroll System  | Country Factor  |  ISO Country  | 	Start Date  |   End Date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
     |  Country Number  | Bluepages Country |  Country Name  |FMS Instance  | IOT  | IMT  |  Currency  |  Payroll System  | Country Factor  |  ISO Country  | 	Start Date  |   End Date  |  Status  |
  Examples:
	| Country_no  |   Bluepages_country  |  Country_name  | FMS_Instance  |  IOT  |  IMT  |  Currency  |  Payroll_systems  |  Country_factor  |  ISO_country  |Effective_Date  |  Delete_Date  |  QUERY  |
	| K | 06 | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMST_H_IPL_STATUS |
	
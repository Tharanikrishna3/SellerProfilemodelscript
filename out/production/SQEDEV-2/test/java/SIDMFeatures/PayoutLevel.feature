Feature: Payout Level verification

Background:
      Given User navigates to Home page "https://web-sfat-lz-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/COipl_status"
    	Then Login into application with the id "anacst@br.ibm.com","123"
      Then Navigate to Payout Level Page
      
	@Scenario1ipl
  Scenario: Verify Payout Level page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Min quota amt | Max quota amt |  Payout table  | Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Min quota amt | Max quota amt |  Payout table  | Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Min quota amt | Max quota amt |  Payout table  | Status  |
    
    
    @Scenario2ipl
  Scenario Outline: Verify Add Edit working fine in Payout Level page
  Then add new record in Payout Level page with below values and check db "<Min_quota_amt>""<Max_Quota_amt>""<Payout_table>"
  Then Moving to back to list 
	Then Search for Payout_level "2022 1H"
	Then check edit function is working fine for Payout Level page
  Examples:
	| Min_quota_amt  |   Max_Quota_amt  |  Payout_table  | End_date  | 
	| K | 06 | 2022-01-01  |  2022-06-30   | 
	
	@Scenario3ipl
  Scenario Outline: Verify Add Edit and cancel working fine in Payout Level Page
  Then add new record in Payout Level page with below values and check db "<Min_quota_amt>""<Max_Quota_amt>""<Payout_table>"
  Then Moving to back to list  
  Then Search for Payout_grp "2022 1H"
  Then check view working properly
  And Check view having all the below fields 
     | Min quota amt | Max quota amt |  Payout table  | Status  |
  Then check view history working properly  
   And Check view having all the below fields 
    | Min quota amt | Max quota amt |  Payout table  | Status  |
    Examples:
	| Min_quota_amt  |   Max_Quota_amt  |  Payout_table  | End_date  | 
	| K | 06 | 2022-01-01  |  2022-06-30   | 
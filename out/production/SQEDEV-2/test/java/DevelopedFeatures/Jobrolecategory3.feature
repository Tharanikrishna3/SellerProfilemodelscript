Feature: Job role Category1 verification

Background:
      Given User navigates to Home page "https://web-sfat-lx-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/PRjob_role_ctgy2"
    	Then Login into application with the id "dnowak@de.ibm.com","123"
      Then Navigate to Job Role Category2 page
      
	@Scenario1jobrolecat2
  Scenario: Verify Job Role Category2 page having all the fields all list_grid_card views
    And Check view having all the below fields
		 | Job role category 2 description |  Start Date  |  End Date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Job role category 2 description |  Start Date  |  End Date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Job role category 2 description |  Start Date  |  End Date |  Status  |
    
    
    @Scenario2jobrolecat2
  Scenario Outline: Verify Add and Edit working fine in Job Role Category2 
  Then add new record in job role Category1 page with below values and check db "<Job_role_Cat2_desc>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list 
	Then Search for job_role_cat1 "All"
	Then check edit function is working fine for Job role cat1 page
  Examples:
	| Job_role_Cat2_desc  | effective_date  |Delete_Date | Query  |
	| Test | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE_CTGY2 WHERE JOB_ROLE_CTGY2_DESC= |
	
	@Scenario3jobrolecat2
  Scenario Outline: Verify Add View and view history are working fine in JOB ROLE Category2 page
  Then add new record in job role Category1 page with below values and check db "<Job_role_Cat2_desc>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list
	Then Search for job_role_cat1 "All"
  Then check view working properly
  And Check view having all the below fields 
      | Job role category 2 description |  Start Date  |  End Date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
     | Job role category 2 description |  Start Date  |  End Date  |  Status  |
  Examples:
	| Job_role_Cat2_desc  | effective_date  |Delete_Date | Query  |
	| Test | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE_CTGY2 WHERE JOB_ROLE_CTGY2_DESC= |
	
	
	 @Scenario4jobrolecat2
  Scenario Outline: Verify Cancel working fine in JOB ROLE Category2 page
  Then add new record in job role Category1 page with below values and check db "<Job_role_Cat2_desc>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list
	Then Search for job_role_cat1 "All"
	Then check cancel functionality working fine
  Examples:
	| Job_role_Cat2_desc  | effective_date  |Delete_Date | Query  |
	| Test  | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE_CTGY2 WHERE JOB_ROLE_CTGY2_DESC= |
	
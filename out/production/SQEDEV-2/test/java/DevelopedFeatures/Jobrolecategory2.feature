Feature: Job role Category1 verification

Background:
      Given User navigates to Home page "https://web-sfat-lx-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/PRjob_role_ctgy3"
    	Then Login into application with the id "dnowak@de.ibm.com","123"
      Then Navigate to Job Role Category3 page
      
	@Scenario1jobrolecat3
  Scenario: Verify Job Role Category3 page having all the fields all list_grid_card views
    And Check view having all the below fields
		 | Job role category 3 description |  Start Date  |  End Date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Job role category 3 description |  Start Date  |  End Date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Job role category 3 description |  Start Date  |  End Date |  Status  |
    
    
    @Scenario2jobrolecat3
  Scenario Outline: Verify Add and Edit working fine in Job Role Category3
  Then add new record in job role Category1 page with below values and check db "<Job_role_Cat3_desc>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list 
	Then Search for job_role_cat1 "All"
	Then check edit function is working fine for Job role cat1 page
  Examples:
	| Job_role_Cat3_desc  | effective_date  |Delete_Date | Query  |
	| Test | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE_CTGY3 WHERE JOB_ROLE_CTGY3_DESC= |
	
	@Scenario3jobrolecat3
  Scenario Outline: Verify Add View and view history are working fine in JOB ROLE Category3 page
  Then add new record in job role Category1 page with below values and check db "<Job_role_Cat3_desc>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list
	Then Search for job_role_cat1 "All"
  Then check view working properly
  And Check view having all the below fields 
      | Job role category 3 description |  Start Date  |  End Date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
     | Job role category 3 description |  Start Date  |  End Date  |  Status  |
  Examples:
	| Job_role_Cat3_desc  | effective_date  |Delete_Date | Query  |
	| Test | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE_CTGY3 WHERE JOB_ROLE_CTGY3_DESC= |
	
	
	 @Scenario4jobrolecat3
  Scenario Outline: Verify Cancel working fine in JOB ROLE Category3 page
  Then add new record in job role Category1 page with below values and check db "<Job_role_Cat3_desc>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list
	Then Search for job_role_cat1 "All"
	Then check cancel functionality working fine
  Examples:
	| Job_role_Cat3_desc  | effective_date  |Delete_Date | Query  |
	| Test  | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE_CTGY3 WHERE JOB_ROLE_CTGY3_DESC= |
	
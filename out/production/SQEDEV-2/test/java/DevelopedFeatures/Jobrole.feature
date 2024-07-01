Feature: Job role Page verification

Background:
      Given User navigates to Home page "https://web-sfat-lx-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/PRjob_role"
    	Then Login into application with the id "dnowak@de.ibm.com","123"
      Then Navigate to Job Role Page
      
	@Scenario1jobrole
  Scenario: Verify Job Role page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Job role type  |   Job role group  |   Job role category 1  |  Job role category 2 |  Job role category 3  |  Start Date  |  End Date  |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Job role type  |   Job role group  |   Job role category 1  |  Job role category 2 |  Job role category 3  |  Start Date  |  End Date  |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Job role type  |   Job role group  |   Job role category 1  |  Job role category 2 |  Job role category 3  |  Start Date  |  End Date  |  Status  |
    
    
    @Scenario2jobrole
  Scenario Outline: Verify Add and Edit working fine in JOB ROLE PAGE
  Given delete the existing data in table "DELETE FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE WHERE JOB_ROLE_DESC LIKE 'Test234'"
  Then add new record in job role page with below values and check db "<Job_role_grp>""<Job_role_category1>""<Job_role_category2>""<Job_role_category3>""<Job_role_description>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list 
	Then Search for job_role "All"
	Then check edit function is working fine for Job role "test567"
  Examples:
	| Job_role_grp  |   Job_role_category1   |  Job_role_category2  | Job_role_category3  | Job_role_description  | effective_date  |Delete_Date | Query  |
	| BP Ecosystem 121 | Expert Labs 2 | Business Development Executive 3  |  Business Solutions Professional (BSP) 8   |  Test234  | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE |
	
	@Scenario3jobrole
  Scenario Outline: Verify Add View and view history are working fine in JOB ROLE PAGE
  Given delete the existing data in table "DELETE FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE WHERE JOB_ROLE_DESC LIKE 'Test234'"
  Then add new record in job role page with below values and check db "<Job_role_grp>""<Job_role_category1>""<Job_role_category2>""<Job_role_category3>""<Job_role_description>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list 
	Then Search for job_role "All"
  Then check view working properly
  And Check view having all the below fields 
      | Job role type  |   Job role group  |   Job role category 1  |  Job role category 2 |  Job role category 3  |  Start Date  |  End Date  |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
     | Job role type  |   Job role group  |   Job role category 1  |  Job role category 2 |  Job role category 3  |  Start Date  |  End Date  |  Status  | 
   Examples:
	| Job_role_grp  |   Job_role_category1   |  Job_role_category2  | Job_role_category3  | Job_role_description  | effective_date  |Delete_Date | Query  |
	| BP Ecosystem 121 | Expert Labs 2 | Business Development Executive 3  |  Business Solutions Professional (BSP) 8   |  Test234  | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE |
	
	
	 @Scenario4jobrole
  Scenario Outline: Verify Cancel working fine in JOB ROLE PAGE
  Given delete the existing data in table "DELETE FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE WHERE JOB_ROLE_DESC LIKE 'Test435'"
  Then add new record in job role page with below values and check db "<Job_role_grp>""<Job_role_category1>""<Job_role_category2>""<Job_role_category3>""<Job_role_description>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list 
	Then Search for job_role "All"
	Then check cancel functionality working fine
  Examples:
	| Job_role_grp  |   Job_role_category1   |  Job_role_category2  | Job_role_category3  | Job_role_description  | effective_date  |Delete_Date | Query  |
	| BP Ecosystem 121 | Expert Labs 2 | Business Development Executive 3  |  Business Solutions Professional (BSP) 8   |  Test435  | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_R_JR_JOB_ROLE |
	
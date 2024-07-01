Feature: Job role Page verification

Background:
      Given User navigates to Home page "https://w3-pre.ibm.com/finance/tools/salesperformance/fms/cg2/index.php#/PRrole_deploy_grp"
    	Then Login into application with the id "rsbastos@br.ibm.com","123"
      Then Navigate to Role deploy Group
      
	@Scenario1jobroleDeploygrp
  Scenario: Verify Job Role page having all the fields all list_grid_card views
    And Check view having all the below fields
		| Role deployment group name  | Start Date  |  End Date |  Status  |
    Then Navigate to Grid view 
    And Check view having all the below fields 
    | Role deployment group name  | Start Date  |  End Date |  Status  |
    Then Navigate to Card view
    And Check view having all the below fields 
    | Role deployment group name  | Start Date  |  End Date |  Status  |
    
    
    @Scenario2jobroleDeploygrp
  Scenario Outline: Verify Add and Edit working fine in Role Deploy Group
  Then add new record in role deploy group page with below values and check db "<Role_deployment_grp_name>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list 
	Then Search for role_deploy_grp "All"
	Then check edit function is working fine for role deploy grp
  Examples:
	| Role_deployment_grp_name  | effective_date  |Delete_Date | Query  |
	|  Test  | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_O_JR_ROLE_DEPLOY_GRP WHERE ROLE_DEPLOY_GRP_NAME=  |
	
	@Scenario3jobroleDeploygrp
  Scenario Outline: Verify Add View and view history are working fine in Role Deploy Group
  Then add new record in role deploy group page with below values and check db "<Role_deployment_grp_name>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list 
	Then Search for role_deploy_grp "All"
  Then check view working properly
  And Check view having all the below fields 
      | Role deployment group name  | Start Date  |  End Date |  Status  |
  Then check view history working properly  
   And Check view having all the below fields 
     | Role deployment group name  | Start Date  |  End Date |  Status  | 
  Examples:
	| Role_deployment_grp_name  | effective_date  |Delete_Date | Query  |
	|  Test  | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_O_JR_ROLE_DEPLOY_GRP WHERE ROLE_DEPLOY_GRP_NAME=  |
	
	
	 @Scenario4jobroleDeploygrp
  Scenario Outline: Verify Cancel working fine in Role Deploy Group
  Then add new record in role deploy group page with below values and check db "<Role_deployment_grp_name>""<effective_date>""<Delete_Date>""<Query>"
  Then Moving to back to list 
	Then Search for role_deploy_grp "All"
	Then check cancel functionality working fine
  Examples:
	| Role_deployment_grp_name  | effective_date  |Delete_Date | Query  |
	|  Test  | 2022-01-01  |  2022-06-30   | SELECT * FROM DBLFMSXR.FMSV1_O_JR_ROLE_DEPLOY_GRP WHERE ROLE_DEPLOY_GRP_NAME=  |
	
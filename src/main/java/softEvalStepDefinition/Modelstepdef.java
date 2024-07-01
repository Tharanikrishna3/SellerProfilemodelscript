package softEvalStepDefinition;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import helper.CommonHelper;
import helper.DBHelper;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import softEvalPages.BasePage;


import java.sql.SQLException;




public class Modelstepdef extends BasePage {

	public static ReportPdfUtil reportUtil;
	Date date = new Date();
	SimpleDateFormat formatter1 = new SimpleDateFormat("dd_MM_hh_mm");
	String dateName = formatter1.format(date);
	String universalpath = System.getProperty("user.dir");

	public static String eligtype;

	
	CommonHelper commonHelper = new CommonHelper();
	DBHelper dbhelper = new DBHelper();
	public static Scenario scenario;
	public static String url;
	public static String Job_role_description;
	public static String MGR_talentId;
	public static String EE_talent_id;
	@Before
	public void beforeTest(Scenario scenarioCurr) {
        scenario = scenarioCurr;
        try {
            // Get the current scenario name
            String scenarioName = scenarioCurr.getName();

            // Get the current timestamp for report name
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
            dateName = dateFormat.format(new Date());

            // Create the directory for reports
            String reportsPath = System.getProperty("user.dir") + "/reports/htmlReports/";
            File reportDirectory = new File(reportsPath);
            reportDirectory.mkdirs();

            // Initialize ReportPdfUtil with appropriate parameters
            reportUtil = new ReportPdfUtil(scenarioName + "_" + dateName, reportsPath,
                    "SQE DEV 2", "Sibaranjan Gochhayat", "Tharani.K", "Zachary Mahl", "Anand Ingole", "Anand Ingole",
                    "https://web-sfat-lx-cg3.fms-frontend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/home",
                    "Automated", "Cucumber Java", "Regression testing");

            // Print the report with a title and scenario name
            reportUtil.printReport(11);
            reportUtil.printMessage(scenarioName);

            // Wait for 5 seconds (for demonstration purposes only)
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
   
	@Then("Triggering the model")
    public void postRequest() {
        // Setting the base URI
        RestAssured.baseURI = "https://sp-datablocks-requesthandler-sfat-seller-profile.fms-backend-dev-665928ed0d217537ce7ae6f03961fb79-0000.us-south.containers.appdomain.cloud/DataBlocks";

        // Creating request specification
        RequestSpecification request = RestAssured.given();

        // Constructing request body
        String requestBody = "{\n" +
                "    \"SYSTEM_CODE\": \"Auto\",\n" +
                "    \"PROCESS_CD\":\"seller_manage\",\n" +
                "    \"MODULE_CODE\": \"SELLER_PROFILE\",\n" +
                "    \"MODEL_CD\": \"918\",\n" +
                "    \"EFFC_DATE\":\"2024-01-01\",\n" +
                "    \"DLET_DATE\":\"2024-06-30\"\n" +
                "}";

        // Sending POST request and capturing response
        Response response = request.body(requestBody).post();

        // Printing response
        System.out.println(response.asString());
    }
	

    @Given("Triggering the Seller reconcile model through FMST_O_SP_KAFKA_MSG table")
    public void triggeringModel_reconcile() {
        String query = "INSERT INTO DBLFMSXR.FMSV1_O_SP_KAFKA_MSG (KAFKA_PART_KEY, MSG_BODY, MODEL_CD, EFFC_DATE, DLET_DATE, APPR_STATUS, LAST_ACT_USER_ID, CREATE_TIMESTAMP, LAST_ACT_SYS_CD, MODEL_STATUS, LAST_UPT_TIME)\n" +
                "VALUES ('0', '{\"EVENT_CD\":\"SP_HR_EE_RECONCILE\",\"MODEL_NAME\":\"Seller Profile Reconcile\",\"FMS_SYS_ATTRIB\":\"SELLER_PROFILE\"}', '888', '2024-01-01', '2024-06-30', 'Approved  ', 0, CURRENT TIMESTAMP, 'EDFMS', 'Initiated', CURRENT TIMESTAMP) ";

       
            boolean insertDB = dbhelper.InsertQueryPrimarykey(query);
            if (insertDB) {
                reportUtil.printMessage("The record inserted into the FMSV1_O_SP_KAFKA_MSG table");
                System.out.println("The record inserted into the FMSV1_O_SP_KAFKA_MSG table");
            } else {
                reportUtil.printMessage("The record not inserted into the FMSV1_O_SP_KAFKA_MSG table");
            }
        
    }
	
    @Given("Triggering the model through FMSV_O_SP_KAFKA_MSG table")
    public void triggeringModel() {
        String query = "INSERT INTO DBLFMSXR.FMSV1_O_SP_KAFKA_MSG (KAFKA_PART_KEY, MSG_BODY, MODEL_CD, EFFC_DATE, DLET_DATE, APPR_STATUS, LAST_ACT_USER_ID, CREATE_TIMESTAMP, LAST_ACT_SYS_CD, MODEL_STATUS, LAST_UPT_TIME)\n" +
                "VALUES ('0', '{\"EVENT_CD\":\"SELLER_MANAGE\",\"MODEL_NAME\":\"Seller Manage\",\"FMS_SYS_ATTRIB\":\"SELLER_PROFILE\"}', '918', '2024-01-01', '2024-06-30', 'Approved  ', 0, CURRENT TIMESTAMP, 'EDFMS', 'Initiated', CURRENT TIMESTAMP) ";

       
            boolean insertDB = dbhelper.InsertQueryPrimarykey(query);
            if (insertDB) {
                reportUtil.printMessage("The record inserted into the FMSV1_O_SP_KAFKA_MSG table");
                System.out.println("The record inserted into the FMSV1_O_SP_KAFKA_MSG table");
            } else {
                reportUtil.printMessage("The record not inserted into the FMSV1_O_SP_KAFKA_MSG table");
            }
        
    }

	
	@Then("Triggering the Seller Level Manage model through FMST_O_SP_KAFKA_MSG table")
	public void triggeringmodel_selelr_levelMange() throws Throwable {
		
		String query="INSERT\n"
				+ "	INTO\n"
				+ "	DBLFMSXR.FMSV1_O_SP_KAFKA_MSG (KAFKA_PART_KEY, MSG_BODY, MODEL_CD, EFFC_DATE, DLET_DATE, APPR_STATUS, LAST_ACT_USER_ID, CREATE_TIMESTAMP, LAST_ACT_SYS_CD, MODEL_STATUS, LAST_UPT_TIME)\n"
				+ "VALUES ('0', '{\"EVENT_CD\": \"SELLER_LEVEL_MANAGE\",\"MODEL_NAME\": \"Seller Level Manage\",\"FMS_SYS_ATTRIB\": \"SELLER_PROFILE\"}', '917', '2024-01-01', '2024-06-30', 'Approved  ', 0, CURRENT TIMESTAMP, 'EDFMS', 'Initiated', CURRENT TIMESTAMP) ";
		boolean insertDB=dbhelper.InsertQueryPrimarykey(query);
		if (insertDB) {
			reportUtil.printMessage("The record inserted into the FMSV1_O_SP_KAFKA_MSG table");
			System.out.println("The record inserted into the FMSV1_O_SP_KAFKA_MSG table");
		} else
			reportUtil.printMessage("The record not inserted into the FMSV1_O_SP_KAFKA_MSG table");
	}
	
	@Then("Test data setup with this data to be deleted or updated {string}")
    public void dataDeleteOrUpdate(String query) {
        
            try {
				dbhelper.deleteudpatedataindb(query);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
         
	}
	
	


	
	@Given("Check the data populated fine or not after triggering model in Line management table with updated values in sellercnum {string},{string},{string},{string}")
    public void checkDataPopulated(String MGR_TalentID, String Emailid, String name, String notesId) {
        try {
            // Update the data in FMST_R_ED_EXTRACT table
            String formUpdateQuery = "UPDATE DBLFMSXR.FMST_R_ED_EXTRACT SET IID ='" + Emailid + "' , EE_NAME='" + name + "' , EE_NOTES_ID ='" + notesId + "'  WHERE EE_TALENT_ID ='" + MGR_TalentID + "'";
            dataDeleteOrUpdate(formUpdateQuery);

            // Trigger the model
            triggeringModel();

            // Check if data is populated correctly in DBLFMSXR.FMSV1_O_SP_SELLER_LINE_MGMT table
            String getLM1cnum = "SELECT LM1_CNUM FROM DBLFMSXR.FMSV1_O_SP_SELLER_LINE_MGMT WHERE LM1_EMAIL ='" + Emailid + "' AND LM1_NAME ='" + name + "' AND LM1_NOTES_ID ='" + notesId + "' AND LM1_CNUM ='" + MGR_TalentID + "'  AND DLET_DATE IS  NULL ";
            String lm1cnum = dbhelper.checkdbbsp(getLM1cnum);
            System.out.println("LM1 CNUM: " + lm1cnum);

            // Print result based on comparison
            if (MGR_TalentID.equalsIgnoreCase(lm1cnum)) {
                reportUtil.printMessage("The data has been populated correctly in the database");
                System.out.println("The data has been populated correctly in the database");
            } else {
                reportUtil.printMessage("The data has not been populated correctly in the database");
                System.out.println("The data has not been populated correctly in the database");
            }
        } catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	
	

	
	
	public String gettingSeller_id() throws SQLException {
        String formquery="SELECT SELLER_ID FROM DBLFMSXR.FMST_O_SP_SELLER WHERE SELLER_CNUM='"+EE_talent_id+"'";
        String Seller_Id=dbhelper.checkdbbsp(formquery);
        return Seller_Id;
    }
	
	
	@Given("Check the data populated fine or not after triggering model in Line management table with this EE_TALENT_ID {string}")
    public void checkLineManagement(String EE_talent_idd) throws Throwable {
        String eeTalentId = EE_talent_idd;

        String mgrTalentIdQuery = "SELECT EE_TALENT_ID FROM DBLFMSXR.FMST_R_ED_EXTRACT WHERE EE_TALENT_ID = (SELECT  EE_TALENT_ID FROM DBLFMSXR.FMST_R_ED_EXTRACT WHERE EE_TALENT_ID !='" + eeTalentId + "' ORDER BY LAST_UPT_TIME ASC LIMIT 1)";
        String mgrTalentId = dbhelper.checkdbbsp(mgrTalentIdQuery);

        String updateQuery = "UPDATE DBLFMSXR.FMST_R_ED_EXTRACT SET MGR_TALENT_ID ='" + mgrTalentId + "' WHERE EE_TALENT_ID ='" + eeTalentId + "'";
        dataDeleteOrUpdate(updateQuery);
        triggeringModel();

        String lm1CnumQuery = "SELECT LM1_CNUM FROM DBLFMSXR.FMSV1_O_SP_SELLER_LINE_MGMT WHERE SELLER_ID IN (SELECT SELLER_ID FROM DBLFMSXR.FMST_O_SP_SELLER WHERE SELLER_CNUM ='" + eeTalentId + "') ORDER BY LAST_UPT_TIME DESC LIMIT 1";
        String lm1Cnum = dbhelper.checkdbbsp(lm1CnumQuery);

        if (mgrTalentId.equalsIgnoreCase(lm1Cnum)) {
            reportUtil.printMessage("The data has been populated correctly in db");
            System.out.println("The data has been populated correctly in db");
        } else {
            reportUtil.printMessage("The data has been populated not correctly in db");
            System.out.println("The data is not populated correctly in db");
        }
    }
	
	
	
	@Given("Check the data populated fine or not after triggering model If the record not present in ed extract table")
	public  void checkinsellertable() throws Throwable {
		
		String formquery="SELECT EE_TALENT_ID FROM DBLFMSXR.FMST_R_ED_EXTRACT WHERE EE_TALENT_ID = (SELECT  EE_TALENT_ID FROM DBLFMSXR.FMST_R_ED_EXTRACT ORDER BY LAST_UPT_TIME ASC LIMIT 1)";
		EE_talent_id=dbhelper.checkdbbsp(formquery);
		String Seller_Id=gettingSeller_id();

		String formupdatequery="DELETE FROM DBLFMSXR.FMST_R_ED_EXTRACT WHERE EE_TALENT_ID ='"+EE_talent_id+"'";
		dataDeleteOrUpdate(formupdatequery);
		triggeringModel();
		
		
		String getseller_id="SELECT SELLER_ID FROM DBLFMSXR.FMST_O_SP_SELLER_POSN  WHERE SELLER_ID ='"+Seller_Id+"' AND DLET_DATE IS NOT null";
		getseller_id=dbhelper.checkdbbsp(getseller_id);
		
		if(Seller_Id.equalsIgnoreCase(getseller_id))
		{
			reportUtil.printMessage("The data has been populated correctly in db");
			System.out.println("The data has been populated correctly in db");
		} else {
			reportUtil.printMessage("The data has been populated not correctly in db");
		System.out.println("The data is not populated correctly in db");
		}
	}
	@Given("Check the data populated fine or not after triggering model in Line management table with invalid sellercnum {string}")
	public  void checkinlinemgmtinvalid(String EE_talentID) throws Throwable {
		String LM1_CNUM="INVAL124";
		String formquery="SELECT SELLER_LINE_MGMT_ID FROM DBLFMSXR.FMSV1_O_SP_SELLER_LINE_MGMT  WHERE SELLER_ID IN (SELECT SELLER_ID FROM DBLFMSXR.FMST_O_SP_SELLER where SELLER_CNUM='"+ EE_talentID+"' )";
		 String SELLER_LINE_MGMT_ID=dbhelper.checkdbbsp(formquery);
		String Correctcnumquery="SELECT MGR_TALENT_ID FROM DBLFMSXR.FMST_R_ED_EXTRACT WHERE EE_TALENT_ID = (SELECT SELLER_CNUM FROM DBLFMSXR.FMST_O_SP_SELLER WHERE SELLER_ID = (SELECT SELLER_ID FROM DBLFMSXR.FMSV1_O_SP_SELLER_LINE_MGMT WHERE SELLER_LINE_MGMT_ID ="+SELLER_LINE_MGMT_ID+"))";
		String SELLER_CNUM=dbhelper.checkdbbsp(Correctcnumquery);
		System.out.println("SELLER_CNUM"+SELLER_CNUM);
		
		String SellerId="SELECT SELLER_ID FROM DBLFMSXR.FMST_O_SP_SELLER where SELLER_CNUM='"+ EE_talentID+"'";
		SellerId=dbhelper.checkdbbsp(SellerId);
		System.out.println("SellerId"+SellerId);
		String formupdatequery="UPDATE DBLFMSXR.FMSV1_O_SP_SELLER_LINE_MGMT SET LM1_CNUM ='"+LM1_CNUM+"' WHERE SELLER_LINE_MGMT_ID ='"+SELLER_LINE_MGMT_ID+"'";
		dataDeleteOrUpdate(formupdatequery);
		triggeringModel();
		
		String getLM1cnum="SELECT LM1_CNUM FROM DBLFMSXR.FMSV1_O_SP_SELLER_LINE_MGMT WHERE SELLER_LINE_MGMT_ID ='"+SELLER_LINE_MGMT_ID+"' AND DLET_DATE IS NOT NULL";
		getLM1cnum=dbhelper.checkdbbsp(getLM1cnum);
		System.out.println("getLM1cnum"+getLM1cnum);
		if(LM1_CNUM.equalsIgnoreCase(getLM1cnum))
		{
			reportUtil.printMessage("The data has been populated correctly in db");
			System.out.println("The data has been populated correctly in db");
		} else {
			reportUtil.printMessage("The data has been populated not correctly in db");
		System.out.println("The data is not populated correctly in db");
		}
		 getLM1cnum="SELECT LM1_CNUM FROM DBLFMSXR.FMSV1_O_SP_SELLER_LINE_MGMT WHERE SELLER_ID ='"+SellerId+"' AND DLET_DATE IS  NULL";
		 getLM1cnum=dbhelper.checkdbbsp(getLM1cnum);
		 if(SELLER_CNUM.equalsIgnoreCase(getLM1cnum))
		{
			reportUtil.printMessage("The data has been populated correctly in db");
			System.out.println("The data has been populated correctly in db");
		} else {
			reportUtil.printMessage("The data has been populated not correctly in db");
		System.out.println("The data is not populated correctly in db");
		}
		
	}
	
	
	
	
	@Given("Check the data populated fine or not after triggering model {string}")
	public void checkdbSAT(String QUERY) throws Throwable {
		boolean checkdb = dbhelper.checkdbb(QUERY);
		if (checkdb) {
			reportUtil.printMessage("The data has been populated correctly in db");
			System.out.println("The data has been populated correctly in db");
		} else {
			reportUtil.printMessage("The data has been populated not correctly in db");
		System.out.println("The data is not populated correctly in db");
	}
	}
	
	@Given("Check the data populated fine or not after triggering model its should empty {string}")
	public void checkdbSATempty(String QUERY) throws Throwable {
		boolean checkdb = dbhelper.checkdbb(QUERY);
		if (checkdb) {
			reportUtil.printMessage("The data has been populated not correctly in db");
			System.out.println("The data is not populated correctly in db");
		} else {
			
			reportUtil.printMessage("The data has been populated correctly in db");
			System.out.println("The data has been populated correctly in db");
			
			
			
	}
	}
	
	

	@After
	public void afterRun(Scenario scenario) {
		reportUtil.printReport(12);

		if (scenario.isFailed()) {
			scenario.write("Test Failed");
		} else {
			scenario.write("Test passed");
		}

		

		
	}
}

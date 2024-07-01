package testRunner;

import org.junit.AfterClass;
import org.junit.runner.RunWith;
import com.github.mkolisnyk.cucumber.reporting.CucumberResultsOverview;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import helper.CommonHelper;
import softEvalPages.BasePage;

@RunWith(Cucumber.class) 

@CucumberOptions
(
		features = {
				"./src/test/java/Sellerprofilemodels/",	
		},
		glue={"softEvalStepDefinition"},
		plugin= { "pretty","json:target/cucumber.json"},
		tags = {"@Scenario3SellerReconcilemodel"},
		monochrome = true
		) 
public class RunnerSales_Batch1 {
	static CommonHelper commonHelper = new CommonHelper();

	@AfterClass  
	public static void generateReport() throws Exception {
			
		CucumberResultsOverview results = new CucumberResultsOverview();
		String getCurrentDirectory = System.getProperty("user.dir");
		results.setOutputDirectory(getCurrentDirectory+"/reports/htmlReports/reports/");
		results.setOutputName("cucumberresults");
		results.setSourceFile(getCurrentDirectory+"/target/cucumber.json");
		results.execute();
		if (!(BasePage.driver==null)) {
			if (BasePage.driver.toString().contains("RemoteWebDriver: android on ANDROID")) {
				//BasePage.service.stop();
			}else {
			 	{ 
BasePage.driver.quit();  
				} 
			}
		}
		if (!(commonHelper.getDataProperty("testData", "runningPlatform").equalsIgnoreCase("system"))) {
//			commonHelper.htmlReportCopy();
		}
	}
}

	


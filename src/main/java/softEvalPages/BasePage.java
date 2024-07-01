package softEvalPages;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

import helper.CommonHelper;
import helper.OSUtils;
import helper.WebHelper;


//Base Page Driver Initialization
public class BasePage {

	public static RemoteWebDriver driver;
	public static Properties prop;
	CommonHelper commonHelper = new CommonHelper();
	static String getCurrentDirectory = System.getProperty("user.dir");
	public static String screenShotFile = "Screenshot_"+System.currentTimeMillis()+".png";
	static WebHelper webHelper = new WebHelper(driver);

	public BasePage() {
		prop = new Properties();
		try {
			if(OSUtils.WINDOWS) {
				FileInputStream fis = new FileInputStream(getCurrentDirectory+"\\resources\\testData.properties");
				prop.load(fis);
			}
			else {
				FileInputStream fis = new FileInputStream(getCurrentDirectory+"/resources/testData.properties");
				prop.load(fis);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void initialization(String url) throws MalformedURLException {
		String browserName = prop.getProperty("browser");
		//String url = prop.getProperty("urlHome");
		

		if(prop.getProperty("runningPlatform").equalsIgnoreCase("system")) {
			if (browserName.equalsIgnoreCase("Chrome")) {
				
					if(OSUtils.WINDOWS) {
						System.setProperty("webdriver.chrome.driver", getCurrentDirectory+"\\drivers\\chromedriver.exe");
					}
					else {
						System.out.println("Launch");
						
						System.setProperty("webdriver.chrome.driver", getCurrentDirectory+"/drivers/mac/chromedriver");
					}

					if (prop.getProperty("browserHeadless").contains("True")) {
						ChromeOptions co = new ChromeOptions();
						co.addArguments("window-size=1400,600");
						co.addArguments("headless");
						driver = new ChromeDriver(co);
					}else {
						
						driver = new ChromeDriver();
						driver.manage().window().maximize();
					}
			
				}
			}

			try {
				driver.get(url);
				
				Thread.sleep(6000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	

	public static void takeScreenShotAA() {
		File src= ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		try {
			if(OSUtils.WINDOWS) {
				FileUtils.copyFile(src, new File(getCurrentDirectory+"\\reports\\screenshots\\"+screenShotFile));
			}
			else {
				FileUtils.copyFile(src, new File(getCurrentDirectory+"/reports/screenshots/"+screenShotFile));
			}

		} catch (Exception e) {

		}
	}

	

}

package testRunner;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class Sample {
public static void main(String args[])
{
	System.out.println("thara");
	System.setProperty("webdriver.chrome.driver", "/Users/tharanik/Desktop/SQE-DEV-2/Automation/CG3-Migration-Final/SQEDEV-2/drivers/mac/chromedriver");
	System.out.println("thara");
	
	ChromeDriver driver=new ChromeDriver();
	System.out.println("thara");
	driver.get("https://www.youtube.com/watch?v=h-1bon3dMac");
	
}
}

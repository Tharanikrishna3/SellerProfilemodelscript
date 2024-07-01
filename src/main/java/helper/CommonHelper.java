package helper;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.ResourceBundle;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.assertthat.selenium_shutterbug.core.PageSnapshot;
import com.assertthat.selenium_shutterbug.core.Shutterbug;
import com.assertthat.selenium_shutterbug.utils.web.ScrollStrategy;

import softEvalPages.BasePage;
import softEvalStepDefinition.ReportPdfUtil;


public class CommonHelper {

	public static void highlighter(WebDriver firefoxDriver, WebElement webElement, String px) {
		((JavascriptExecutor) firefoxDriver).executeScript("arguments[0].setAttribute('style', arguments[1]);",
				webElement, "border: " + px + "px solid red;");
	}

	

	public static void Unhighlighter(WebDriver firefoxDriver, WebElement webElement) {
		if (firefoxDriver instanceof JavascriptExecutor) {
			((JavascriptExecutor) firefoxDriver).executeScript("arguments[0].style.border=''", webElement);
		}

	}
	
	public static void printScreenShotToReport(WebDriver driver,ReportPdfUtil reportUtil) throws Exception {
		File screenshotPath = (java.io.File)((org.openqa.selenium.TakesScreenshot)driver).getScreenshotAs(org.openqa.selenium.OutputType.FILE);
	    reportUtil.printImageIntoReport(screenshotPath);
		 Thread.sleep(3000);
		
	}
	public String getDataProperty(String fileName, String property) {
		Properties prop = new Properties();
		String getCurrentDirectory = System.getProperty("user.dir");
		try {
			if (OSUtils.WINDOWS) {
				FileInputStream fis = new FileInputStream(
						getCurrentDirectory + "\\resources\\" + fileName + ".properties");
				prop.load(fis);
			} else {
				FileInputStream fis = new FileInputStream(
						getCurrentDirectory + "/resources/" + fileName + ".properties");
				prop.load(fis);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return prop.getProperty(property);
	}

	
	public void htmlReportCopy() throws Exception {
		String getCurrentDirectory = System.getProperty("user.dir");
		String sourceDirectory = "";
		String destinationDirectory = "";
		String reportPath = "";
		String folderName = System.getProperty("RunnerClass").replace(".java", "")+"_" +getCurrentDateTime();
		if (OSUtils.WINDOWS) {
			sourceDirectory = getCurrentDirectory + "\\reports\\htmlReports\\reports\\";
			destinationDirectory = getCurrentDirectory + "\\reports\\htmlReports\\"+folderName;
		} else {
			sourceDirectory = getCurrentDirectory + "/reports/htmlReports/reports/";
			destinationDirectory = getCurrentDirectory + "/reports/htmlReports/"+folderName;
		}
		new File(destinationDirectory).mkdirs();
		File srcDir = new File(sourceDirectory);
		File destDir = new File(destinationDirectory);
		FileUtils.copyDirectory(srcDir, destDir);
		if (OSUtils.WINDOWS) {
			reportPath = destinationDirectory+"\\cucumberresults-feature-overview.html";
		}else {
			reportPath = destinationDirectory+"/cucumberresults-feature-overview.html";
		}
		BufferedReader br = new BufferedReader(new FileReader(reportPath));
		String line = null;
		StringBuffer sb =  new StringBuffer();
		while((line = br.readLine())!= null)
		{
			if(line.contains("<h1>Overview Chart</h1>"))
			{
				line = line.replace("<h1>Overview Chart</h1>", "<h1>Overview Chart</h1>"+"\n"+"<a href=\"./index.html"+"\">Click here to see steps</a>");
			}
			sb.append(line+"\n"); 

		}
		br.close();
		BufferedWriter bw = new BufferedWriter(new FileWriter(reportPath));
		bw.write(sb.toString());
		bw.close();

		
		//Zip Folder
		String folderToZip = destinationDirectory;
		String zipName = destinationDirectory+".zip";
		zipFolder(Paths.get(folderToZip), Paths.get(zipName));

	}

	// Uses java.util.zip to create zip file
	public void zipFolder(Path sourceFolderPath, Path zipPath) throws Exception {
		ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipPath.toFile()));
		Files.walkFileTree(sourceFolderPath, new SimpleFileVisitor<Path>() {
			public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
				zos.putNextEntry(new ZipEntry(sourceFolderPath.relativize(file).toString()));
				Files.copy(file, zos);
				zos.closeEntry();
				return FileVisitResult.CONTINUE;
			}
		});
		zos.close();
	}

	public String getReportConfigPath() {
		String reportConfigPath = getDataProperty("other", "reportConfigPath");
		if (reportConfigPath != null)
			return reportConfigPath;
		else
			throw new RuntimeException(
					"Report Config Path not specified in the Configuration.properties file for the Key:reportConfigPath");
	}

	public String stringFormater(String str, String formater) {
		str = String.format(str, formater);
		return str;
	}
public String generateRandomsmallletters(int size)
{
	String aToZ = "abcdefghijklmnopqrstuvwxyz";
	int n = size;
	Random rand = new Random();
	StringBuilder res = new StringBuilder();
	for (int i = 0; i < n; i++) {
		int randIndex = rand.nextInt(aToZ.length());
		res.append(aToZ.charAt(randIndex));
	}
	return res.toString();
}
	public String generateRandom() {
		String aToZ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		int n = 5;
		Random rand = new Random();
		StringBuilder res = new StringBuilder();
		for (int i = 0; i < n; i++) {
			int randIndex = rand.nextInt(aToZ.length());
			res.append(aToZ.charAt(randIndex));
		}
		return res.toString();
	}

	public String generatePIN() {
		return "" + ((int) (Math.random() * 9000) + 1000);
	}

	public int generateRandomNumberFromRange(int endrange) {
		Random rn = new Random();
		int num = 0;
		num = rn.nextInt(endrange);
		if (num == 0) {
			num = rn.nextInt(endrange);
		}
		return num;
	}

	
	public static byte[] takeFullPageScreenShotShutterBugAsByte() throws Exception {
		PageSnapshot shootPage = Shutterbug.shootPage(BasePage.driver,ScrollStrategy.WHOLE_PAGE, 500, true);
		BufferedImage originalImage = shootPage.getImage();
		try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
			ImageIO.write(originalImage, "png", baos);
			baos.flush();
			return baos.toByteArray();
		}
		
	}

	public String getCurrentDate() {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");  
		Date date = new Date();  
		return formatter.format(date); 
	}

	public String getCurrentDateTime() {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy HHmmss");  
		Date date = new Date();  
		return formatter.format(date); 
	}

	public void updateFileText(String filePath, String searchText, String replaceText) {
		try {
			BufferedReader br = new BufferedReader(new FileReader(filePath));
			String line = null;
			StringBuffer sb =  new StringBuffer();
			while((line = br.readLine())!= null)
			{
				if(line.contains(searchText))
				{
					line = line.replace(searchText, replaceText);
				}
				sb.append(line+"\n"); 
			}
			br.close();
			BufferedWriter bw = new BufferedWriter(new FileWriter(filePath));
			bw.write(sb.toString());
			bw.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static void screenshot(WebDriver driver)
	{
		DateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy hh:mm:ss");
		Date date = new Date();
	try {
	    TakesScreenshot ts = (TakesScreenshot) driver;
	    File source = ts.getScreenshotAs(OutputType.FILE);
	    FileUtils.copyFile(source, new File("./ScreenShots/"+ dateFormat.format(date) + ".png"));
	    
	} 
	catch (Exception e) 
	{
	    System.out.println("Exception while taking ScreenShot "+e.getMessage());
	}


	}

	
}

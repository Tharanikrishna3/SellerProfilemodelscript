package helper;


import java.util.List;
import java.util.Random;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import softEvalPages.BasePage;


public class WebHelper {
	WebDriver driver;
	JavascriptExecutor js = (JavascriptExecutor) driver;
	BasePage basePage = new BasePage();
	CommonHelper commonHelper = new CommonHelper();

	public WebHelper(WebDriver driver) {
		this.driver =driver;
	}

	public WebElement getWebElement(WebDriver driver, String locator, String locatorType) {
		WebElement element = null;
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
		}
		if (locatorType.contains("xpath")) {
			element = driver.findElement(By.xpath(locator));
		}else if (locatorType.contains("id")) {
			element = driver.findElement(By.id(locator));
		}else if (locatorType.contains("name")) {
			element = driver.findElement(By.name(locator));
		}else if (locatorType.contains("CSS")) {
			element = driver.findElement(By.cssSelector(locator));
		}
		return element;
	}

	public void scrollUpAndDown(WebDriver driver, String direction) {
		js = (JavascriptExecutor) driver;
		if (direction.equalsIgnoreCase("Down")) {
			js.executeScript("javascript:window.scrollBy(0,200)");
		}else if (direction.equalsIgnoreCase("UP")) {
			js.executeScript("javascript:window.scrollBy(0,0)");
		}
	}

	public void scrollrightLeft(WebDriver driver, String direction) {
		js = (JavascriptExecutor) driver;
		if (direction.equalsIgnoreCase("Right")) {
			js.executeScript("javascript:window.scrollBy(500,0)");
		}else if (direction.equalsIgnoreCase("Left")) {
			js.executeScript("javascript:window.scrollBy(0,0)");
		}
	}

	public void scrollToElement(WebElement ele) {
		js = (JavascriptExecutor) driver;
		js.executeScript("arguments[0].scrollIntoView(true);", ele);
		js.executeScript("javascript:window.scrollBy(0,-250)");
	}

	public void scrollToElementA(WebElement ele) {
		js = (JavascriptExecutor) driver;
		js.executeScript("arguments[0].scrollIntoView(true);", ele);
	}

	public void jScriptClickElement(WebDriver driver, WebElement ele) {
		try {
			js = (JavascriptExecutor) driver;
			js.executeScript("arguments[0].click();", ele);

		} catch (Exception e) {
			ele.click();
			e.printStackTrace();
		}
	}

	public void setAtributeJScript(WebElement ele, String attribute, String value) {
		js = (JavascriptExecutor) driver;
		js.executeScript("arguments[0].setAttribute('"+attribute+"', '"+value+"')",ele);
	}

	public void selectDropDownByVisibleText(WebElement ele,String selectvalue) {
		Select obj = new Select(ele);
		obj.selectByVisibleText(selectvalue);
	}

	public void selectDropDownByIndex(WebElement ele,int indexNumber) {
		Select obj = new Select(ele);
		obj.selectByIndex(indexNumber);
	}

	public void mouseHoverAndClick(WebElement ele) {
		//mouseHoverOnElement(ele);
		ele.click();
	}

	public void selectDropDownByClick(String eleStr,String selectvalue) {
		String content = commonHelper.stringFormater(eleStr, selectvalue);
		WebElement viewByDropdownWE = getWebElement(driver, content, "xpath");
		viewByDropdownWE.click();
	}

	public void deselectAllDropDownByVisibleText(WebElement ele) {
		try {
			Select obj = new Select(ele);
			obj.deselectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deselectDropDownByVisibleText(WebElement ele,String selectvalue) {
		try {
			Select obj = new Select(ele);
			obj.deselectByVisibleText(selectvalue);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void actionClick(WebElement ele) {
		try {
			Actions builder = new Actions(driver);
			builder.moveToElement(ele).click(ele).build().perform();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void mouseHoverOnElement(WebElement ele) {
		Actions action = new Actions(driver);
		action.moveToElement(ele).build().perform();
	}

	public void handleAlert()  {
		WebElement ele= driver.findElement(By.xpath("//div[@id='overlayAlert']/p/button"));
		if (ele.isDisplayed()) {
			ele.click();
		}else {
			System.out.println("");
		}
	}

	public void waitSuspend(int waitSecond) {
		try {
			Thread.sleep(waitSecond*1000);
		} catch (InterruptedException e) {
		}
	}

	


	public List<WebElement> getWebElements(WebDriver driver, String locator, String locatorType) {
		List<WebElement> elements = null;
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
		}
		if (locatorType.contains("xpath")) {
			elements = driver.findElements(By.xpath(locator));
		}else if (locatorType.contains("id")) {
			elements = driver.findElements(By.id(locator));
		}else if (locatorType.contains("name")) {
			elements = driver.findElements(By.name(locator));
		}else if (locatorType.contains("CSS")) {
			elements = driver.findElements(By.cssSelector(locator));
		}
		return elements;
	}

	public int getDropdownOptions(WebElement dropdownWE) {
		Select dropdown = new Select(dropdownWE); 
		int optionsCount = dropdown.getOptions().size();
		int indexToBeChosen= generateRandomnumber(optionsCount);
		return indexToBeChosen;
	}

	public int generateRandomnumber(int optionsCount) {
		if(optionsCount==1) {
			return optionsCount;
		}
		else {
		Random rand = new Random();
		int rand_int = rand.nextInt(optionsCount-1);
		return rand_int;
		}
		
	}

	public String getSelectedDropdownvalue(WebElement webelement) {
		Select obj = new Select(webelement);
		WebElement selectedOption = obj.getFirstSelectedOption();
		String dropdownValue = selectedOption.getText();
		return dropdownValue;
	}
	
	public void selectDropDown(String dropDownName, String optionToSelect) {
		getWebElement(driver, dropDownName, "xpath").click();
		getWebElement(driver, optionToSelect, "xpath").click();
	}

}



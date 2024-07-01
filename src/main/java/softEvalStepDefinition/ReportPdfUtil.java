package softEvalStepDefinition;


import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;

import helper.DBHelper;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

import com.itextpdf.text.pdf.BaseFont;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Vector;


import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

import java.net.URI;
//import java.net.http.HttpClient;
//import java.net.http.HttpRequest;
//import java.net.http.HttpResponse;
import java.net.HttpURLConnection;





/**
 * Project : codegen Created : java
 * 
 * @param <PdfFont>
 */
public class ReportPdfUtil 
{

	private String reportFileName, reportFileFoler;
	private static String reportFileFullPath;
	private BaseFont COURIER_BOLD;
	private boolean isFirst = true;

	private String moduleName, developerName, testerName, poName, imName, baName, envirName, typeOfTest, testTool, executeDate, storyNo;

	Font objectFont = new Font(COURIER_BOLD, 12, Font.UNDERLINE);
	Font titleFont = new Font(COURIER_BOLD, 12, Font.BOLD);
	Font normalFont = new Font(COURIER_BOLD, 12);
	Font sqlFont = new Font(COURIER_BOLD, 9);
	Font redFont = new Font(COURIER_BOLD, 12, Font.BOLD);

	Document doc = null;
	FileOutputStream steam = null;
	PdfWriter pdfWriter = null;
	private Response response;
public ReportPdfUtil()
{
	System.out.println("checking");
}
	public ReportPdfUtil(String testCaseReportName, String reportFileFoler, String moduleName, String developerName, String testerName, String poName, String imName,
			String baName, String envirName, String typeOfTest, String testTool, String storyNo) 
	{
		System.out.println("checking");
		reportFileName = testCaseReportName;
		this.reportFileFoler = reportFileFoler;
		// Added new
		this.moduleName = moduleName;
		this.developerName = developerName;
		this.testerName = testerName;
		this.poName = poName; 
		this.imName = imName;
		this.baName = baName;
		this.envirName = envirName;
		this.typeOfTest = typeOfTest;
		this.testTool = testTool;
		// this.executeDate=executeDate;
		this.storyNo = storyNo;

		setReportFileFullPath();
		setReportFile();
	}

	private void setReportFileFullPath()
	{
		reportFileFullPath = reportFileFoler + "/" + reportFileName + ".pdf";
	}

	private void setReportFile()
	{

		try {
			File report_file = new File(reportFileFullPath);
			File parent = report_file.getParentFile();
			System.out.println("Parent file"+parent);

			if (!report_file.exists()) {
				report_file.createNewFile();
			}
			doc = new Document(PageSize.A4);
			steam = new FileOutputStream(reportFileFullPath, true);
			pdfWriter = PdfWriter.getInstance(doc, steam);
			doc.open();
			System.out.println("path is "+reportFileFullPath);

		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void printReport(int msg)
	{
		SimpleDateFormat formatter=new SimpleDateFormat("dd-MMM-yyyy");
		String curr_date_curr_zone = formatter.format(new Date());
		

		switch (msg) 
		{
		

		case 11:
			try {
				Paragraph p = new Paragraph();
				p.setFont(objectFont);
				Chunk c = new Chunk("Testing type:");
				c.setFont(titleFont);
				p.add(c);
				Chunk c1 = new Chunk(storyNo);
				c1.setFont(titleFont);
				p.add(c1);
				doc.add(p);

				p = new Paragraph();
				doc.add(p);

				
				
				p = new Paragraph();
				c = new Chunk("Module Name : ");
				c.setFont(objectFont);
				p.add(c);
				c1 = new Chunk(moduleName);
				c1.setFont(normalFont);
				p.add(c1);
				doc.add(p);

				p = new Paragraph();
				doc.add(p);

				p = new Paragraph();
				c = new Chunk("Developer Name/ID : ");
				c.setFont(objectFont);
				p.add(c);
				c1 = new Chunk(developerName);
				c1.setFont(normalFont);
				p.add(c1);
				doc.add(p);

				p = new Paragraph();
				doc.add(p);

				p = new Paragraph();
				c = new Chunk("Tester Name/ID : ");
				c.setFont(objectFont);
				p.add(c);
				c1 = new Chunk(testerName);
				c1.setFont(normalFont);
				p.add(c1);
				doc.add(p);

				p = new Paragraph();
				doc.add(p);
				
				p = new Paragraph();
				c = new Chunk("Product Owner : ");
				c.setFont(objectFont);
				p.add(c);
				c1 = new Chunk(poName);
				c1.setFont(normalFont);
				p.add(c1);
				doc.add(p);

				p = new Paragraph();
				doc.add(p);
				
				p = new Paragraph();
				c = new Chunk("Iteration Manager : ");
				c.setFont(objectFont);
				p.add(c);
				c1 = new Chunk(imName);
				c1.setFont(normalFont);
				p.add(c1);
				doc.add(p);

				p = new Paragraph();
				doc.add(p);
				
				p = new Paragraph();
				c = new Chunk("Reviewer : ");
				c.setFont(objectFont);
				p.add(c);
				c1 = new Chunk(baName);
				c1.setFont(normalFont);
				p.add(c1);
				doc.add(p);

				p = new Paragraph();
				doc.add(p);

				p = new Paragraph();
				c = new Chunk("Test Environment :");
				c.setFont(objectFont);
				p.add(c);
				c1 = new Chunk(envirName);
				c1.setFont(normalFont);
				p.add(c1);
				doc.add(p);

				p = new Paragraph();
				doc.add(p);

				p = new Paragraph();
				c = new Chunk("Test Type : ");
				c.setFont(objectFont);
				p.add(c);
				c1 = new Chunk(typeOfTest);
				c1.setFont(normalFont);
				p.add(c1);
				doc.add(p);

				p = new Paragraph();
				doc.add(p);

				p = new Paragraph();
				c = new Chunk("Test automation tool : ");
				c.setFont(objectFont);
				p.add(c);
				c1 = new Chunk(testTool);
				c1.setFont(normalFont);
				p.add(c1);
				doc.add(p);

				p = new Paragraph();
				doc.add(p);

				p = new Paragraph();
				c = new Chunk("Execution Date : ");
				c.setFont(objectFont);
				p.add(c);
				c1 = new Chunk(curr_date_curr_zone);
				c1.setFont(normalFont);
				p.add(c1);
				doc.add(p);

				p = new Paragraph();
				doc.add(p);

			} 
			catch (Exception e)
			{
				e.printStackTrace();
			}
			break;
		case 12:
			try {
				Paragraph p = new Paragraph();
				doc.add(p);

				p = new Paragraph();
				Chunk c = new Chunk("End Date : ");
				c.setFont(objectFont);
				p.add(c);
				 // To print Console results into a text file 
			   
				
				Chunk c1 = new Chunk(curr_date_curr_zone);
				c1.setFont(normalFont);
				p.add(c1);
				doc.add(p);
				doc.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;
		default:
			try {
				Paragraph p = new Paragraph();
				doc.add(p);

				p = new Paragraph();
				Chunk c = new Chunk("Test");
				c.setFont(normalFont);
				p.add(c);
				doc.add(p);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public  void slackfinal()
	{
		DBHelper obj=new DBHelper();
		
				
				try {
					String pdfvalue=readpdf();
					String webhook= obj.getcredentilas("ENTITLE_URL","URL","WebHookURL","URL_NAME") ;
					
					
					System.out.println("this is slack message"+webhook);
			
					RestAssured.baseURI = webhook;
					
					RequestSpecification request = RestAssured.given();
					
					

					response = request.body("{\"text\":\"Transaction Adjustment!"+pdfvalue+"\"}")
							.post();
							
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
		
	}
	
	
	public String readpdf()
	{
		 String text="";
		 try {
			
			 File file=new File(reportFileFullPath);
			PDDocument doc = PDDocument.load(file);  
   
  //Instantiate PDFTextStripper class  
			PDFTextStripper pdfStripper = new PDFTextStripper();  

  //Retrieving text from PDF document  
			 text = pdfStripper.getText(doc);  
			
			System.out.println("Text in PDF\n---------------------------------");  
			System.out.println(text);  

  //Closing the document  
  doc.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		return text;
	}
	
		  

	public void printImageIntoReport(File imageFile) {

		try {

			
			Image img = Image.getInstance(imageFile.getAbsolutePath());
			img.scaleToFit(PageSize.A3.getWidth()/2, PageSize.A3.getHeight()/2);
			//img.scalePercent(20, 20);
			img.setAlignment(Image.MIDDLE);
			Paragraph p = new Paragraph();
			// p.setSpacingAfter(4);
			Chunk c = new Chunk(img, 30, -230);
			p.add(c);
			doc.add(p);
			p = new Paragraph();
			// doc.add(Chunk.NEXTPAGE);
			c = new Chunk(Chunk.NEXTPAGE);
			// c = new Chunk(" ");
			p.add(c);
			doc.add(p);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

	
	public void printTestObject(String message) {

		try {
			Paragraph p = new Paragraph();
			p.setFont(objectFont);
			Chunk c = new Chunk("Test Objectives:");
			c.setFont(titleFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(message);
			c.setFont(normalFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			p.add(c);
			doc.add(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void printStep(String message, int stepNumber) {

		try {
			Paragraph p = new Paragraph();
			Chunk c = new Chunk(" ");
			c.setNewPage();
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			p.setFont(objectFont);
			c = new Chunk("Test Step " + stepNumber);
			c.setFont(titleFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			doc.add(p);

			p = new Paragraph();
			p.setFont(objectFont);
			c = new Chunk("Description (Actions)");
			c.setFont(titleFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(message);
			c.setFont(normalFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			doc.add(p);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void printExpectResult(String message) {

		try {
			Paragraph p = new Paragraph();
			Chunk c = new Chunk(" ");
			doc.add(p);

			p = new Paragraph();
			p.setFont(objectFont);
			c = new Chunk("Expected Results:");
			c.setFont(titleFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(message);
			c.setFont(normalFont);
			p.add(c);
			doc.add(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void printActualResult(String message) {

		try {
			Paragraph p = new Paragraph();
			Chunk c = new Chunk(" ");
			doc.add(p);

			p = new Paragraph();
			p.setFont(objectFont);
			c = new Chunk("Actual Results:");
			c.setFont(titleFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(message);
			c.setFont(normalFont);
			p.add(c);
			doc.add(p);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void printSQLResult(Vector<String> result) {

		try {
			Paragraph p = new Paragraph();
			Chunk c = new Chunk(" ");
			doc.add(p);

			p = new Paragraph();
			p.setFont(objectFont);
			c = new Chunk("SQL:");
			c.setFont(titleFont);
			p.add(c);
			doc.add(p);

			for (int i = 0; i < getMultiRowText(result.get(0)).length; i++) {
				p = new Paragraph();
				c = new Chunk(getMultiRowText(result.get(0))[i]);
				c.setFont(sqlFont);
				p.add(c);
				doc.add(p);
			}

			p = new Paragraph();
			p.setFont(objectFont);
			c = new Chunk("SQL Result:");
			c.setFont(titleFont);
			p.add(c);
			doc.add(p);

			for (int i = 0; i < getMultiRowText(result.get(1)).length; i++) {
				p = new Paragraph();
				c = new Chunk(getMultiRowText(result.get(1))[i].replace("\r", ""));
				c.setFont(sqlFont);
				p.add(c);
				doc.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String[] getMultiRowText(String s) {
		String[] ss = s.split("\n\r");
		return ss;
	}

	public void printTestDescription(String message) {

		try {
			Paragraph p = new Paragraph();
			p.setFont(objectFont);
			Chunk c = new Chunk("Test Description:");
			c.setFont(titleFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(message);
			c.setFont(normalFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			p.add(c);
			doc.add(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void printTestPrerequisites(String message) {

		try {
			Paragraph p = new Paragraph();
			p.setFont(objectFont);
			Chunk c = new Chunk("Test Prerequisites:");
			c.setFont(titleFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(message);
			c.setFont(normalFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			p.add(c);
			doc.add(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void printMessage(String message) {

		try {
			Paragraph p = new Paragraph();

			p = new Paragraph();
			Chunk c = new Chunk(message);
			c.setFont(normalFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			c = new Chunk(" ");
			p.add(c);
			doc.add(p);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void printErrorMessage(String message) {

		try {
			Paragraph p = new Paragraph();

			p = new Paragraph();
			Chunk c = new Chunk(message);
			c.setFont(redFont);
			p.add(c);
			doc.add(p);

			p = new Paragraph();
			c = new Chunk(" ");
			c = new Chunk(" ");
			p.add(c);
			doc.add(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
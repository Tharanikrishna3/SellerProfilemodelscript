package helper;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;






public class DBHelper {
	

static Connection con=null;
static DBHelper dbconnect=new DBHelper();
PreparedStatement pstmt = null;
ResultSet rset=null;
String hostURL="";
String query4="";
static String query1="";
Statement stmt;
String universalPath =System.getProperty("user.dir");
	

public Connection connectToDB() throws SQLException, ClassNotFoundException {
    Connection con = null;

    try {
        String dbUrl = "jdbc:db2://9.208.29.176:50001/FMSFATDB:sslConnection=true;sslTrustStoreLocation=" + universalPath + "/drivers/Universal-trustore.jks;";
        System.out.println("Path is " + dbUrl);

//      Uncomment below lines if using environment variables for username and password
//      String username = System.getenv("DB_USERNAME");
//      String password = System.getenv("DB_PASSWORD");
        
        String username = "sis0016wc744";
        String password = "Tharavenkat@12345";
        String dbClass = "com.ibm.db2.jcc.DB2Driver";
        Class.forName(dbClass).newInstance();

        con = DriverManager.getConnection(dbUrl, username, password);

        System.out.println("Connected");
    } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
        e.printStackTrace();
        
    }

    return con;
}

public Connection connectToSAT() throws Exception {
	
	 try {
			String DB_URL = "jdbc:db2://9.208.63.72:50001/FMSSATDB:sslConnection=true;sslTrustStoreLocation="+universalPath+"/drivers/Universal-trustore.jks;";
	    	System.out.println("path is"+DB_URL);
//			String username =    System.getenv("DB_USERNAME");
//	        String password= System.getenv("DB_PASSWORD");
		
			String username= "sis000gka";
			String password= "novembersruthi";
								
		String dbClass = "com.ibm.db2.jcc.DB2Driver";
		Class.forName(dbClass).newInstance();
		
		 con = DriverManager.getConnection(DB_URL, username, password);
		
		stmt = con.createStatement();
		System.out.println("Connected");
		
		}
		catch(Exception e) {
			e.printStackTrace();
			throw new Exception();
		}
	
	
	return con;
}


	//** This function allows the user to execute the passed query
	public ResultSet executeQuery(Connection con, String query) throws Exception{
		query1=query;
		try {
			
			if (con == null || query1 == null) {
			    System.out.println("Testing null for Query4");

			} else {
				pstmt=con.prepareStatement(query1);
		        rset=pstmt.executeQuery();
			}

	        
	         
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		return rset;
	}
	
	public void executeQueryupdate(Connection con, String query) throws Exception{
		query1=query;
		try {
			
			if (con == null || query1 == null) {
			    System.out.println("Testing null for Query4");

			} else {
				pstmt=con.prepareStatement(query1);
		        pstmt.executeUpdate();
			}

	        
	         
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
	}
	
	
	
	public  String checkdbbsp(String Query)
	{
		System.out.println("Query is"+Query);
		String sp_id=null;
 try {
//	 tharaaaa
	// con=dbconnect.connectToSAT();
	con=dbconnect.connectToDB();
	 Statement stmt = con.createStatement();
	 String SALARY_METHOD_CD;
	 rset=dbconnect.executeQuery(con, Query);
		
		if(rset==null) {
			System.out.println("NO DATA");
			return sp_id;
	}
		else
		{ 
			
						
			    while(rset.next()) {
			    	 
			    	sp_id=rset.getString(1);
			    }
			    
			        
	 
		}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
return sp_id;
	
	}
	
	
	
	//public String getcredentilas(String table,String columnname,String no,String condfield) throws Exception
	public String getcredentilas(String table,String columnname,String no,String condfield) throws Exception
	{
		String  getfromdb="";
		 Connection con1=null;
		
			 con=dbconnect.connectToDB();
		
		try {
			
			String DB_URL =  "jdbc:db2://zh114fm1.dal.cpc.ibm.com:5503/ZFM1DB2A:sslConnection=true;sslTrustStoreLocation="+universalPath+"/Drivers/Universal-trustore.jks;";
			
			String DB_USER="I0016WC"; 
			String DB_PASSWORD="K3F8MMDL";
		
//			String DB_USER =    System.getenv("DB_USERNAME_ZOS");
//	        String DB_PASSWORD= System.getenv("DB_PASSWORD_ZOS");
//			
			
			
		    Class.forName("com.ibm.db2.jcc.DB2Driver"); 
            con1 = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			System.out.println("Zeos connected finally");

			 Statement stmt ;

			String query1="SELECT "+columnname+" FROM DBLFMSXR."+table+" WHERE "+condfield+" = '"+no+"'";	
			
			 rset=dbconnect.executeQuery(con1, query1);
			  stmt = con1.createStatement();
				if(rset==null) {
					
					return getfromdb;
				}
				else
				{
			
								
					    while(rset.next()) {
					       
					         getfromdb=rset.getString(1);

					        
					    }
					  
					    return getfromdb;
				}
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return getfromdb;
	}

	
	
	public void deletedataindbSAT(String Query)
	{
		try {
			con=dbconnect.connectToSAT();
 Statement stmt = con.createStatement();

 stmt.executeUpdate(Query);	
 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean InsertQueryPrimarykey(String Query)
	{
		try {
			con=dbconnect.connectToDB();
			PreparedStatement stmt = con.prepareStatement(Query, PreparedStatement.RETURN_GENERATED_KEYS);
            
System.out.println("query is"+Query);
int rowsAffected = stmt.executeUpdate();

if (rowsAffected > 0) {
    // Retrieve the auto-generated keys (insert ID)
    ResultSet generatedKeys = stmt.getGeneratedKeys();
    if (generatedKeys.next()) {
        int insertId = generatedKeys.getInt(1);
        System.out.println("Record inserted successfully with ID: " + insertId);
        
       String status= getcompletestatus(insertId);
        
        System.out.println("Staus is"+status);
        
    } else {
        System.out.println("Failed to retrieve insert ID.");
    }
} else {
    System.out.println("No records inserted.");
}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	
	public String getcompletestatus(int PRIMARYKEY)
	{
		String Query="SELECT MODEL_STATUS FROM DBLFMSXR.FMSV1_O_SP_KAFKA_MSG  WHERE MSG_ID ="+PRIMARYKEY;
		String status = checkdbbsp(Query);
		
		try {
			
			while(!(status.equalsIgnoreCase("Completed")))
			{
			 status = checkdbbsp(Query);
			Thread.sleep(10000);
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;  
	}
	
	
	
	public boolean InsertQuery(String Query)
	{
		try {
			con=dbconnect.connectToDB();
 Statement stmt = con.createStatement();
System.out.println("query is"+Query);
stmt.executeUpdate(Query);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	public void deletedataindb(String Query)
	{
		try {
			con=dbconnect.connectToDB();
 Statement stmt = con.createStatement();
System.out.println("query is"+Query);
 stmt.executeUpdate(Query);	
 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deleteudpatedataindb(String Query)
	{
		try {
			con=dbconnect.connectToDB();
 Statement stmt = con.createStatement();
System.out.println("query is"+Query);
 stmt.executeUpdate(Query);	
 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
 

public boolean checkdbbSAT(String Query)
{
	System.out.println("Query is"+Query);
	Boolean status=false;
try {

 con=dbconnect.connectToSAT();
//con=dbconnect.connectToDB();
 Statement stmt = con.createStatement();
 String SALARY_METHOD_CD;
 rset=dbconnect.executeQuery(con, Query);
	
	if(rset==null) {
		System.out.println("NO DATA");
		return false;
}
	else
	{
		
					
		    while(rset.next()) {
		    	 
		         status=true;
		    }
		    
		        
 
	}
} catch (SQLException e) {
// TODO Auto-generated catch block
e.printStackTrace();
} catch (Exception e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
return status;

}





	public  boolean checkdbb(String Query)
	{
		System.out.println("Query is"+Query);
		Boolean status=false;
	 try {
	
		con=dbconnect.connectToDB();
		 Statement stmt = con.createStatement();
		 rset=dbconnect.executeQuery(con, Query);
			
				if(rset==null) {
				System.out.println("NO DATA");
				return false;
					}
				else
				{
				    	 status=true;
				    }
				    
		
			
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
return status;
	
	}

}
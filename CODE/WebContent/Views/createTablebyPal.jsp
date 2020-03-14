<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<% try{
      Class.forName("oracle.jdbc.driver.OracleDriver");
	  String url="jdbc:oracle:thin:@localhost:1521:orcl";
	  String username="scott";
	  String password="Wipro123";
	  Connection con=DriverManager.getConnection(url,username,password);
	  Statement stmt=con.createStatement();
	 
	  
	 
		 String CREATE_TABLE_EMPLOYEE="CREATE TABLE Employee ("+
  			"Emp_Id VARCHAR(255) not NULL, "
  			+"Emp_Fname VARCHAR(255), "
  			+"Emp_Lname VARCHAR(255), "
  			+"Emp_Desingnation VARCHAR(255), "
  			+"Emp_Contact_No VARCHAR(255), "
  			+"Emp_Password VARCHAR(255), "
  			+"Emp_Pincode VARCHAR(255), "
  			+"Emp_City VARCHAR(255), "
  			+"Emp_State VARCHAR(255), "
  			+"Emp_Branch_Code VARCHAR(255), "
  			+ "Emp_Country VARCHAR(255), "
  			+ "Emp_Gender VARCHAR(255), "
  			+ "PRIMARY KEY ( Emp_id ))";
  			

		 String CREATE_TABLE_CUSTOMER="CREATE TABLE Customer ("+
				 "Cust_Num VARCHAR(255) not NULL, "
				 +"Cust_Fname VARCHAR(255), "
				 +"Cust_Lname VARCHAR(255), "
				 +"Cust_Password VARCHAR(255),"
				 +"Cust_Father_Fname VARCHAR(255), "
				 +"Cust_Father_Lname VARCHAR(255), "
				 +"Cust_DOB VARCHAR(255), "
				 +"Cust_Age VARCHAR(255), "
				 +"Cust_Entry_Date VARCHAR(255), "
				 +"Cust_Contact_No VARCHAR(255), "
				 + "Cust_Email VARCHAR(255), "
				 + "Cust_Pincode VARCHAR(255), "
				 + "Cust_City VARCHAR(255), "
				 + "Cust_State VARCHAR(255), "
				 + "Cust_Country VARCHAR(255), "
				 + "Cust_Gender VARCHAR(255), "
				 + "Cust_Aadhar VARCHAR(255), "
				 + "Cust_Status VARCHAR(255), "
				 + "PRIMARY KEY ( Cust_Num ))";
		 String CREATE_TABLE_ACCOUNT="CREATE TABLE Account ("+
      			"Am_Cust_No VARCHAR(255) not NULL, "
      			+"Am_Cust_Account_No VARCHAR(255) not NULL, "
      			+"Am_Cust_Account_Type VARCHAR(255), "
      			+"Am_Cust_Account_Balance VARCHAR(255), "
      			+"Am_Cust_Account_Closing_Date VARCHAR(255), "
      			+"Am_Cust_Account_Opening_Date VARCHAR(255), "
      			+"Am_Cust_Account_State VARCHAR(255), "
      			+"IFSC VARCHAR(255), "
      			+"Internet_Status VARCHAR(255), "
      			+"PRIMARY KEY (Am_Cust_Account_No))";
      			
		 String CREATE_TABLE_TRANSACTION="CREATE TABLE Transaction ("+
      			"Tran_No VARCHAR(255) not NULL, "
      			+"Tran_Sender_Account_No VARCHAR(255) not NULL, "
      			+"Tran_Date VARCHAR(255), "
      			+"Tran_Time VARCHAR(255), "
      			+"Tran_Amount VARCHAR(255), "
      			+"Tran_Status VARCHAR(255), "
      			+"Tran_Account_Number_Reciever VARCHAR(255), "
      			+"PRIMARY KEY (Tran_No))";
      			

		 String CREATE_TABLE_INTERNETUSER="CREATE TABLE InternetDetails ("+
				 "ID_Num VARCHAR(255) not NULL,"
				 +"ID_Password VARCHAR(255),"
				 +"ID_Cust_Num VARCHAR(255),"
				 +"PRIMARY KEY (ID_Cust_Num))";
				  
		 
		 String CREATE_TABLE_UNIQUEID="CREATE TABLE UniqueId ("+
				 "ID_Num VARCHAR(255) not NULL,"
				 +"PRIMARY KEY (ID_Num))";
		// String fKey="ALTER TABLE Customer"+
				/* "ADD FOREIGN KEY (Cust_Num) REFERENCES Account(Cust_Num);"*/
				 

		 String CREATE_TABLE_BRANCHDETAILS="CREATE TABLE BranchDetails ("+
				 "Branch_IFSC VARCHAR(255) not NULL,"
				 +"Branch_Name VARCHAR(255),"
				 +"Branch_Location VARCHAR(255),"
				 +"PRIMARY KEY (Branch_IFSC))";
				 
				 
		 String CREATE_TABLE_BENEFICIARY="CREATE TABLE Beneficiary ("+
				 "Bene_Send_ID VARCHAR(255) not NULL, "
				 +"Bene_Recieve_ID VARCHAR(255))";		 
				 
				 
				 
				 
				 
		 //stmt.executeUpdate(CREATE_TABLE_EMPLOYEE);
		  stmt.executeUpdate(CREATE_TABLE_CUSTOMER);
		 stmt.executeUpdate(CREATE_TABLE_ACCOUNT);
		 stmt.executeUpdate(CREATE_TABLE_TRANSACTION);
		 stmt.executeUpdate(CREATE_TABLE_INTERNETUSER);
		 stmt.executeUpdate(CREATE_TABLE_BRANCHDETAILS);
		 stmt.executeUpdate(CREATE_TABLE_BENEFICIARY);
		 stmt.executeUpdate(CREATE_TABLE_UNIQUEID);
		 System.out.print("\n  Table Created");
		 
		 
}catch(Exception e)
{
	 System.out.print(e.getMessage());
} %>
</body>
</html>
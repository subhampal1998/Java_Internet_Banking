<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ page import="java.sql.*" %>
</head>
<body>
<%
	try{
    	Class.forName("oracle.jdbc.driver.OracleDriver");
	  	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	  	String username="scott";
	  	String password="Wipro123";
	  	Connection con=DriverManager.getConnection(url,username,password);
	  	Statement stmt=con.createStatement();
	  	
	  	String sql="INSERT INTO Employee (Emp_Id,Emp_Fname,Emp_Lname,Emp_Desingnation,Emp_Contact_No"+
	  			    ",Emp_Pincode,Emp_City,Emp_State,Emp_Country) VALUES("+
	  				"'KA2014','Subham','Bal','Project Engineer','943445569','721122','Kolkata','West Bengal',"+
	  			    "'India')";
	  	String cus="INSERT INTO Customer (Cust_Num,Cust_Fname,Cust_Lname,Cust_Password,Cust_Father_Fname,Cust_Father_Lname,Cust_DOB"+
	  			    ",Cust_Age,Cust_Entry_Date,Cust_Contact_No,Cust_Email,Cust_Pincode,Cust_City,Cust_State,Cust_Country) VALUES("+
	  				"'CU1245','San','Gca','1234','Bip','Gca','09/12/1865','278','1/11/2019','4464646','agc@gmail.com','600097','Chennai'"+
	  			    ",'TN','India')";
	  	String bst="INSERT INTO Account (Am_Cust_No,Am_Cust_Account_No,Am_Cust_Account_Type,Am_Cust_Account_Balance,Am_Cust_Account_Closing_Date"+
	  			    ",Am_Cust_Account_Opening_Date,Am_Cust_Account_State) VALUES("+
	  				"'CU123','90535353','Savings','1000','1/11/4019','1/11/2019','Active')";
	  	String sex="INSERT INTO Transaction (Tran_No,Tran_Sender_Account_No,Tran_Date,Tran_Time,Tran_Amount,Tran_TransType,Tran_Account_Number_Reciever"+
	  				") VALUES('TRAN2','90535353','1/11/2019','14:56:13','20','Debit','763647383')";
	  	
		 String fKey="ALTER TABLE Account"+
				 "ADD CONSTRAINT FOREIGN KEY (F_Cust_No) REFERENCES Customer(Cust_Num)";
	  			
	  	stmt.executeQuery(cus);
	  	System.out.println("Data Inserted");
	  	
 	}catch(Exception e)
	{
 		System.out.println(e.getMessage());
	}


%>
</body>
</html>
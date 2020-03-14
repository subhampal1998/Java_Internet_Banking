package com.internetbanking.DAO;
import Table.*;
import java.sql.*;
import java.util.ArrayList;

import com.internetbanking.DBUtils.*;

public class Dao {
	
	//Login for the customer
  public static String doLogin(Customer customer)
  {
	  String str="";
	  
	  try {
		  Connection connection=DBUtil.getDBConnection();
		  String isExistQuery="SELECT CUST_PASSWORD FROM Customer WHERE CUST_NUM='"+customer.getCust_Num()+"'";
		  Statement stmt=connection.createStatement();
		  ResultSet rs = stmt.executeQuery(isExistQuery);
		  //System.out.print(rs.getString("CUST_PASSWORD"));
		  System.out.println("Dao\n");
		  while(rs.next())
		  {
			  str=rs.getString("CUST_PASSWORD");
			  System.out.println(str);
		  }
		  connection.close();
	  }catch(Exception e) {
		  System.out.println(e.getMessage());
	  }
	  System.out.print(str);
	  return str;
  }
  
  //Adding Username if found unique
  public static boolean doUserRegistration(Internet_User customer)
  {
	  try {
		  System.out.println("Enter Dao");
		  int userunique=0;
		  Connection connection=DBUtil.getDBConnection();
		  String UniqueUsernameQuery="SELECT * FROM InternetDetails";
		  Statement stmt=connection.createStatement();
		  String username=customer.getUser_Name();
		  ResultSet set=stmt.executeQuery(UniqueUsernameQuery);
		  while(set.next())
		  {
			  if(username.equals(set.getString("ID_NUM")))
			  {
				  userunique++;  
			  }
			   
		  }
			  if(userunique==0)
			    {
					 String password= customer.getPassword();
					 String custno= customer.getCust_Num();
					 System.out.println(custno);
					 String CreateQuery="INSERT INTO InternetDetails(ID_Num, ID_Password, ID_Cust_Num)" + 
						  		"VALUES('"+username+"','"+password+"','"+custno+"')";
					 Statement stmt1 =connection.createStatement();
					 stmt1.executeUpdate(CreateQuery);
					 String Activation=" UPDATE Account SET INTERNET_STATUS = 'ACTIVE' WHERE AM_CUST_NO='" +custno+"'" ;
					 System.out.println(Activation);
					 stmt.executeUpdate(Activation)	;
					 connection.close();
					 return true;
			      }
			  else
			  {
				  connection.close();
				  return false;
			  }
			  
	  }
	  catch(Exception e)
	  {
		  System.out.println(e.getMessage()+"doCreate");
	  }
	  
	return false;
	  
  }
  
//Customer Registration for the first time
  
  public static String doRegistered(Customer customer,String IFSC)
  {
	  String str="";
	  
	  System.out.println("Dao Reg");
	  
	  try {
		  Connection connection=DBUtil.getDBConnection();
		  Statement stmt=connection.createStatement();
		 
		  String sql="SELECT ID_NUM FROM UniqueID";
		  ResultSet rs=stmt.executeQuery(sql);
		  int id=0;
		  while(rs.next())
		  {
			  id=Integer.parseInt(rs.getString("ID_NUM"));
		  }
		  String custNum="CU"+id;
		  str=custNum;
		  String accNum="AC"+id;
		  id++;
		  String setID="UPDATE UniqueID SET ID_NUM='"+id+"'";
		  stmt.executeUpdate(setID);
		  String dataInsert="INSERT INTO  Customer(CUST_NUM,CUST_FNAME,CUST_LNAME,CUST_PASSWORD,CUST_FATHER_FNAME,"
		  		+ "CUST_FATHER_LNAME,CUST_DOB,CUST_AGE,CUST_ENTRY_DATE,CUST_CONTACT_NO,CUST_EMAIL"
		  		+ ",CUST_PINCODE,CUST_CITY,CUST_STATE,CUST_COUNTRY,CUST_GENDER,CUST_AADHAR,CUST_STATUS)"
		  		+ " VALUES('"+custNum+"',"
		  				+ "'"+customer.getCust_Fname()+"',"
		  						+ "'"+customer.getCust_Lname()+"',"
		  				+ "'"+customer.getPassword()+"',"
		  				+ "'"+customer.getCust_Father_Fname()+"',"
		  						+ "'"+customer.getCust_Father_Lname()+"',"
		  				+"'"+customer.getCust_DOB()+"',"
		  						+"'"+customer.getCust_Age()+"',"
		  				+"'"+customer.getCust_Entry_Date()+"',"
		  					+"'"+customer.getCust_Contact_No()+"',"
		  				+"'"+customer.getCust_Email()+"',"
		  					+"'"+customer.getCust_Pincode()+"',"
		  				+"'"+customer.getCust_City()+"',"
		  					+"'"+customer.getCust_State()+"',"
		  				+"'"+customer.getCust_Country()+"',"
		  					+"'"+customer.getCust_Gender()+"',"
		  				+"'"+customer.getCust_Aadhar()+"',"
		  					+"'"+customer.getCust_Status()+"'"+")";
		  

		  stmt.executeUpdate(dataInsert);
		  System.out.print("\n Data Inserted");
		  
		  String bst="INSERT INTO Account (Am_Cust_No,Am_Cust_Account_No,Am_Cust_Account_Type,Am_Cust_Account_Balance,Am_Cust_Account_Closing_Date"+
	  			    ",Am_Cust_Account_Opening_Date,Am_Cust_Account_State,IFSC,INTERNET_STATUS) VALUES("+
	  				"'"+custNum+"','"+accNum+"','Savings','1000','null','"+customer.getCust_Entry_Date()+"','INACTIVE','"+IFSC+"','INACTIVE')";
		  stmt.executeUpdate(bst);
		  System.out.print("\n Account Created");
		  connection.close();
	  }catch(Exception e)
	  {
		  System.out.println(e.getMessage());
		  str="No";
	  }
	  
	  
	  return str;
  }
  
  
  //For showing if users request is pending and show if approved.
  
  public static String  doCheckCustId(Customer customerNum) {
	  	
	  	String str = "";
	  try {
		  Connection con = DBUtil.getDBConnection();
		  String customer_state = "SELECT CUST_STATUS FROM Customer WHERE CUST_NUM='"+customerNum.getCust_Num()+"'";
		  Statement stmt = con.createStatement();
		  
		  ResultSet rs = stmt.executeQuery(customer_state);
		  while(rs.next()) {
			  str = rs.getString("CUST_STATUS");
		  }
		  con.close();
	  }catch(Exception e){
		  System.out.println(e);
		  
	  }
	  
	  if(str!=null) {
		  System.out.println(str);
		  
		  return str;
	  }else {
		  return "Cust id Invalid";
	  }

}
  //Adding Beneficiary to Account
  
  
  public static String registerBeneficiary(Beneficiary beneficiary, String acc_no)
	{
		String str="";
		//Statement stmt=null;
		try
		{
			
			
			Connection connection=DBUtil.getDBConnection();
			Statement stmt=connection.createStatement();
			System.out.println(acc_no);
			String sc="SELECT AM_CUST_NO FROM Account WHERE AM_CUST_ACCOUNT_NO='"+acc_no+"'";
			System.out.println(sc);
			ResultSet rs = stmt.executeQuery(sc);
			String result="";
			while(rs.next()) {
				result=rs.getString("AM_CUST_NO");
				System.out.println(result+" SUM");
			}
	
			rs=null;
			String getsql="SELECT BENE_RECIEVE_ID FROM Beneficiary WHERE BENE_SEND_ID='"+beneficiary.getBene_send_ID()+"'";
			System.out.println(getsql);
			rs=stmt.executeQuery(getsql);
			ArrayList<String> resid=new ArrayList<>();
			while(rs.next()) {
				resid.add(rs.getString("BENE_RECIEVE_ID"));
				System.out.println(resid+"     rw e");
			}
			rs=null;
			for(int i=0;i<resid.size();i++)
			{
					if(resid.get(i).equals(result))
					{
						
					     return "No";
					}
			}
			
			
		    String dataInsert="INSERT INTO Beneficiary(BENE_SEND_ID,BENE_RECIEVE_ID) VALUES('"+beneficiary.getBene_send_ID()+"',"
												+"'"+result+"'"+")";
			stmt.executeUpdate(dataInsert);
			System.out.println("Data inserted");
			str="Yes";
			connection.close();
			return str;
			
		}
		catch(Exception e){
			System.out.println(e.getMessage()+" KANKAN");
			str="No";
			return str;
		}
	}
  
  //Transaction Process

  
  public static ArrayList TransactionDetails(Beneficiary beneficiary,String transactionAmount,String date,String time)
	{
		
		
		try {
				Connection connection=DBUtil.getDBConnection();
				Statement stmt=connection.createStatement();
				//ResultSet rs=null;
				ArrayList<String> transactionbill= new ArrayList<>();
				String senderId=beneficiary.getBene_send_ID();
				String recieverACCNo=beneficiary.getBene_receive_ID();
				
				
				System.out.println("Sender: "+senderId+"  Rec Id: "+recieverACCNo);
				
				String senderAccountQ="SELECT AM_CUST_ACCOUNT_NO FROM Account WHERE AM_CUST_NO='"+senderId+"'";
				String senderName="SELECT CUST_FNAME,CUST_LNAME FROM Customer WHERE CUST_NUM='"+senderId+"'";
				String recieverCustNo="SELECT AM_CUST_NO FROM Account WHERE AM_CUST_ACCOUNT_NO='"+recieverACCNo+"'";
				
				//String recieverAccountQ="SELECT  FROM AM_CUST_ACCOUNT_NO Account WHERE AM_CUST_NO='"+recieverId+"'";
				
				System.out.println(senderAccountQ);
				//System.out.println(recieverAccountQ);
				
				String senderAccount="";
				String recieverAccount="";
				String recieverId="";
				ResultSet rs = stmt.executeQuery(senderAccountQ);
				while(rs.next())
				{
					senderAccount=rs.getString("AM_CUST_ACCOUNT_NO");
					System.out.println(senderAccount);
				}
				
				rs=null;
				rs=stmt.executeQuery(senderName);
				
				//name generating  sender
				while(rs.next())
				{
					   System.out.println("GG ENTER");
					   String name="";
				       name=rs.getString("CUST_FNAME")+" "+rs.getString("CUST_LNAME");
				       System.out.println(name+ "sendername");
				       transactionbill.add(name);
				}
				rs=null;
				//generating name for reciever
				rs=stmt.executeQuery(recieverCustNo);
				while(rs.next())
				{
					recieverId=rs.getString("AM_CUST_NO");
					System.out.println(recieverId);
				}
				rs=null;
				
				String recieveName="SELECT CUST_FNAME,CUST_LNAME FROM Customer WHERE CUST_NUM='"+recieverId+"'";
				String senderBalanceQ="SELECT AM_CUST_ACCOUNT_BALANCE FROM Account WHERE AM_CUST_ACCOUNT_NO='"+senderAccount+"'";
				String recieverBalanceQ="SELECT AM_CUST_ACCOUNT_BALANCE FROM Account WHERE AM_CUST_ACCOUNT_NO='"+recieverACCNo+"'";
			
				System.out.println(recieverBalanceQ+" BSBS");
				
				String senderBalance="";
				String recieverBalance="";
				
				//generating name for reciever
				
				rs=stmt.executeQuery(recieveName);
				
				while(rs.next())
				{
					   System.out.println("GG ENTER");
					   String name="";
				       name=rs.getString("CUST_FNAME")+" "+rs.getString("CUST_LNAME");
				       System.out.println(name+ "recievername");
				       transactionbill.add(name);
				}
				
				
				rs=null;
				rs=stmt.executeQuery(senderBalanceQ);
				
				while(rs.next())
				{
					senderBalance=rs.getString("AM_CUST_ACCOUNT_BALANCE");
					System.out.println("senderBalance:"+senderBalance);
				}
				
				rs=null;
				rs=stmt.executeQuery(recieverBalanceQ);
				
				while(rs.next())
				{
					recieverBalance=rs.getString("AM_CUST_ACCOUNT_BALANCE");
					System.out.println("recieverBalance: "+recieverBalance);
				}
				System.out.println("YES");
				System.out.println(senderBalance+" UI");
				int senderValue=Integer.parseInt(senderBalance);
				int recieverValue=Integer.parseInt(recieverBalance+"");
				int tranAmount=Integer.parseInt(transactionAmount+"");
				System.out.println("DD");
				
				System.out.println(senderValue+"  "+recieverValue+"  "+tranAmount);
				
				if(Integer.parseInt(senderBalance)<Integer.parseInt(transactionAmount) ||Integer.parseInt(transactionAmount)<=0)
				{
					
					return null;
				}else {

					senderValue=senderValue-tranAmount;
					recieverValue=recieverValue+tranAmount;
					
					System.out.println("Enter else");
					
					String updateSender="UPDATE Account SET AM_CUST_ACCOUNT_BALANCE='"+senderValue+"' WHERE AM_CUST_ACCOUNT_NO='"+senderAccount+"'";
					String updateReciever="UPDATE Account SET AM_CUST_ACCOUNT_BALANCE='"+recieverValue+"' WHERE AM_CUST_ACCOUNT_NO='"+recieverACCNo+"'";
					
					System.out.println(updateReciever+" UPI");
					
					stmt.executeUpdate(updateSender);
					stmt.executeUpdate(updateReciever);
					//Adding to arraylist
					transactionbill.add(tranAmount+"");
					transactionbill.add(senderValue+"");
					
					  String sql="SELECT ID_NUM FROM UniqueID";
					  ResultSet rst=stmt.executeQuery(sql);
					  int id=0;
					  while(rst.next())
					  {
						  id=Integer.parseInt(rst.getString("ID_NUM"));
						  id++;
					  }
					  String setID="UPDATE UniqueID SET ID_NUM='"+id+"'";
					  stmt.executeUpdate(setID);
					
					String tranId="TN"+id+"/"+senderAccount;
					
					String insertTran="INSERT INTO  Transaction (TRAN_NO,TRAN_SENDER_ACCOUNT_NO,TRAN_DATE,TRAN_TIME,TRAN_AMOUNT,TRAN_STATUS,TRAN_ACCOUNT_NUMBER_RECIEVER)"
							+ " VALUES('"+tranId
							+"','"+senderAccount+"',"
									+ "'"+date+"',"
											+"'"+time+"',"
													+"'"+tranAmount+ "',"
															+"'"+"Success"+ "',"
																	+"'"+recieverACCNo+"')";
					
					stmt.executeUpdate(insertTran);
					
					transactionbill.add(tranId);
					transactionbill.add(date);
					transactionbill.add("Success");
					System.out.println(transactionbill);
					connection.close();
					return transactionbill;
				}
			
		}catch(Exception e) {
			System.out.println("In dao "+e.getMessage());
			return null;
		}
		
	}
  
  
  
  
  
  
  //Transaction Details
  
  public static ArrayList TransactionView(String acc_no,String date1,String date2)
	{
	    ArrayList<String> list=new ArrayList<>();
	    ArrayList<String> listTranNo=new ArrayList<>();
	    ArrayList<String> listDate=new ArrayList<>();
	    ArrayList<String> listTime=new ArrayList<>();
	    ArrayList<String> listAmount=new ArrayList<>();
	    ArrayList<String> listStatus=new ArrayList<>();
	    ArrayList<String> listCustNo=new ArrayList<>();
	    ArrayList<String> listName=new ArrayList<>();
	    ArrayList<String> listfinal=new ArrayList<>();
	    ArrayList<String> listType=new ArrayList<>();
		try
		{
			
			String str="";
			Connection connection=DBUtil.getDBConnection();
			Statement stmt=connection.createStatement();
		
			String getData="SELECT * FROM Transaction WHERE TRAN_DATE>='"+date1+"'"+" AND TRAN_DATE<='"+date2+"'"+"AND TRAN_SENDER_ACCOUNT_NO='"+acc_no+"' ORDER BY TRAN_TIME DESC";
			
			ResultSet rs = stmt.executeQuery(getData);
			String arr="",name="";
			System.out.println(getData+" SENDER");
			//System.out.println(rs.next()+" SENDER");
			while(rs.next())
			 {
				  String accNo=rs.getString("TRAN_ACCOUNT_NUMBER_RECIEVER"); 
				  System.out.println(accNo+" JPOS");
				  list.add(accNo);
				  listTranNo.add(rs.getString("TRAN_NO"));
				  listDate.add(rs.getString("TRAN_DATE"));
				  listTime.add(rs.getString("TRAN_TIME"));
				  listAmount.add(rs.getString("TRAN_AMOUNT"));
				  listStatus.add(rs.getString("TRAN_STATUS"));
				  listType.add("Debit");
				
			 }
			 
			 rs=null;
			 String next="SELECT * FROM Transaction WHERE TRAN_DATE>='"+date1+"'"+" AND TRAN_DATE<='"+date2+"'"+"AND TRAN_ACCOUNT_NUMBER_RECIEVER='"+acc_no+"'";
			 System.out.println(next+" Reciever");
			 rs= stmt.executeQuery(next);
			 
			 
			 while(rs.next())
			 {
				  String accNo=rs.getString("TRAN_SENDER_ACCOUNT_NO"); 
				  System.out.println(accNo+" JPOS");
				  list.add(accNo);
				  listTranNo.add(rs.getString("TRAN_NO"));
				  listDate.add(rs.getString("TRAN_DATE"));
				  listTime.add(rs.getString("TRAN_TIME"));
				  listAmount.add(rs.getString("TRAN_AMOUNT"));
				  listStatus.add(rs.getString("TRAN_STATUS"));
				  listType.add("Credit");
				
			 }
			 
			 System.out.println(list.size()+" ACCOUNT NUMBER");
			 System.out.println(list);
			  
			 for(int i=0;i<list.size();i++)
			 {
				 String sql="SELECT AM_CUST_NO FROM Account WHERE AM_CUST_ACCOUNT_NO='"+list.get(i)+"'";
				 System.out.println(sql);
				 ResultSet rSet=stmt.executeQuery(sql);
				 
				 while(rSet.next())
				  {
					
					  listCustNo.add(rSet.getString("AM_CUST_NO") );
					 
				  }
			 }
			 
			 for(int i=0;i<listCustNo.size();i++)
			 {
				 String val="SELECT CUST_FNAME,CUST_LNAME FROM Customer WHERE CUST_NUM='"+listCustNo.get(i)+"'";
				 System.out.println(val);
				 ResultSet r= stmt.executeQuery(val);
				 while(r.next())
				  {
					  System.out.println("GG ENTER");
					   name="";
				       name=r.getString("CUST_FNAME")+" "+r.getString("CUST_LNAME");
				       listName.add(name);
				  }
				 //System.out.println(list6+" VCX");
			 }
			 
				   
			for(int i=0;i<listCustNo.size();i++)
			{
				//String ans=list.get(i)+"$"+list2.get(i)+"$"+list3.get(i)+"$"+list4.get(i)+"$"+list5.get(i)+"$"+list6.get(i);
				//System.out.println(ans+" ZZ");
				listfinal.add(listTranNo.get(i));
				listfinal.add(listCustNo.get(i));
				listfinal.add(listName.get(i));
				listfinal.add(listDate.get(i));
				listfinal.add(listTime.get(i));
				listfinal.add(listStatus.get(i));
				listfinal.add(listAmount.get(i)+" "+listType.get(i));
				//listfinal.add(list7.get(i));
				//System.out.println(listfinal+" Cognizent");
			}

			 System.out.println(listfinal+" Wipro");
			 connection.close();
		return listfinal;
		
		
	}catch(Exception e)
	{
		System.out.println(e.getMessage()+" LTI");
		    return null;
	}	
		
	}
  
  
  
  //Account Details Customer
  
  
  
  
  public static String isAva(String custid)
	{
		try
		{
			String str="";
			
			Connection connection=DBUtil.getDBConnection();
			Statement stmt=connection.createStatement();
			String getData="SELECT * FROM Account WHERE AM_CUST_NO='"+custid+"'";
			String getData2="SELECT CUST_FNAME,CUST_LNAME FROM Customer WHERE CUST_NUM='"+custid+"'";
			System.out.println(getData);
			System.out.println(getData2);
			ResultSet rs=stmt.executeQuery(getData);
		
			//rs2.getString("CUST_FNAME")+
			while(rs.next())
			{
				str=rs.getString("AM_CUST_NO")+"@"+rs.getString("AM_CUST_ACCOUNT_NO")+"@"
								+rs.getString("AM_CUST_ACCOUNT_TYPE")+"@"+rs.getString("AM_CUST_ACCOUNT_BALANCE")+"@"
								+rs.getString("AM_CUST_ACCOUNT_OPENING_DATE")+"@"+rs.getString("AM_CUST_ACCOUNT_STATE")+"@"
								+"@"+rs.getString("INTERNET_STATUS")+"@"
								+rs.getString("IFSC");
			}
			
			ResultSet rs2=stmt.executeQuery(getData2);
			while(rs2.next())
			{
				str+="@"+rs2.getString("CUST_FNAME")+" "+rs2.getString("CUST_LNAME");
			}
			System.out.println(str);
			connection.close();
			return str;
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			return null;
		}
	}
  
  
  ///Beneficiary TAble
  
  
  public static ArrayList<String> showbene(Beneficiary beneficiary)
	{
		
		try
		{
			Connection connection=DBUtil.getDBConnection();
			Statement stmt=connection.createStatement();
			
			
			String getBene="SELECT BENE_RECIEVE_ID FROM Beneficiary WHERE BENE_SEND_ID='"+beneficiary.getBene_send_ID()+"'";
			ResultSet res=stmt.executeQuery(getBene);
			ArrayList<String> list=new ArrayList<>();
			ArrayList<String> temp1=new ArrayList<>();
			ArrayList<String> temp2=new ArrayList<>();
			
			while(res.next())
			{
				list.add(res.getString("BENE_RECIEVE_ID"));
			}
			for(int i=0;i<list.size();i++)
			{
				String getData="SELECT  CUST_FNAME,CUST_LNAME FROM Customer WHERE CUST_NUM='"+list.get(i)+"'";
				ResultSet rs=stmt.executeQuery(getData);
				while(rs.next())
				{
					temp1.add(rs.getString("CUST_FNAME")+" "+rs.getString("CUST_LNAME"));
				}
			}
		
			for(int i=0;i<list.size();i++ )
			{
				String getData2="SELECT AM_CUST_ACCOUNT_NO FROM Account WHERE AM_CUST_NO='"+list.get(i)+"'";
				ResultSet rs1=stmt.executeQuery(getData2);
				while(rs1.next())
				{
					temp2.add(rs1.getString("AM_CUST_ACCOUNT_NO"));
				}
			}
			
			for(int i=0;i<temp1.size();i++)
			{
				list.set(i, temp1.get(i));
				
			}
			list.add("#");
			for(int i=0;i<temp1.size();i++)
			{
				list.add(temp2.get(i));
			}
			

			
			connection.close();

			return list;
			
		}
		catch(Exception e)
		{
			return null;
		}
	}
  
  //Branch Details Fetch
  
  public static ArrayList<String> listBranch()
  {
	  try
		{
			Connection connection=DBUtil.getDBConnection();
			Statement stmt=connection.createStatement();
			String getBene="SELECT  BRANCH_IFSC FROM BranchDetails";
			ResultSet res=stmt.executeQuery(getBene);
			ArrayList<String> list=new ArrayList<>();
			while(res.next())
			{
				list.add(res.getString("BRANCH_IFSC"));
			}
			connection.close();
			return list;
		}catch(Exception e)
		{
			return null;
		}
  }
  
  
  
  //Branch Manager can see pending Request!!!
  
  
  public static ArrayList<String> brmap1(Employee emp)
	{
		try
		{
			Connection connection=DBUtil.getDBConnection();
			Statement stmt=connection.createStatement();
			String acc_state="INACTIVE";
			ArrayList<String> listAccNo=new ArrayList<String>();
			ArrayList<String> listOpeningDate=new ArrayList<String>();
			ArrayList<String> listCustNo=new ArrayList<String>();
			ArrayList<String> listAccState=new ArrayList<>();
			ArrayList<String> listName=new ArrayList<>();
			ArrayList<String> listFinal=new ArrayList<>();
			
			String getData="SELECT EMP_BRANCH_CODE FROM Employee WHERE EMP_ID='"+emp.getEmp_Id()+"'";
			System.out.println(getData+" IFSC");
			ResultSet rs=stmt.executeQuery(getData);
			String ifsc="";
			while(rs.next())
			{
			  ifsc=rs.getString("EMP_BRANCH_CODE");
			}
			rs=null;
			getData="SELECT AM_CUST_NO, AM_CUST_ACCOUNT_NO, AM_CUST_ACCOUNT_OPENING_DATE, AM_CUST_ACCOUNT_STATE FROM Account WHERE IFSC='"+ifsc+"'AND AM_CUST_ACCOUNT_STATE='"+acc_state+"'";// WHERE AM_CUST_ACCOUNT_OPENING_DATE='"+date+"'";
			System.out.println(getData+" Account Details");
			rs=stmt.executeQuery(getData);
			
			while(rs.next())
			{
				String x=rs.getString("AM_CUST_NO");
				System.out.println(x+" X");
				
				//getData="SELECT CUST_FANME, CUST_LNAME FROM Customer WHERE CUST_NUM='"+x+"'";
				//ResultSet rs2=stmt.executeQuery(getData);
				//String str=rs2.getString("CUST_FANME")+rs2.getString("CUST_LNAME");
				listCustNo.add(x);
				//al.add(str);
				listAccNo.add(rs.getString("AM_CUST_ACCOUNT_NO"));
				listOpeningDate.add(rs.getString("AM_CUST_ACCOUNT_OPENING_DATE"));
				listAccState.add(rs.getString("AM_CUST_ACCOUNT_STATE"));
		
					
			}
			
			rs=null;
			for(int i=0;i<listCustNo.size();i++)
			{
				getData="SELECT CUST_FNAME, CUST_LNAME FROM Customer WHERE CUST_NUM='"+listCustNo.get(i)+"'";
				System.out.println(getData+" Name");
				rs=stmt.executeQuery(getData);
				while(rs.next()) {
					listName.add(rs.getString("CUST_FNAME")+" "+rs.getString("CUST_LNAME"));
				}
			}
			for(int i=0;i<listName.size();i++)
			{
				listFinal.add(listCustNo.get(i));
				listFinal.add(listName.get(i));
				listFinal.add(listAccNo.get(i));
				listFinal.add(listOpeningDate.get(i));
				listFinal.add(listAccState.get(i));
				
			}
			
			System.out.println(listFinal+" EMPLOYEE");
			connection.close();
			return listFinal;
		
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage()+"  AFA");
			return null;
		}
	}
  
  //Activate Button by Branch
  
  
  public static String brmap2(String job,String custid)
 	{
 		try
 		{
 			Connection connection=DBUtil.getDBConnection();
 			Statement stmt=connection.createStatement();
 			
	
 				if(!job.equals(null))
 				{
 					//String getData="UPDATE Account SET AM_CUST_ACCOUNT_STATE='"+job+"' WHERE AM_CUST_NO='"+custid+"''";
 					String sql="UPDATE Account SET AM_CUST_ACCOUNT_STATE='"+job+"' WHERE AM_CUST_NO='"+custid+"'";
 					System.out.println("\n"+sql+" UPDTAE");
 					
 					System.out.println(stmt.executeUpdate(sql)+" UP");
 					connection.close();
 					return job;
 				}
 				connection.close();
 				return null;
 			}
 		
 		catch(Exception e)
 		{
 			return null;
 		}
 	}
  
  
  
  
  //All Details on Request branch Manager
  
  
  
  
  
  public static ArrayList<Account_Master> fetchstate(Employee emp)
	{
		try
		{
			Connection connection=DBUtil.getDBConnection();
			Statement stmt=connection.createStatement();
			String getData="SELECT EMP_BRANCH_CODE FROM Employee WHERE EMP_ID='"+emp.getEmp_Id()+"'";
			System.out.println(getData+" XZ");
			ResultSet rs=stmt.executeQuery(getData);
			ArrayList<Account_Master>account_master=new ArrayList<Account_Master>();
			String ifsc="";
		
			while(rs.next())
			{
				ifsc=rs.getString("EMP_BRANCH_CODE");
				System.out.println(ifsc+" IFSCEMPLOYEE");
			}
			rs=null;
			getData="SELECT * FROM Account WHERE IFSC='"+ifsc+"'";
			rs=stmt.executeQuery(getData);
			while(rs.next())
			{
				Account_Master am=new Account_Master();
				am.setAm_Cust_No(rs.getString("AM_CUST_NO"));
				am.setAm_Cust_Account_No(rs.getString("AM_CUST_ACCOUNT_NO"));
				am.setAm_Cust_Account_Opening_Date(rs.getString("AM_CUST_ACCOUNT_OPENING_DATE"));
				am.setAm_Cust_Account_State(rs.getString("AM_CUST_ACCOUNT_STATE"));		
				account_master.add(am);
			}
			connection.close();
			return account_master;
		}
		catch(Exception e)
		{
			return null;
		}
	}
  
  //Login for Branch Manager
  
  
  public static String doEmployeeLogin(Employee employee)
  {
	  String str="";
	  
	  try {
		  Connection connection=DBUtil.getDBConnection();
		  String isExistQuery="SELECT EMP_PASSWORD FROM Employee WHERE EMP_ID='"+employee.getEmp_Id()+"'";
		  System.out.println(isExistQuery +"QUERY");
		  Statement stmt=connection.createStatement();
		  ResultSet rs = stmt.executeQuery(isExistQuery);
		  //System.out.print(rs.getString("CUST_PASSWORD"));
		  System.out.println("Dao\n");
		  while(rs.next())
		  {
			  str=rs.getString("EMP_PASSWORD");
			  System.out.println(str+" EMPPASS");
		  }
		  connection.close();
	  }catch(Exception e) {
		  System.out.println(e.getMessage());
	  }
	  System.out.print(str);
	  return str;
  }
  
  
//branch manager add by admin
  
  
	public static boolean branchManagerAddByAdmin(Employee empAdd) {
		try {
			Connection con = DBUtil.getDBConnection();
			Statement stmt = con.createStatement();
			
			  String sql="SELECT ID_NUM FROM UniqueID";
			  ResultSet rs=stmt.executeQuery(sql);
			  int id=0;
			  while(rs.next())
			  {
				  id=Integer.parseInt(rs.getString("ID_NUM"));
			  }
			  id++;
			  String UniId="EM"+id;
			  System.out.println(UniId+" EMPID");
			  String setID="UPDATE UniqueID SET ID_NUM='"+id+"'";
			  stmt.executeUpdate(setID);
			
			String insertEmployee = "INSERT INTO Employee(EMP_ID,EMP_FNAME,EMP_LNAME,EMP_DESIGNATION,EMP_CONTACT_NO,EMP_PASSWORD"
					+ ",EMP_PINCODE,EMP_CITY,EMP_STATE,EMP_BRANCH_CODE,EMP_COUNTRY,EMP_GENDER)" + "VALUES('"
					+UniId+"','"+ empAdd.getEmp_Fname() + "','" + empAdd.getEmp_Lname() + "','" + empAdd.getEmp_Designation() + "','"
					+ empAdd.getEmp_Contact_No() + "','"  + UniId + "','" + empAdd.getEmp_Pincode()
					+ "','" + empAdd.getEmp_City() + "','" + "" + empAdd.getEmp_State() + "','" + empAdd.getBranch_Code()
					+ "','" + empAdd.getEmp_Country() + "','" + "" + empAdd.getEmp_Gender() + "')";
			System.out.println(insertEmployee+ " INSERT");
			stmt.executeUpdate(insertEmployee);
			con.close();
			return true;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}

		
	}
	
	
	// Branch manager details Fetching
	
	
		public static ArrayList<Employee> branchManagerDetails() {
			try
			{
				Connection con = DBUtil.getDBConnection();
				Statement stmt=con.createStatement();
				ArrayList<Employee> allemployee= new ArrayList<>();
				String fetchBranchManager = "SELECT * FROM Employee";
				ResultSet rs=stmt.executeQuery(fetchBranchManager);
			     
					while(rs.next()) {
					Employee empDetails= new Employee();
					empDetails.setEmp_Fname(rs.getString("EMP_FNAME"));
					empDetails.setEmp_Lname(rs.getString("EMP_LNAME"));
					empDetails.setEmp_Id(rs.getString("EMP_ID"));
					empDetails.setEmp_Gender(rs.getString("EMP_GENDER"));
					empDetails.setEmp_Designation(rs.getString("EMP_DESIGNATION"));
					empDetails.setEmp_Contact_No(rs.getString("EMP_CONTACT_NO"));
					empDetails.setEmp_City(rs.getString("EMP_CITY"));
					empDetails.setBranch_Code(rs.getString("EMP_BRANCH_CODE"));
					empDetails.setEmp_State(rs.getString("EMP_STATE"));
					empDetails.setEmp_Country(rs.getString("EMP_COUNTRY"));
					empDetails.setEmp_Pincode(rs.getString("EMP_PINCODE"));
					allemployee.add(empDetails);
					
					}
					System.out.println(allemployee+ "  EMPLOYEEDETAILS");
					con.close();
				return allemployee;
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage()+" EXCEPTION");
				return null;
			}
				
		}
		
		//ON edit fetch single Employee on screen
		public static Employee branchManagerDetails(String empId) {
			try
			{
				Connection con = DBUtil.getDBConnection();
				Statement stmt=con.createStatement();
				Employee empDetails=new Employee();
				String fetchBranchManager = "SELECT * FROM Employee WHERE EMP_ID='"+empId+"'";
				ResultSet rs=stmt.executeQuery(fetchBranchManager);
				
					
					while(rs.next()) {
					empDetails.setEmp_Fname(rs.getString("EMP_FNAME"));
					empDetails.setEmp_Lname(rs.getString("EMP_LNAME"));
					empDetails.setEmp_Id(rs.getString("EMP_ID"));
					empDetails.setEmp_Gender(rs.getString("EMP_GENDER"));
					empDetails.setEmp_Designation(rs.getString("EMP_DESIGNATION"));
					empDetails.setEmp_Contact_No(rs.getString("EMP_CONTACT_NO"));
					empDetails.setEmp_City(rs.getString("EMP_CITY"));
					empDetails.setBranch_Code(rs.getString("EMP_BRANCH_CODE"));
					empDetails.setEmp_State(rs.getString("EMP_STATE"));
					empDetails.setEmp_Country(rs.getString("EMP_COUNTRY"));
					empDetails.setEmp_Pincode(rs.getString("EMP_PINCODE"));
					}
					con.close();
				return empDetails;
			}
			catch(Exception e)
			{
				return null;
			}
				
		}
		
		
		
		
		
		
		// Edit Branch manager details by Admin
		
		
		
		public static boolean updateBranchManagerDetails(Employee emp) {

			try {
				Connection con = DBUtil.getDBConnection();
				System.out.println("DAO UPDATE BRANCH MANAGER");
				Statement stmt = con.createStatement();
				String updateBranchManager = "UPDATE Employee SET EMP_FNAME='" + emp.getEmp_Fname() + "',EMP_LNAME='"
						+ emp.getEmp_Lname() + "'," + "EMP_DESIGNATION='" + emp.getEmp_Designation() + "',EMP_CONTACT_NO='"
						+ emp.getEmp_Contact_No() + "',EMP_PINCODE='" + "" + emp.getEmp_Pincode() + "',EMP_CITY='"
						+ emp.getEmp_City() + "',EMP_STATE='" + emp.getEmp_State() + "" + "',EMP_BRANCH_CODE='"
						+ emp.getBranch_Code() + "',EMP_COUNTRY='" + emp.getEmp_Country() + "',EMP_GENDER='"
						+ emp.getEmp_Gender() + "'WHERE EMP_ID='" + emp.getEmp_Id() + "'";
				System.out.println(updateBranchManager);
				stmt.executeUpdate(updateBranchManager);
				con.close();
				return true;

			} catch (Exception e) {
				System.out.println(e.getMessage());
				return false;
			}

		}
		
		
		//Delete Employee by ADMIN
		
		
		
		public static boolean branchManagerDetailsDeleteByAdmin(String emp_id) {
			try {
				Connection con = DBUtil.getDBConnection();
				Statement stmt = con.createStatement();
				
				String deleteManager = "DELETE FROM Employee WHERE EMP_ID='"+emp_id+"'";
				stmt.executeUpdate(deleteManager);
				con.close();
				return true;
			}catch(Exception e) {
				System.out.println(e);
				return false;
			}
		}
		
		
		
		
		//branch Details for admin	
		public static Branch_Details branchDetailsForAdmin(String str,String value) {
			ArrayList<Branch_Details> allBranchDetails=new ArrayList<Branch_Details>();
			try
			{
				Connection con = DBUtil.getDBConnection();
				Statement stmt = con.createStatement();
				String branchDetails="";
				if(str.equalsIgnoreCase("IFSC"))
				{
					branchDetails="SELECT * FROM BranchDetails WHERE BRANCH_IFSC='"+value+"'";
				}else if(str.equalsIgnoreCase("BRANCH_NAME"))
				{
					branchDetails="SELECT * FROM BranchDetails WHERE BRANCH_NAME='"+value+"'";
				}else {
					branchDetails="SELECT * FROM BranchDetails WHERE BRANCH_LOCATION='"+value+"'";
				}
				System.out.println(branchDetails+" QUDAO");
				ResultSet rs=stmt.executeQuery(branchDetails);
				Branch_Details bd=new Branch_Details();
				//System.out.println(rs.next()+" BOT");
				while(rs.next())
				{
					
					bd.setIFSC_Code(rs.getString("BRANCH_IFSC"));
					bd.setBranch_Name(rs.getString("BRANCH_NAME"));
					bd.setLocation(rs.getString("BRANCH_LOCATION"));
				    System.out.println(bd.getBranch_Name()+" "+bd.getIFSC_Code()+" "+bd.getLocation());
				}
				con.close();
				return bd;
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage() +"ERROR");
				return null;
			}
			
			
			
			
		}

		public static boolean checkusernamevalid(String username,String password)
		{
				try
				{
					Connection con = DBUtil.getDBConnection();
					Statement stmt = con.createStatement();
					String passworduser="";
				    String getUsername="SELECT ID_PASSWORD FROM InternetDetails WHERE ID_NUM='"+username+"'";
				    System.out.println(getUsername+" DaoCHeckValid");
				    ResultSet rs= stmt.executeQuery(getUsername);
				    while(rs.next())
				    {
				    	passworduser=rs.getString("ID_PASSWORD");
				    }
				    if(password.equals(passworduser))
				    {
				    	con.close();
				    	return true;
				    }
				    else
				    {
				    	con.close();
				    	return false;
				    }
			   }
				catch(Exception e)
				{
					System.out.println(e.getMessage()+"CheckUSername");
					return false;
				}
		}			
			
}

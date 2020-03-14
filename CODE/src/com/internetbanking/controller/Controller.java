package com.internetbanking.controller;
import com.internetbanking.services.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.internetbanking.services.Service;

import Table.*;
import java.util.*;
import java.util.Date;
import java.text.SimpleDateFormat; 
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		HttpServletRequest request1=request;
		HttpServletResponse response1=response;
		System.out.println("Enter");
		if(request.getParameter("submit")!=null)
		{
			String password= request.getParameter("CUST_PASSWORD");
			String custNum= request.getParameter("CUST_NUMBER");
			System.out.println("Entering");
			
			if((password.equals(""))||(custNum.equals("")) ) 
			{
				 Controller.SweetAlert("Please give your ID and Password !","login.jsp",request,response);
			}
			else
			{
			       if((Service.isCustomerValid(password, custNum)))
					{
							session.setAttribute("Customer_no",custNum);
							AccountDetails(request,response,session);
							response.sendRedirect("accountDetails.jsp");
					}
			       else {
			    	   Controller.SweetAlert("Incorrect id or password !","login.jsp",request,response);
			       }
			}
			
			
		}
		
		System.out.println(session.getAttribute("Customer_no")+ " Sess");
		
		
		//UserName Validation first Time
		
	
		if(request.getParameter("Internetsubmit")!=null)
		{
			String custno=session.getAttribute("Customer_no")+"";
			String userId=request.getParameter("INTERNET_USER_NUMBER");
			String userPassword=request.getParameter("INTERNET_USER_PASSWORD");
			String UsernameStatus=session.getAttribute("UPIStatus")+ "";
			if(UsernameStatus.equalsIgnoreCase("active"))
			{
				Controller.SweetAlert("AlreadyActive","UserIDCreation.jsp",request,response);
			}
			 else
			  {
					if(Service.isUserValid(userPassword, userId, custno))
					{   
						
						AccountDetails(request,response,session);
					}
					else
					{
						Controller.SweetAlert("Username Already Taken","UserIDCreation.jsp",request,response);
					}
			   }
		}
		
		
		//Registration first time users
		
		if(request.getParameter("CustomerRegistration")!=null)
		{
			
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
			Date d= new Date();
			String date=formatter.format(d)+"";
			String CustFName=request.getParameter("cust_Fname");
			String CustLName=request.getParameter("cust_Lname");
			String CustPasssword=request.getParameter("CNF_password");
			String CustGender=request.getParameter("gender");
			String CustDOB=request.getParameter("dob");
			String CustAge="69";
			String CustFatherFname=request.getParameter("f_h_Fname");
			String CustFatherLname=request.getParameter("f_h_Lname");
			String CustPhno=request.getParameter("ph_no");
			String CustEmail=request.getParameter("email");
			String CustAddress=request.getParameter("address");
			String CustState=request.getParameter("state");
			String CustDistrict=request.getParameter("district");
			String CustAadharNo=request.getParameter("aadhar_no");
			String CustPincode=request.getParameter("pincode");
			String CustCountry=request.getParameter("country");
			String IFSC=request.getParameter("IFSC");
			
	
	
			
			Customer customer=new Customer();
			customer.setCust_Num("");
			customer.setCust_Fname(CustFName);
			customer.setCust_Lname(CustLName);
			customer.setPassword(CustPasssword);
			customer.setCust_Age(CustAge);
			customer.setCust_DOB(CustDOB);
			customer.setCust_Email(CustEmail);
			customer.setCust_Gender(CustGender);
			customer.setCust_Father_Fname(CustFatherFname);
			customer.setCust_Father_Lname(CustFatherLname);
			customer.setCust_Contact_No(CustPhno);
			customer.setCust_Entry_Date(date);
			customer.setCust_Email(CustEmail);
			customer.setCust_Pincode(CustPincode);
			customer.setCust_City(CustAddress);
			customer.setCust_State(CustState);
			customer.setCust_Country(CustCountry);
			customer.setCust_Gender(CustGender);
			customer.setCust_Aadhar(CustAadharNo);
			customer.setCust_Status("INACTIVE");
			
	        String existId=Service.isCustomerRegistered(customer,IFSC);
	         System.out.println();
			if(existId.equalsIgnoreCase("NO"))
			{
			  response.getWriter().print("Error");
			}
			 else
			  {
				 session.setAttribute("Customer_no",existId);
				AccountDetails(request,response,session);
				response.sendRedirect("accountDetails.jsp");
				System.out.print("Done");
				
			 }
			
		}
		
		
		//Show Application status for the user
		if(request.getParameter("CheckStatus")!=null)
		{
			System.out.print("ENtering IF");
		String customerNum = request.getParameter("CUST_NUMBER");
		String customerStatus="";
			if(customerNum!=null) {
				customerStatus=Service.isCustomerPresent(customerNum);
				System.out.println(customerStatus);
				response.sendRedirect("UserIDCreation.jsp");
				
			}
		}
		//Beneficiary Add Click
		
		if(request.getParameter("AddBeneficiary") != null)
		{
		    String accStatus=session.getAttribute("AccountStatus")+"";
		    String upiStatus=session.getAttribute("UPIStatus")+"";
			if(accStatus.equalsIgnoreCase("Active") && upiStatus.equalsIgnoreCase("Active"))
			{
		    
				RequestDispatcher rd=request.getRequestDispatcher("addBeneficiary.jsp"); 
			    rd.forward(request, response);
			}else {
				//response.getWriter().println("<body onload=\"alert('Check Your Internet and Account Status')\"></body>");
				//Controller.SweetAlert("Active your Account", "accountDetails.jsp", request, response);
			    //AccountDetails(request,response,session);
			}
		}
		else {
			System.out.println(request.getParameter("AddBeneficiary")+"TESTING");
		} 
		//Beneficiary addition
		System.out.print(request.getParameter("Add"));
		if(request.getParameter("Add")!=null)
		{
			String bene_send_id=(String)session.getAttribute("Customer_no");
			String bene_receive_id=request.getParameter("bene_receive_id");
			String acc_no=request.getParameter("acc_no");
			
			Beneficiary beneficiary=new Beneficiary();
			beneficiary.setBene_send_ID(bene_send_id);
			beneficiary.setBene_receive_ID(bene_receive_id);
			
			   if(acc_no.equals("")) 
			    {
				   Controller.SweetAlert("Account No can't be empty", "addBeneficiary.jsp", request, response);
			    }
			   else{
				   if(acc_no.substring(0,2).equals("AC"))
				   {
					System.out.println(session.getAttribute("ACCOUNTCUR")+ "Current Session");
						if(!acc_no.equals(session.getAttribute("ACCOUNTCUR"))) 
						 {
						  if(Service.isBeneficiaryRegistered(beneficiary,acc_no))
							{
							  AccountDetails(request,response,session);
								  //Controller.SweetAlert("Beneficiary Successfully Added", "accountDetails.jsp", request, response);
							}
							 else
							  {
								Controller.SweetAlert("Already added", "addBeneficiary.jsp", request, response);
							  }
						}
						  else {
								Controller.SweetAlert("You cannot add your own account no", "addBeneficiary.jsp", request, response);
							   }
						//else
							//Controller.SweetAlert("Active your Account", "accountDetails.jsp", request, response);
						}
						else
						{
						    
							Controller.SweetAlert("Enter a Valid Account No", "addBeneficiary.jsp", request, response);
						}
					    }
			         
						
					
		                  
			   
			   }
				 
			   
		
		
		
		//Transaction Process
		if(request.getParameter("Transaction")!=null)
		{
			//String sendId=request.getParameter("SEND_ID");
			//String recId=request.getParameter("REC_ID");
			String sendId=(String)session.getAttribute("Customer_no");
		    String recId=session.getAttribute("ACCTNO")+"";
			System.out.println(recId + "Bko");
			String transactionAmount=request.getParameter("AMOUNT");
			    try {             
					SimpleDateFormat formatters = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
					Integer.parseInt(transactionAmount);
					Date dt= new Date();
					String date1=formatters.format(dt)+"";
					
					int s=Integer.parseInt(transactionAmount);
					
					StringTokenizer token=new StringTokenizer(date1," ");
					ArrayList<String> list=new ArrayList<>();
					
					while(token.hasMoreTokens()) {
						
						
						list.add(token.nextToken());
						
					}
					
					Beneficiary ben=new Beneficiary();
					ben.setBene_send_ID(sendId);
					ben.setBene_receive_ID(recId);
					ArrayList<String>transactionBill=Service.issuccessTransaction(ben, transactionAmount, list.get(0), list.get(1));
					if(transactionBill.size()==7)
					{
						System.out.println("Success");
						request.setAttribute("transactionBill", transactionBill); 
					    RequestDispatcher rd=request.getRequestDispatcher("transactionBill.jsp");

					     rd.forward(request, response);
						
					}else {
						System.out.println("Fail");
					}
			                                                              
			    }catch(Exception e)
			    {
			    	System.out.println("");
			    }
		}
		
		
		//transaction Details
		
		
	   if(request.getParameter("Transaction Details")!=null)
	   {
		   ArrayList<String> list=new ArrayList<>();
		String date1=request.getParameter("from_date");
		
		String date2=request.getParameter("to_date");
		String accno=session.getAttribute("ACCOUNTCUR")+"";
		System.out.println(accno);
		//String accno="AC1000";
		list=Service.viewTrans(accno,date1,date2);
		System.out.println(list+" Con");
		if(list==null)
		{
			 
		     System.out.println(list);
		     request.setAttribute("data", list); 
		     RequestDispatcher rd=request.getRequestDispatcher("transaction_details.jsp");
		     rd.forward(request, response);
		}else {
				System.out.println(list+" GD");
			        request.setAttribute("data", list); 
			     RequestDispatcher rd=request.getRequestDispatcher("transaction_details.jsp");
			     
			     rd.forward(request, response);
			     

		}
		
	   }
		
	  
	  
	   
	   //Beneficiary Table
	   
	   System.out.println("testing"+request.getParameter("MyBeneficiary"));
	   if(request.getParameter("MyBeneficiary") != null)
        {
		   System.out.println(request.getParameter("MyBeneficiary"));
		    System.out.println("  BAAL");
		    Beneficiary bene=new Beneficiary();
		    System.out.println(session.getAttribute("Customer_no")+" BENE");
		    bene.setBene_send_ID(session.getAttribute("Customer_no")+"");
		    //bene.setBene_send_ID("CU1000");
		    ArrayList<String> rep=new ArrayList<>();
		    ArrayList<String> name1=new ArrayList<>();
		    ArrayList<String> acc1=new ArrayList<>();
		    String accStatus=session.getAttribute("AccountStatus")+"";
		    String upiStatus=session.getAttribute("UPIStatus")+"";
		    if(accStatus.equalsIgnoreCase("Active") && upiStatus.equalsIgnoreCase("Active"))
		    {
						    rep=Service.viewBene(bene);
						    System.out.println(rep+"  BAAL");
						    try {
								    if(rep!=null) {
								    	 		
								    			int pos=0;
											    for(int i=0;i<rep.size();i++)
											    {
													    if(rep.get(i).equals("#"))
													    {
													    			for(int j=i+1;j<rep.size();j++)
													    			{
													    				acc1.add(rep.get(j));
													    			}
													    			break;
													    }else
												    	{
												    		name1.add(rep.get(i));
												    		
												    	}
											   }
								    }else {
								    	acc1=null;
								    	name1=null;
								    }
						    }catch(Exception e)
						    {
						    	acc1=null;
						    	name1=null;
						    }
					    System.out.println(acc1.get(0)+" ACC");
					    System.out.println(name1+" NAME");
					    request.setAttribute("name", name1); 
					   // session.setAttribute("RecieverACC", acc1.get(0));
					    request.setAttribute("account", acc1);
					    RequestDispatcher rd=request.getRequestDispatcher("beneficiaryList.jsp"); 
					    rd.forward(request, response);
					    
		    }else{
		    	Controller.SweetAlert("Reciever Bank is Not Active","beneficiaryList.jsp",request,response); 
		    
			    
			    
		    }
	   }
	   
	   
	   
	   //Go to registration && IFSC
	   if(request.getParameter("Register")!=null)
	   		
	   {
		   ArrayList<String> list= new ArrayList<>();
		   list=Service.viewIFSCList();
		   request.setAttribute("IFSC", list);
		   RequestDispatcher rd=request.getRequestDispatcher("Customer_Registration.jsp"); 
		   rd.forward(request, response);
	   }
	   
	   
	   //Activate Button By Branch Manager
	   
	   if(request.getParameter("activate_button")!=null)
	   {
		    String job="ACTIVE"; 
		    String custid=request.getParameter("activate_button");
		    System.out.println("YY "+custid+" ZZ");
		    String st= Service.brnmap2(job,custid); 
		    BranchPendingRequest(request,response,session);
		    System.out.println(st);
	   }
	   if(request.getParameter("reject_button")!=null)
	   {
		    String job="REJECTED"; 
		    String custid=request.getParameter("reject_button");
		    System.out.println("YY "+custid+" ZZ");
		    String st= Service.brnmap2(job,custid); 
		    BranchPendingRequest(request,response,session);
		    System.out.println(st);
	   }
	   
	   //Branch Manager will be able to see pending requests!!
	   
	   
	  /* if( request.getParameter("EmployeeLogin") !=null)
	   {
	    Employee emp=new Employee();
	    emp.setEmp_Id(session.getAttribute("Emp_no")+"");
	    ArrayList<String> al=new ArrayList<>();
	    al=Service.brnmap1(emp);
	    System.out.println(al);
	    request.setAttribute("LIST", al);
	    RequestDispatcher rd=request.getRequestDispatcher("account_activation_by_branch_manager.jsp"); 
	    rd.forward(request, response);
	   }*/
	   
	 //fetching all the account states
	    
	  if(request.getParameter("ALL")!=null)
	    {
	    Employee emp1=new Employee();
	    
	    //String empid=request.getParameter("trigger to fetch details and send empid"); 
	    String empid=session.getAttribute("Emp_no")+"";
	    emp1.setEmp_Id(empid);
	    ArrayList<Account_Master> acc_master=new ArrayList<Account_Master>(); 
	    acc_master=Service.brnmap3(emp1);
	    System.out.println(acc_master+"  RAW");
	   	request.setAttribute("List", acc_master);
	    RequestDispatcher rd=request.getRequestDispatcher("AllRequestCustomer.jsp"); 
	    rd.forward(request, response);
	   	
	   }
	  
	  
	  //Login for Branch MAnager
	  
	  if(request.getParameter("EmployeeLogin")!=null)
		{
			String password= request.getParameter("EMP_PASSWORD");
			String EMpNum= request.getParameter("EMP_NUMBER");
			System.out.println("EMP_PASS: "+password + " EMPNO: "+EMpNum);
			if((password.equals(""))||(EMpNum.equals("")) ) 
			{
				 Controller.SweetAlert("Cannot be Blank !","EmployeeRegistration.jsp",request,response);
			}
			else if(Service.isEmployeeValid(password, EMpNum))
			  {
				session.setAttribute("Emp_no",EMpNum);
				BranchPendingRequest(request,response,session);
				response.sendRedirect("account_activation_by_branch_manager.jsp");
			   }
			 else
			 {
				System.out.println("InValid");
				Controller.SweetAlert("Enter Valid Details !","EmployeeRegistration.jsp",request,response);
			 }
			
			
		}
	  
	//branch manager add
		if(request.getParameter("ADMINADDEMPLOYEE")!=null)
		{
				String addEmpFName=request.getParameter("addfname");
				String addEmpLName = request.getParameter("addlname");
				String addEmpDesignation = request.getParameter("addempdeg");
				String addEmpContactNo = request.getParameter("addcontactno");
				String addEmpPinCode = request.getParameter("addpincode");
				String addEmpCity = request.getParameter("addcity");
				String addEmpState = request.getParameter("addstate");
				String addEmpCountry = request.getParameter("addcountry");
				String addEmpGender = request.getParameter("addgender");
				String addEmpBranchCode = request.getParameter("addbranch");
				Employee empAdd = new Employee();
				
				empAdd.setEmp_Fname(addEmpFName);
				empAdd.setEmp_Lname(addEmpLName);
				empAdd.setEmp_Designation(addEmpDesignation);
				empAdd.setEmp_Contact_No(addEmpContactNo);
				empAdd.setEmp_Pincode(addEmpPinCode);
				empAdd.setEmp_City(addEmpCity);
				empAdd.setEmp_State(addEmpState);
				empAdd.setEmp_Country(addEmpCountry);
				empAdd.setEmp_Gender(addEmpGender);
				empAdd.setBranch_Code(addEmpBranchCode);
				
				if(Service.branchManagerAdd(empAdd)) {
					System.out.println("success");
			    }else {
				       System.out.println("fail");
			          }
		}
		
		
		//fetching branch manager details
		if(request.getParameter("allEmployee")!=null)
		{
		  ArrayList<Employee> allEmployee=new ArrayList<>();
		  allEmployee=Service.fetchBranchManager();
		  System.out.println(allEmployee+" CONTROLLER EMPLOYEE");
		  request.setAttribute("AllEmployeeDETAILS", allEmployee);
		  RequestDispatcher rd=request.getRequestDispatcher("all_employee_by_admin.jsp"); 
		  rd.forward(request, response);
		  
		}
		
		
		
		
		//Particular Employee Details Fetch
		
		if(request.getParameter("EditAccount")!=null)
		{
			String empId=request.getParameter("EditAccount");
			Employee emp= new Employee();
			emp=Service.fetchBranchManagerSingle(empId);
			request.setAttribute("EmployeeData", emp);
			RequestDispatcher rd=request.getRequestDispatcher("employee_details_update_by_admin.jsp"); 
			rd.forward(request, response);
			
		}
		
	//Update Employee by Admin
		
		if(request.getParameter("UpdateEmployee")!=null)	
		{
			
			   System.out.println("CONTROLLER UPDATE");
					String empId=request.getParameter("empid");
					String empFName=request.getParameter("empfname");
					String empLName = request.getParameter("emplname");
					String empDesignation = request.getParameter("empdeg");
					String empContactNo = request.getParameter("empcontactno");
					String empPinCode = request.getParameter("emppincode");
					String empCity = request.getParameter("empcity");
					String empState = request.getParameter("empstate");
					String empCountry = request.getParameter("empcountry");
					String empGender = request.getParameter("empgender");
					String empBranchCode = request.getParameter("empbranch");
					Employee emp = new Employee();
					
					emp.setEmp_Id(empId);
					emp.setEmp_Fname(empFName);
					emp.setEmp_Lname(empLName);
					emp.setEmp_Designation(empDesignation);
					emp.setEmp_Contact_No(empContactNo);
					emp.setEmp_Pincode(empPinCode);
					emp.setEmp_City(empCity);
					emp.setEmp_State(empState);
					emp.setEmp_Country(empCountry);
					emp.setEmp_Gender(empGender);
					emp.setBranch_Code(empBranchCode);
					
					if(Service.branchManagerUpdate(emp)) {
						System.out.println("success");
				}else {
					System.out.println("fail");
				}
		}
		
		
		//branch manager delete by admin
		        if(request.getParameter("DeleteAccount")!=null)
		        {
					String emp_id = request.getParameter("DeleteAccount");
					if(Service.branchManagerDeleteByAdmin(emp_id)) {
						System.out.println("success");
					}else {
						System.out.println("fail");
					}
		
		        }
		
		
		
		        
		//Search by IFSC,Location,BranchName
		        
		    if(request.getParameter("Searchbyquery")!=null)
		    {
		    	System.out.println("ENTER CONTROLLER");
		    	Branch_Details branch_Details= new Branch_Details();
		    	String type=request.getParameter("QUERY");
		    	String value=request.getParameter("dataName");
		    	branch_Details=Service.receiveBranchDetails(type,value);
		    	request.setAttribute("BRANCH_DETAILS_ADMIN", branch_Details);
		    	 RequestDispatcher rd=request.getRequestDispatcher("branchDetailsForAdmin.jsp"); 
		  	    rd.forward(request, response);
		  	 
		    }
		        
		
		    //Go back to HomePAge
		    
		    if(request.getParameter("Home")!=null)
		    {
		    	AccountDetails(request,response,session);
		    }
	  
		    //Username Validity
		    if(request.getParameter("CheckValidity")!=null)
		    {
		    	String username=request.getParameter("username");
		    	String password= request.getParameter("password");
		    	//String AccountReciever=request.getParameter("account");
		    	if((password.equals(""))||(username.equals("")) ) 
				{
					 Controller.SweetAlert("Please give your ID and Password !","UsernameLogin.jsp",request,response);
				}
		    	else if(Service.uservalidity(username, password))
		    	{
		    		   RequestDispatcher rd=request.getRequestDispatcher("transaction.jsp"); 
					   rd.forward(request, response);
		    	}else {
		    		 Controller.SweetAlert("Please Enter Correct Username and Password","UsernameLogin.jsp",request,response);	
		    	}
		    }
		    		
	}

public void AccountDetails(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ServletException, IOException
{
	try {
	    System.out.println("Details ENter");
	    //String  reciId=request.getParameter("CUST_ID");
	    String reciId=session.getAttribute("Customer_no")+"";
	    System.out.println(reciId+" CX");
	    System.out.println(reciId + " ID");
	    String det=Service.accDetails(reciId);
	    System.out.println(det +" WQ");
	    ArrayList<String> l1=new ArrayList();
	    StringTokenizer st3=new StringTokenizer(det,"@");
	    while(st3.hasMoreTokens())
	    {
	    	l1.add(st3.nextToken());
	    }
	    
	    System.out.println(l1);
	    session.setAttribute("ACCOUNTCUR",l1.get(1) );
	    session.setAttribute("AccountStatus", l1.get(5));
	    session.setAttribute("UPIStatus", l1.get(6));
	    request.setAttribute("data12", l1); 
	    RequestDispatcher rd=request.getRequestDispatcher("accountDetails.jsp"); 
	    rd.forward(request, response);
	}catch(Exception e) {
		Controller.SweetAlert("Error !!","",request,response);	
	}
	 
}

//Pending Request By Branch Manager

public void BranchPendingRequest(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException
{
	    Employee emp=new Employee();
	    emp.setEmp_Id(session.getAttribute("Emp_no")+"");
	    ArrayList<String> al=new ArrayList<>();
	    al=Service.brnmap1(emp);
	    System.out.println(al);
	    request.setAttribute("LIST", al);
	    RequestDispatcher rd=request.getRequestDispatcher("account_activation_by_branch_manager.jsp"); 
	    rd.forward(request, response);
}

public static void SweetAlert(String value,String JSP,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
{
	  PrintWriter out=response.getWriter();
	  out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	  out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	  out.println("<script>");
	  out.println("$(document).ready(function(){");
	  out.println("swal ( '"+value+"' , '  ' , 'error' );});");
	  out.println("</script>");
	  
	  RequestDispatcher rd=request.getRequestDispatcher(JSP);
	  rd.include(request, response);
}
	}



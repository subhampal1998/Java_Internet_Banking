package com.internetbanking.services;
import java.util.*;
import java.text.*; 
import com.internetbanking.DAO.*;
import Table.*;


public class Service {

	
	public static boolean isCustomerValid(String password,String custNum)
	{
		Customer customer=new Customer();
		customer.setCust_Num(custNum);
		
		String mainPass=Dao.doLogin(customer);
		
		if(mainPass.equals(password))
		{
			return true;
		}else {
			return false;
		}
	}
	
	

	public static boolean isUserValid(String password,String username,String custmrID)
	{
		Internet_User user=new Internet_User();
		user.setUser_Name(username);
		user.setPassword(password);
		user.setCust_Num(custmrID);
		
	     Boolean valid1=Dao.doUserRegistration(user);
		System.out.println(valid1);
	  return valid1;
	}
	public static String isCustomerRegistered(Customer customer,String IFSC)
	{
		String isRegistered=Dao.doRegistered(customer,IFSC);
		System.out.println("Service Reg");
		if(isRegistered.equalsIgnoreCase("No"))
		{
			return "NO";
		}else 
		{
			return isRegistered;
		}
		
		

	}
	
	//customer application status//
	
	
	public static String isCustomerPresent(String custNum) {
		Customer cust = new Customer();
		cust.setCust_Num(custNum);
		
		String custIdStatus = Dao.doCheckCustId(cust);
	    return custIdStatus;
       }
	
	
	//beneficiary addition
	
	public static boolean isBeneficiaryRegistered(Beneficiary beneficiary, String acc_no)
	{
		String isRegistered=Dao.registerBeneficiary(beneficiary, acc_no);
		if(isRegistered.equalsIgnoreCase("Yes"))
			return true;
		else
			return false;
	}
	
	
	//Transaction process
	
	public static ArrayList issuccessTransaction(Beneficiary beneficiary,String transactionAmount,String date,String time)
	{
		ArrayList<String> isSuccess=Dao.TransactionDetails(beneficiary, transactionAmount, date, time);
		
		if(isSuccess.size()==7)
		{
			return isSuccess;
		}else {
			return null;
		}
	}
	
	
	//Transaction details
	
	
	public static ArrayList viewTrans(String acc_no,String date1,String date2) 
	{
		ArrayList<String> values=new ArrayList<>();
		try {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date date =new Date();
		dateFormat.format(date);
		SimpleDateFormat sdfo = new SimpleDateFormat("dd/MM/yyyy");
		String date3="";
		String date4="";
		StringTokenizer s1=new StringTokenizer(date1,"-");
		while(s1.hasMoreTokens())
		{
			date3=s1.nextToken()+"/"+date3;
		}
				
		StringTokenizer s2=new StringTokenizer(date2,"-");
		while(s2.hasMoreTokens())
		{
			date4=s2.nextToken()+"/"+date4;
		}
		
        Date d1 = sdfo.parse(date3.substring(0,10)); 
        Date d2 = sdfo.parse(date4.substring(0,10));
        if((d1.after(date)) && (d2.after(date)))
        {
        	return null;
        }else {
		        if ((d1.before(d2)) || d1.equals(d2) ) { 
		        	  
		            // When Date d1 > Date d2 
		        	values=Dao.TransactionView(acc_no,date3.substring(0,10),date4.substring(0,10));
		        	System.out.println(values+" PEC");
		        	return values;
		        } else {
		        	return null;
		        }
        }
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	
	//Account Details Added Customer
	public static String accDetails(String custid)
	{
		String val=Dao.isAva(custid);
		return val;
		
	}
	
	
	//Beneficiary Table
	
	public static ArrayList<String> viewBene(Beneficiary beneficiary)
	{
		ArrayList<String> values=new ArrayList<String>();
		values=Dao.showbene(beneficiary);
		return values;
	}
	
	//IFSC LIST
	
	public static ArrayList<String> viewIFSCList()
	{
		ArrayList<String> values=new ArrayList<String>();
		values=Dao.listBranch();
		return values;
	}
	
	  //Branch Manager can see pending Request!!!


	public static ArrayList<String> brnmap1(Employee emp)
	{
		ArrayList<String> values=new ArrayList<String>();
		values=Dao.brmap1(emp);
		return values;
	}
	
	//Activate status by Branch Manager
	
	
	 public static String brnmap2(String job,String custid)
	 {
		  String status=Dao.brmap2(job,custid);
		  return status;
		 
	}
	 //fetching all states request
	 
	 public static ArrayList<Account_Master> brnmap3(Employee emp)
	 {
		 	ArrayList<Account_Master> am=new ArrayList<Account_Master>();
			am=Dao.fetchstate(emp);
			return am;
		 
	}
	 
	 //Login for Branch Manager
	 
	 public static boolean isEmployeeValid(String password,String EmpNum)
		{
			Employee employee=new Employee();
			employee.setEmp_Id(EmpNum);
			
			String mainPass=Dao.doEmployeeLogin(employee);
			
			if(mainPass.equals(password))
			{
				return true;
			}else {
				return false;
			}
		}
	 
	//branch manager ad by admin
		public static boolean branchManagerAdd(Employee empAdd) {
			boolean empAddVerify = Dao.branchManagerAddByAdmin(empAdd);
            System.out.println(empAddVerify);
			if (empAddVerify) {
				return true;
			} else {

				return false;
			}
		}
		
		
		//fetching branch manager details
		
		public static ArrayList<Employee> fetchBranchManager()
		{
			ArrayList<Employee>allEmployee= new ArrayList<>();
			allEmployee=Dao.branchManagerDetails();
			System.out.println(allEmployee+" SERVICE EMPLOYEE");
			return allEmployee;
		}
		
		
		
		// Update Branch manager details by Admin
		
		
				public static boolean branchManagerUpdate(Employee emp) {
					boolean empUpdate = Dao.updateBranchManagerDetails(emp);
					if (empUpdate) {
						return true;
					} else {
						return false;
					}

				}
				
				
				
	//Fetch Single Employee to screen
				public static Employee fetchBranchManagerSingle(String empId)
				{
					Employee femp=Dao.branchManagerDetails(empId);
					return femp;
				}
		
		
				
  //Delete EMployee from table By Admin
	public static boolean branchManagerDeleteByAdmin(String empId) {
		if (Dao.branchManagerDetailsDeleteByAdmin(empId)) {
			return true;
			} 
		    else
                {
			    	return false;	
                }
				}
		
	//Search by query
	
	public static Branch_Details receiveBranchDetails(String type,String value)
	{
		Branch_Details branch_Details=new Branch_Details();
		branch_Details=Dao.branchDetailsForAdmin(type,value);
		return branch_Details;
	}
	
	//Internet Transaction userrname Verification
	
	public static boolean uservalidity(String username,String Password)
	{
		boolean check=Dao.checkusernamevalid(username, Password);
		System.out.println(check+"  SERVICE CHECXK VALID");
		return check;
	}

}

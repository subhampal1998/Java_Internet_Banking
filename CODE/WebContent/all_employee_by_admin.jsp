<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid black;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: buttonface;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #0d5b96;
	color: white;
}
</style>

<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	text-align: left;
}
</style>
</head>
<body>
<%@ page import="java.util.*" %> 
<%@ page import="Table.*" %>
	<div class="container">
		<div class="row row-style">
			<div class="col-md-12  column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>Employee Details</h4>
					</div>
					<div class="panel-body">


						<div class="row">
							<div class="col-md-10 ">
								<form method="post" action="">

									<table class="col-md-offset-1" id="customers">
										<tr>
										<tr>
											<th>Emp_ID</th>
											<th>First_Name</th>
											<th>Last_Name</th>
											<th>Designation</th>
											<th>Contact No</th>
											<th>Pincode</th>
											<th>City</th>
											<th>State</th>
											<th>Country</th>
											<th>Branch Code</th>
											<th>Gender</th>
											<th>Action</th>
										</tr>
						<%try{
							ArrayList<Employee> list=(ArrayList)request.getAttribute("AllEmployeeDETAILS");
							System.out.println(list+" JSP EMPLOYEE");
							for(int i=0;i<list.size();i++)
							      { %>
										<tr>
											
											<td><%out.print(list.get(i).getEmp_Id()); %></td>
											<td><%out.print(list.get(i).getEmp_Fname()); %></td>
											<td><%out.print(list.get(i).getEmp_Lname()); %></td>
											<td><%out.print(list.get(i).getEmp_Designation()); %></td>
											<td><%out.print(list.get(i).getEmp_Contact_No()); %></td>
											<td><%out.print(list.get(i).getEmp_Pincode()); %></td>
											<td><%out.print(list.get(i).getEmp_City()); %></td>
											<td><%out.print(list.get(i).getEmp_State()); %></td>
											<td><%out.print(list.get(i).getEmp_Country()); %></td>
											<td><%out.print(list.get(i).getBranch_Code()); %></td>
											<td><%out.print(list.get(i).getEmp_Gender()); %></td>
											<td><div class="form-group">
													<form method="post" action="custLogin">
														<input type="hidden" name="EditAccount" value="<%out.print(list.get(i).getEmp_Id()); %>">
														<button class="btn btn-primary form-control">Edit</button>
													</form>
												</div>
												<div class="form-group">
													<form method="post" action="" >
														<input type="hidden" name="DeleteAccount" value="<%out.print(list.get(i).getEmp_Id()); %>">
														<button class="btn btn-danger form-control">Delete</button>
													</form>
												</div></td>
												<%}}catch(Exception e)
										              { 
													    System.out.println(e.getMessage());
												      }
										%>

										</tr>

									</table>
                                           
                                          
                                                
								</form>
								<div class="row" style="margin:25px">
								 <a href="newemployee.jsp" class="btn btn-danger col-md-offset-6">Add Manager</a>
                                 <a href="branchQuery.jsp" class="btn btn-danger col-md-offset-2">Branch Details</a>
                                                </div>
							</div>
						</div>
					</div>
				</div>
</body>
</html>




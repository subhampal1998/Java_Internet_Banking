<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee Update</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="include/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.dropbtn {
	background-color: #e7e7e7;
	color: black;
	padding: 16px;
	font-size: 16px;
	border: none;
}

.dropup {
	position: relative;
	display: inline-block;
}

.dropup-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	bottom: 50px;
	z-index: 1;
}

.dropup-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropup-content a:hover {
	background-color: #ccc
}

.dropup:hover .dropup-content {
	display: block;
}

.dropup:hover .dropbtn {
	background-color: #2980B9;
}
</style>

</head>
<body>

	<div class="container">
	<%@page import ="java.util.*" %>
	<%@ page import="Table.*" %>
		<div class="row row-style">
			<div class="col-xs-6 col-xs-offset-3 column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>Employee Details</h4>
					</div>
					<div class="panel-body">


                    <%  String male="false";
                        String female="false";
                        Employee emp= new Employee();
                          emp=(Employee)request.getAttribute("EmployeeData");
                          if(emp.getEmp_Gender().equalsIgnoreCase("Male"))
                          {
                        	  male="true";
                        	  female="false";
                          }
                          else
                          {
                        	  male="false";
                        	  female="true";
                          }
                          %>

						<div class="row">
							<div class="col-xs-8">
								<form method="post" action="">

									<div class="form-group">
										<label for="empid">Employee ID</label>
										<div id="empid" class="form-group">
											<input type="" class="form-control disable" name="empid"
												value="<%out.print(emp.getEmp_Id());%>" readonly>
										</div>
									</div>

									<div class="form-group">
										<label for="empfname">First Name</label>
										<div id="empfname" class="form-group">
											<input type="text" class="form-control" name="empfname"
												value="<%out.print(emp.getEmp_Fname());%>">
										</div>
									</div>

									<div class="form-group">
										<label for="emplname">Last Name</label>
										<div id="emplname" class="form-group">
											<input type="text" class="form-control" name="emplname"
												value="<%out.print(emp.getEmp_Lname());%>">
										</div>
									</div>

									<div class="form-group">
										<label for="empdeg">Designation</label>
										<div id="empdeg" class="form-group">
											<input type="text" class="form-control" name="empdeg"
												value="<%out.print(emp.getEmp_Designation());%>">
										</div>
									</div>

									<div class="form_group">
										<label for="empcontactno">Contact Number</label>
										<div class="form-group" id="empcontactno">
											<input type="text" class="form-control" name="empcontactno"
												data-validation="number"
												data-validation-allowing="negative,number" input
												name="color" data-validation="number"
												datavalidation-ignore="$" required="required"
												value="<%out.print(emp.getEmp_Contact_No());%>" maxlength="10" maxlength="10"
												pattern="\d*">
										</div>

										<div class="form-group">
											<label for="emppincode">Pincode</label>
											<div id="emppincode" class="form-group">
												<input type="text" class="form-control" value="<%out.print(emp.getEmp_Pincode()); %>"
													name="emppincode">
											</div>
										</div>

										<div class="form-group">
											<label for="empcity">City</label>
											<div id="empcity" class="form-group">
												<input type="text" class="form-control" value="<%out.print(emp.getEmp_City()); %>"
													name="empcity">
											</div>
										</div>
										<div class="form-group">
											<label for="empstate">State</label>
											<div id="empstate" class="form-group">
												<input type="text" class="form-control" value="<%out.print(emp.getEmp_State()); %>"
													name="empstate">
											</div>
										</div>

										<div class="form-group">
											<label for="empcountry">Country</label>
											<div id="empcountry" class="form-group">
												<input type="text" class="form-control" value="<%out.print(emp.getEmp_Country()); %>"
													name="empcountry">
											</div>
										</div>
										<div class="form-group">
											<label for="empbranch">Branch Code</label>
											<div id="empbranch" class="form-group">
												<input type="text" class="form-control" value="<%out.print(emp.getBranch_Code()); %>"
													name="empbranch">
											</div>
										</div>
										<div class="form-check form-group">
											<label class="form-check-label form-group"">Gender</label> <label
												class="form-check-label form-group"> <input
												type="radio" class="form-check-input" name="empgender"
												checked="true">Male
											</label> <label class="form-check-label form-group"> <input
												type="radio" class="form-check-input" name="empgender"
												checked="false">Female
											</label>
										</div>


										<div>
											<font color="red">*</font> All the fields are mandatory
										</div>

										<input type="submit" class="bg-primary" value="Submit" name="UpdateEmployee"/>




									</div>
								</form>
							</div>
						</div>
					</div>


					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html> 
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<SCRIPT type="text/javascript"> window.history.forward(); function noBack() { window.history.forward(); } </SCRIPT></HEAD><BODY onload="noBack();"  onpageshow="if (event.persisted) noBack();" onunload="">

<link rel="stylesheet" type="text/css" href="include/design.css">
<title>Customer</title>
</head>


<script>
			function myFunction() {

									document.getElementById().value="Registration";
									}
								</script>
<body class="bg-banking">
<div>
<jsp:include page="include/header.jsp"></jsp:include>

<%@page import="java.util.*" %>
     <%   
         ArrayList<String> list=new ArrayList();
        
       try{
	       list=(ArrayList)request.getAttribute("IFSC");
	       
	       }
	       catch(Exception e)
	       {
	       
	       }
	       %>
	<div class="container">
		<div class="row row-style">
			<div class="col-md-12  column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>New Customer Registration</h4>
					</div>
					<div class="panel-body">
						<p class="text-warning">Enter your Details</p>
						
				
				<div class="row">
							<div class="col-md-12">
								<form name="f1" method="post" action="custRegister"
									id="registertion">
									<div class="col-md-4">
										<label for="cust_Fname">Customer First Name<font color="red"> *</font></label>

										<div id="cust_Fname" class="form-group">
											<input type="text" class="form-control" name="cust_Fname"
												placeholder="Enter Customer First Name"
												required="required" minlength="1" data-validation="text">
										</div>
									     <label for="cust_Lname">Customer Last Name</label>

										<div id="cust_Lname" class="form-group">
											<input type="text" class="form-control" name="cust_Lname"
												placeholder="Enter Customer Last Name"
												required="required" minlength="1" data-validation="text">
										</div>
									</div>
									<%@page import="java.time.*,java.util.*,java.time.temporal.ChronoUnit" %>
									 
									 
									 <% LocalDate ld= LocalDate.now();
									    LocalDate ld1=ld.minus(18,ChronoUnit.YEARS);		 %>
									<div class="col-md-4">
										<label><b>Gender</b></label>
										<div class="radio">

											<label> <input type="radio" name="gender"
												value="male" required="required">Male
											</label> <label> <input type="radio" name="gender"
												value="female" required="required">Female
											</label>
										</div>
									</div>
									<div class="col-md-4">
										<label for="date-of-birth">Date-Of-Birth</label>
										<div class="form-group">
											<input type="date" name="dob" class="form-control"
												id="date-of-birth" required="required" max="<%out.print(ld1); %>">
										</div>
									</div>
									
									<div class="col-md-4">
										<label for="f_h_Fname">Father's /Husband's First Name</label>

										<div class="form-group" id="f_h_Fname">
											<input type="text" class="form-control" name="f_h_Fname"
												placeholder="Enter Customer Father/Husband first name"
												required="required" minlength="1">
										</div>
										<label for="f_h_Lname">Father's /Husband's Last Name</label>

										<div class="form-group" id="f_h_Lname">
											<input type="text" class="form-control" name="f_h_Lname"
												placeholder="Enter Customer Father/Husband last name"
												required="required" minlength="1">
										</div>
									</div>
									<div class="col-md-4">
										<label for="phone">Phone No<font color="red"> *</font></label>

										<div class="form-group" id="phone">
											<input type="text" class="form-control" name="ph_no"
												data-validation="number"
												data-validation-allowing="negative,number" input
												name="color" data-validation="number"
												datavalidation-ignore="$" required="required"
												placeholder="Enter customer ph no" minlength="10"
												maxlength="10" pattern="\d*">
										</div>
									</div>
									<div class="col-md-4">
										<label for="email">Email</label>

										<div class="form-group" id="email">
											<input type="email" name="email" class="form-control"
												name="email" placeholder="Enter your mail" required="required">
										</div>
									</div>
									<div class="col-md-4">
										<label for="address">Address</label>
										<div class="form-group">

											<textarea class="form-control" name="address" rows="4"
												id="address"></textarea>
										</div>
									</div>
									<div class="col-md-4">
										<label for="country">Country</label>
										<div class="form-group">
											<input type="text" name="country" class="form-control"
												name="country" placeholder="Enter your country">
										</div>
									</div>
									<div class="col-md-4">
										<label for="state"> State</label>
										<div class="form-group">
											<input type="text" name="state" class="form-control"
												name="state" placeholder="Enter your state">
										</div>
									</div>
									<div class="col-md-4">
										<label for="district">District</label>
										<div class="form-group">
											<input type="text" name="district" class="form-control"
												 placeholder="Enter your district">
										</div>
									</div>
									<div class="col-md-4">
										<label for="aadhar">Aadhar No <font color="red">
												*</font></label>

										<div class="form-group" id="aadhar_no">
											<input type="text" class="form-control" name="aadhar_no"
												data-validation="number"
												data-validation-allowing="negative,number" input
												name="color" data-validation="number"
												datavalidation-ignore="$" required="required"
												placeholder="Enter aadhar no" minlength="12" maxlength="12"
												pattern="\d*">
										</div>
									</div>
									<div class="col-md-4">
										<label for="pan">Pin Code <font color=""></font></label>

										<div class="form-group" id="pincode">
											<input type="text" class="form-control" name="pin_code"
												placeholder="Enter your pincode" minlength="6"
												maxlength="10">
										</div>
									</div>
									<div class="form-group col-md-4">
									<label for="password">Enter Your Password <font color="red">
												*</font></label>
									<div id="password" class="form-group">
										<input type="password" class="form-control" id="password"
											placeholder="enter password" name="password" required="required" onkeyup='check();'>
									</div>
								</div>
							
									   IFSC CODE: <select name="IFSC">
											<%for(int i=0;i<list.size();i++)
									    	{
									    	%>
											<option value="<%out.print(list.get(i));%>">
												<%out.println(list.get(i)); %>
											</option>
											<%} %>
										</select>
									</div>
							</div>
							<div class="col-md-offset-5">

								<input type="submit" id="myButton2" class="btn btn-primary" onclick="myFunction()" name="CustomerRegistration" >
								

							</div>
						</div>
						</form>

					</div>

				</div>

			</div>
			
		</div>
          
	</div>
	<div class="">
            <footer class="footer bg-primary">
                <div class="container">
                    <center><p>Copyright &copy;Fossil Bank. All Rights Reserved|Contact Us: +91 90000 00000</p></center>
                </div>
            </footer>
     </div> 
</body>
</html>

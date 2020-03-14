<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Login</title> 
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


</head>


<div class="container">
	<div class="row row-style">
		<div class="col-xs-6 col-xs-offset-3 column-style">
			<div class="panel panel-primary">
				<div class="panel-heading ">
					<h4>New Employee Register</h4>
				</div>
				<div class="panel-body">


					<div class="row">
						<div class="col-xs-8">
							<form method="post" action="#">

								<div class="form-group">
									<label for="emp_name">Employee Name</label>
									<div id="emp_name" class="form-group">
										<input type="text" class="form-control" name="emp_name"
											placeholder="Enter Employee name">
									</div>
								</div>



								<div class="form-group">
									<label for="email">Enter email</label>
									<div id="email" class="form-group">
										<input type="email" class="form-control"
											placeholder="enter Email" name="email">
									</div>
								</div>

								<div class="form-group">
									<label for="password">Enter Your Password</label>
									<div id="password" class="form-group">
										<input type="password" class="form-control"
											placeholder="enter password" name="password">
									</div>
								</div>
								<div class="form-group">
									<label for="cnf_password">confirm Your Password</label>
									<div id="cnf_password" class="form-group">
										<input type="password" class="form-control"
											placeholder="confirm password" name="CNF_password">
									</div>
								</div>
								<div class="form_group">
									<label for="contact_no">Contact Number</label>
									<div class="form-group" id="contact_no">
										<input type="text" class="form-control" name="contact_no" placeholder="Enter your number">
									</div>

									<div class="form-group">
										<label for="address">Address</label>
										<div id="address" class="form-group">
											<input type="address" class="form-control" name="address"
												placeholder="Enter your address">
										</div>
									</div>

									<div>
										<font color="red">*</font> All the fields are mandatory
									</div>

									<button class="btn btn-primary">Submit</button>
									Already have a user id ?<a href="data_entry_login.php">Employee
										Login</a>
								</div>
						</div>
					</div>
					</form>
				</div>
				<div class="panel-footer"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
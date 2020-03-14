<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee Add</title>
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
		<div class="row row-style">
			<div class="col-xs-6 col-xs-offset-3 column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>New Employee</h4>
					</div>
					<div class="panel-body">


						<div class="row">
							<div class="col-xs-8">
								<form method="post" action="custLogin">


									<div class="form-group">
										<label for="empfname">First Name</label>
										<div id="empfname" class="form-group">
											<input type="text" class="form-control" name="addfname"
												placeholder="Enter first name">
										</div>
									</div>

									<div class="form-group">
										<label for="emplname">Last Name</label>
										<div id="emplname" class="form-group">
											<input type="text" class="form-control" name="addlname"
												placeholder="Enter last name">
										</div>
									</div>

									<div class="form-group">
										<label for="empdeg">Designation</label>
										<div id="empdeg" class="form-group">
											<input type="text" class="form-control" name="addempdeg"
												placeholder="Enter designation">
										</div>
									</div>

									<div class="form_group">
										<label for="contactno">Contact Number</label>
										<div class="form-group" id="contactno">
											<input type="text" class="form-control" name="addcontactno"
												data-validation="number"
												data-validation-allowing="negative,number" input
												name="color" data-validation="number"
												datavalidation-ignore="$" required="required"
												placeholder="Enter contact number" maxlength="10"
												maxlength="10" pattern="\d*">
										</div>

										<div class="form-group">
											<label for="pincode">Pincode</label>
											<div id="pincode" class="form-group">
												<input type="text" class="form-control"
													placeholder="Enter pincode" name="addpincode">
											</div>
										</div>

										<div class="form-group">
											<label for="city">City</label>
											<div id="city" class="form-group">
												<input type="text" class="form-control"
													placeholder="Enter city" name="addcity">
											</div>
										</div>
										<div class="form-group">
											<label for="state">State</label>
											<div id="state" class="form-group">
												<input type="text" class="form-control"
													placeholder="Enter state" name="addstate">
											</div>
										</div>

										<div class="form-group">
											<label for="country">Country</label>
											<div id="country" class="form-group">
												<input type="text" class="form-control"
													placeholder="Enter country" name="addcountry">
											</div>
										</div>
										<div class="form-group">
											<label for="branch">Branch Code</label>
											<div id="branch" class="form-group">
												<input type="text" class="form-control"
													placeholder="Enter branch code" name="addbranch">
											</div>
										</div>
										<div class="form-check form-group">
											<label class="form-check-label form-group"">Gender</label> <label
												class="form-check-label form-group"> <input
												type="radio" class="form-check-input" name="addgender"
												value="Male">Male
											</label> <label class="form-check-label form-group"> <input
												type="radio" class="form-check-input" name="addgender"
												value="Female">Female
											</label>
										</div>


										<div>
											<font color="red">*</font> All the fields are mandatory
										</div>

										<input type="submit" class="bg-primary" value="Submit" name="ADMINADDEMPLOYEE" />




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
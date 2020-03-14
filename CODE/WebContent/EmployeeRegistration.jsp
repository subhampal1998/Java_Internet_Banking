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
	

<SCRIPT type="text/javascript"> window.history.forward(); function noBack() { window.history.forward(); } </SCRIPT></HEAD><BODY onload="noBack();"  onpageshow="if (event.persisted) noBack();" onunload="">
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function change()
{
	document.getElementById().value="LoginEmployee";
}
</script>
<link rel="stylesheet" type="text/css" href="include/design.css">
<meta charset="UTF-8">
<title></title>
</head>
<body class="bg-banking">
<jsp:include page="include/header.jsp"></jsp:include>
<jsp:include page="include/footer.jsp"></jsp:include>
	<div class="container">
		<div class="row row-style">
			<div class="col-xs-6 col-xs-offset-3 column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>Manager Login</h4>
					</div>
					<div class="panel-body">
						<p class="text-warning">Login for Manager</p>

						<div class="row">
							<div class="col-xs-8">
								<form method="post" action="custLogin">
									<div class="form-group">
										<input type="employeeid" class="form-control"
											placeholder="Employee Id" name="EMP_NUMBER">
									</div>

									<div class="form-group">
										<input type="password" class="form-control"
											placeholder="Password" name="EMP_PASSWORD">
									</div>
			
									<input type="submit" id="myButton1" class="btn btn-primary" onclick="change()" name="EmployeeLogin" >
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

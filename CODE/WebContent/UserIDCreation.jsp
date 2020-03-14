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
	   return "InternetLogin"; 
	}
	</script>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="include/design.css">
<title>InternetBankingRegistration</title>
</head>
<body class="bg-banking">
<jsp:include page="include/header.jsp"></jsp:include>
<jsp:include page="include/footer.jsp"></jsp:include>
<div class="container">
		<div class="row row-style">
			<div class="col-xs-6 col-xs-offset-3 column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>WELCOME TO INTERNET BANKING</h4>
					</div>
					<div class="panel-body">
						<p class="text-warning">SignUp for Internet Banking</p>

						<div class="row">
							<div class="col-xs-8">
								<form method="post" action="custLogin">
									<div class="form-group">
										<input type="customerid" class="form-control"
											placeholder="Username" name="INTERNET_USER_NUMBER">
									</div>

									<div class="form-group">
										<input type="password" class="form-control"
											placeholder="Password" name="INTERNET_USER_PASSWORD">
									</div>
								
									<input type="submit" id="myButton1" class="btn btn-primary" onclick="change()" name="Internetsubmit" >
								</form>
							</div>

						</div>
  <form method="post" action="custLogin">
						<button class="btn btn-primary col-md-offset-5" name="Home" value="Home" >
							<span class="glyphicon glyphicon-home"> Home 
						</button>
						</form>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
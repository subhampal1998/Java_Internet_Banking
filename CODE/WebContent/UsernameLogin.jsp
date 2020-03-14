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
<meta charset="UTF-8">
<title>LOGIN INTERNET BANKING</title>
<link rel="stylesheet" type="text/css" href="include/design.css">
</head>
<body class="bg-banking">
<jsp:include page="include/header.jsp"></jsp:include>
<jsp:include page="include/footer.jsp"></jsp:include>
	<div class="container">
		<div class="row row-style">
			<div class="col-xs-6 col-xs-offset-3 column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>Internet Banking</h4>
					</div>
					<div class="panel-body">
						<p class="text-warning">Login to Process the Transaction</p>
                     	<%String str=request.getParameter("getTaskId"); 
							
                                     request.setAttribute("ACCT",str);%>
						<div class="row">
							<div class="col-xs-8">
								<form method="post" action="custLogin">
									<div class="form-group">
										<input type="customerid" class="form-control"
											placeholder="Customer Id" name="username">
									</div>

									<div class="form-group">
										<input type="password" class="form-control"
											placeholder="Password" name="password">
											<input type="hidden" name="acctno" value="<%out.print(str);%>" />
											
									</div>
								
									<input type="submit" id="myButton1" class="btn btn-primary" name="CheckValidity" value="LoginTransaction" >
								   
								</form>
							</div>
                               <form method="post" action="custLogin">
						<button class="btn btn-primary col-md-offset-5" name="Home" value="Home" >
							<span class="glyphicon glyphicon-home"> Home 
						</button>
						</form>
						</div>

					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<SCRIPT type="text/javascript"> window.history.forward(); function noBack() { window.history.forward(); } </SCRIPT></HEAD><BODY onload="noBack();"  onpageshow="if (event.persisted) noBack();" onunload="">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="include/design.css">
<meta charset="UTF-8">
<title></title>
</head>
<body class="bg-banking">
<jsp:include page="include/header.jsp"></jsp:include>
<jsp:include page="include/footer.jsp"></jsp:include>
   <%@page import="java.util.*" %>
	<div class="container">
		<div class="row row-style">
			<div class="col-md-6 col-md-offset-3 ">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>Transaction</h4>
					</div>
					<%ArrayList<String> arr= (ArrayList)request.getAttribute("transactionBill");
					   %>
					<div class="panel-body">
						<p class="text-warning">Transaction Receipt</p>

						<div class="row form-group">
							<div class="col-md-8 ">
								<div class="col-md-6 ">Transaction ID:</div>
								<div class="col-md-4 col-md-offset-2"><%out.print(arr.get(4)); %></div>
							</div>


						</div>
						<div class="row form-group">
							<div class="col-md-8 ">
								<div class="col-md-6 ">Transaction Date:</div>
								<div class="col-md-4 col-md-offset-2"><%out.print(arr.get(5)); %></div>
							</div>


						</div>
						<div class="row form-group">
							<div class="col-md-8 ">
								<div class="col-md-6">Sender Name:</div>
								<div class="col-md-4 col-md-offset-2"><%out.print(arr.get(0)); %></div>
							</div>


						</div>
						<div class="row form-group">
							<div class="col-md-8 ">
								<div class="col-md-6">Receiver Name:</div>
								<div class="col-md-4 col-md-offset-2"><%out.print(arr.get(1)); %></div>
							</div>


						</div>
						<div class="row form-group">
							<div class="col-md-8 ">
								<div class="col-md-6">Amount:</div>
								<div class="col-md-4 col-md-offset-2"><%out.print(arr.get(2)); %></div>
							</div>


						</div>
						<div class="row form-group">
							<div class="col-md-8 ">
								<div class="col-md-6">Status:</div>
								<div class="col-md-4 col-md-offset-2"><%out.print(arr.get(6)); %></div>
							</div>


						</div>
						<div class="row form-group">
							<div class="col-md-8 ">
								<div class="col-md-6">Current Balance:</div>
								<div class="col-md-4 col-md-offset-2"><%out.print(arr.get(3)); %></div>
							</div>


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



</body>
</html>

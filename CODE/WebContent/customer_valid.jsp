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
<script>
function change()
{
	document.getElementById().value="CheckingStatus";
}
</script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row row-style">
			<div class="col-xs-6 col-xs-offset-3 column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>Customer Status check</h4>
					</div>
					<div class="panel-body">
						<p class="text-warning">Customer Status check</p>

						<div class="row">
							<div class="col-xs-8">
								<form method="post" action="custLogin">
									<div class="form-group">
										<input type="customerid" class="form-control"
											placeholder="Customer Id" name="CUST_NUMBER">
									</div>				
								
									<input type="submit" id="myButton3" class="btn btn-primary" onclick="change()" name="CheckStatus" >
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
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

<link rel="stylesheet" type="text/css" href="include/style.css">
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<div class="container">
		<div class="row row-style">
			<div class="col-xs-6 col-xs-offset-3 column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>Employee Search</h4>
					</div>
					<div class="panel-body">
						<p class="text-warning">Employee Search by Employee ID</p>

						<div class="row">
							<div class="col-xs-8">
								<form method="post" action="#">
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Enter Employee Number" name="bnfcId">
									</div>


									<button class="btn btn-primary">Submit</button>
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

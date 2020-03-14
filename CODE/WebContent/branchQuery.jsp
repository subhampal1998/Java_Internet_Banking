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
						<h4>Branch Search</h4>
					</div>
					<div class="panel-body">
						<p class="text-warning">Branch Search</p>

						<div class="row">
							<div class="col-xs-8">
								<form method="post" action="custLogin">

									<div class="form-group">
										<select class="form-control" name="QUERY">
											<option class="form-group" value="IFSC">IFSC Code</option>
											<option class="form-group" value="BRANCH_NAME">Branch Name</option>
											<option value="LOCATION">Location</option>

										</select>

									</div>
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="" name="dataName">

									</div>

									<button class="btn btn-primary" name="Searchbyquery" value="DATA">Submit</button>
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

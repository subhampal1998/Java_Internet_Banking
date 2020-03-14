<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Branch details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid black;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: buttonface;
}

#customers tr:hover {
	background-color: buttonshadow;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #0d5b96;
	color: white;
}
</style>

<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	text-align: left;
}
</style>
</head>
<body>
<%@page import="Table.*" %>
	<div class="container">
		<div class="row row-style">
			<div class="col-md-12  column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>Branch Details</h4>
					</div>
					<div class="panel-body">


						<div class="row">
							<div class="col-md-10 ">


								<table class="col-md-offset-1" id="customers">
									<tr>

										<th>IFSC Code</th>

										<th>Branch Name</th>
										<th>Location</th>

									</tr>
									<tr>
<% try{ Branch_Details bd=(Branch_Details)request.getAttribute("BRANCH_DETAILS_ADMIN"); %>
										<td><%out.print(bd.getIFSC_Code()); %></td>
										<td><%out.print(bd.getBranch_Name()); %></td>
										<td><%out.print(bd.getLocation()); %></td>
									</tr><%}catch(Exception e){%>
										<tr>
										<td><%out.print("No Data"); %></td>
										<td><%out.print("No Data"); %></td>
										<td><%out.print("No Data"); %></td></tr>
									<% } %>

								</table>



							</div>
						</div>
					</div>
				</div>
</body>
</html>
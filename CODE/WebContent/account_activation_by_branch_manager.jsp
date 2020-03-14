<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Account Activation Request</title>
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

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #0d5b96;
	color: white;
}
</style>
<link rel="stylesheet" type="text/css" href="include/design.css">
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
<body class="bg-banking">
<jsp:include page="include/headeremployee.jsp"></jsp:include>
<jsp:include page="include/footer.jsp"></jsp:include>
<%@ page import="java.util.*" %>
	<div class="container">
		<div class="row row-style">
			<div class="col-md-12  column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>Accounts Details</h4>
					</div>
					<div class="panel-body">


						<div class="row">
							<div class="col-md-10 ">
								<form method="post" action="">

									<table class="col-md-offset-1" id="customers">
										<tr>
										<tr>
											<th>Cust ID</th>
											<th>Cust Name</th>
											<th>Acc. No</th>
											<th>Opening Date</th>
											<th>Acc. State</th>
											<th>Action</th>
										</tr>
										
										<% try{
											ArrayList<String> list=(ArrayList)request.getAttribute("LIST");
											if(list.size()!=0){
											  for(int i=0;i<list.size();i+=5)
											  {
										%><tr>
											<td name="CustomerNumber"><% out.println(list.get(i)); %></td>
											<td><% out.println(list.get(i+1)) ;%></td>
											<td><% out.println(list.get(i+2)) ;%></td>
											<td><% out.println(list.get(i+3)) ;%></td>
											<td><% out.println(list.get(i+4)) ;%></td>
										
											<td><div class="form-group">
													<form method="post" action="custLogin">
														<input type="hidden" name="activate_button" value="<% out.print(list.get(i));%>">
														<button class="btn btn-primary form-control" >Activate</button>
													</form>
												</div>
												<div class="form-group">
													<form method="post" action="custLogin" >
														<input type="hidden" name="reject_button" value="<% out.print(list.get(i));%>">
														<button class="btn btn-danger form-control">Reject</button>
													</form>
												</div></td>
												</tr>
														<%}
											  }else{
											%>
												
												
											<tr>
											<td><% out.print("No DATA"); %></td>
											<td><% out.print("No DATA"); %></td>
											<td><% out.print("No DATA"); %></td>
											<td><% out.print("No DATA"); %></td>
											<td><% out.print("No DATA"); %></td>
										
											<td><% out.print("No DATA"); %></td>
										</tr>
												<%}
											
										}catch(Exception e)
										{System.out.println(e.getMessage()+ "EXCEOTION");
										%>
												<tr>
											<td><% out.print("No DATA"); %></td>
											<td><% out.print("No DATA"); %></td>
											<td><% out.print("No DATA"); %></td>
											<td><% out.print("No DATA"); %></td>
											<td><% out.print("No DATA"); %></td>
										
											<td><% out.print("No DATA"); %></td>
										</tr>
										<%} %>

									</table>
                                                     <form method="post" action="custLogin" >
														<input type="hidden" name="ALL" value="">
														<button class="btn btn-danger col-md-offset-6" style="margin-top:20px">AllDetails</button>
													</form>
								</form>

							</div>
						</div>
					</div>
				</div>
</body>
</html>




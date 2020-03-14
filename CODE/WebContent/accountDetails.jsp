<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<title>account details</title>

<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<SCRIPT type="text/javascript"> window.history.forward(); function noBack() { window.history.forward(); } </SCRIPT></HEAD><BODY onload="noBack();"  onpageshow="if (event.persisted) noBack();" onunload="">
<!-- Latest compiled JavaScript -->
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
<link rel="stylesheet" type="text/css" href="include/design.css">
</head>
<body class="bg-banking">
<jsp:include page="include/header.jsp"></jsp:include>
<jsp:include page="include/footer.jsp"></jsp:include>
	<div class="container">
		<div class="row row-style">
			<div class="col-md-12  column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>Accounts Details</h4>
						<div class="row">
						   <form method="post" action="transaction_between_date.jsp"><button value ="transactionhistory" name="Transaction_Date_select" class='btn btn-success col-md-offset-6 col-md-2'>  Transaction History </button></form>
						   <form method="post" action="UserIDCreation.jsp"><button value ="internetactivate" name="InternetUser" class='btn btn-success col-md-offset-1 col-md-2''>UPI Activation </button></form> 
					   </div>
					</div>
					<div class="panel-body">


						<div class="row">
							<div class="col-md-10 ">
								<form method="post" action="">
										
									<table class="col-md-offset-1" id="customers">
										<tr>
											<th>Customer Number</th>
											<th>Customer Name</th>
											<th>Account Type</th>
											<th>Account Number</th>
											<th>Opening Date</th>
											<th>IFSC Code</th>
											<th>Account Status</th>
											<th>UPI Status</th>
											<th>Balance</th>

										</tr>
										<%@page import="java.util.*"%>

										<%
									
											ArrayList<String> list = new ArrayList();
											try {
												list = (ArrayList) request.getAttribute("data12");
												System.out.println(list);
												if (list.size() == 0) {
										%>
										<tr>
											<td>
												<%
													out.print("No Data");
												%>
											</td>
											<td>
												<%
													out.print("No Data");
												%>
											</td>
											<td>
												<%
													out.print("No Data");
												%>
											</td>
											<td>
												<%
													out.print("No Data");
												%>
											</td>
											<td>
												<%
													out.print("No Data");
												%>
											</td>
											<td>
												<%
													out.print("No Data");
												%>
											</td>
											<td>
												<%
													out.print("No Data");
												%>
											</td>
											<td>
												<%
													out.print("No Data");
												%>
											</td>
											<td>
												<%
													out.print("No Data");
												%>
											</td>
										</tr>
										<%
											} else {
													for (int i = 0; i < list.size(); i += 9) {
										%>
										<tr>
											<td>
												<%
													out.print(list.get(i));
												%>
											</td>
											<td>
												<%
													out.print(list.get(i + 8));
												%>
											</td>
											<td>
												<%
													out.print(list.get(i + 2));
												%>
											</td>
											<td>
												<%
													out.print(list.get(i + 1));
												%>
											</td>
											<td>
												<%
													out.print(list.get(i + 4));
												%>
											</td>
											<td>
												<%
													out.print(list.get(i + 7));
												%>
											</td>
											<td id="account_status">
												<%
													out.print(list.get(i + 5));
												%>
											</td>
											<td id="upi_status">
												<%
													out.print(list.get(i + 6));
												
												%>
											</td>
											<td>
												<%
													out.print(list.get(i + 3));
												%>
											</td>
										</tr>
										<%
											}
												}
											} catch (Exception e) {
												out.println(e.getMessage());
											}
										%>
									</table>

									
								</form>
								
								<div style="margin-top: 50px;">
								<div class="row">
								<div class="col-md-4 col-md-offset-2">
									<form method="post" action="custLogin" id="test" >
										<input class="btn-danger btn-lg col-md-offset-2"
											type="submit" id="ButtonAdd" value="Add Beneficiary">
											<input type="hidden" name="AddBeneficiary" value="Add Beneficiary">
									</form>
									</div>
									<div class="col-md-6">
									
									<form method="post" action="custLogin" id="test1">
									<input type="hidden" name="MyBeneficiary" value="My Beneficiary">
										<input class="btn-primary btn-lg col-md-offset-4"
											type="submit" id="Button33" value="My Beneficiary">
									</form>
									</div>
									</div>
									<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>
									<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
			
			
									<script>
 
		   /////////////////
	   var x= document.getElementById("account_status").textContent;
	   var y= document.getElementById("upi_status").textContent;
	   var z= document.getElementById("test");
	   z.addEventListener("submit", function(e){
		   e.preventDefault();
		   if(x.trim() == "ACTIVE" && y.trim() == "ACTIVE")
		   {
		    z.submit();
		   }
	   else
		   {
		   sweetAlert("Internet Banking and Account should both be active to use this service");
		   }
	   });
	   
	   //////////////////////
	    var a= document.getElementById("account_status").textContent;
	   var b= document.getElementById("upi_status").textContent;
	   var c= document.getElementById("test1");
	   c.addEventListener("submit", function(e){
		   e.preventDefault();
		   if(a.trim() == "ACTIVE" && b.trim() == "ACTIVE")
		   {
		    c.submit();
		    
		   }
	   else
		   {
		   sweetAlert("Internet Banking and Account should both be active to use this service");
		   }
	   });
	   
	   
	   ///SweetAlert
	   
	   function sweetAlert(msg){
			$(document).ready(function(){
				swal(msg);
			});
		}

</script>

								</div>
							</div>
						</div>
						
					</div>
				</div>
</body>
</html>




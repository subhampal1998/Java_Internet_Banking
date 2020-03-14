<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<title>My Beneficiary details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<SCRIPT type="text/javascript"> window.history.forward(); function noBack() { window.history.forward(); } </SCRIPT></HEAD><BODY onload="noBack();"  onpageshow="if (event.persisted) noBack();" onunload="">
<!-- Latest compiled JavaScript -->
<script>
    function setValue(){
        var id = document.getElementById('Account').value;
        return id;
    }
</script>
	

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
						<h4>Beneficiary Details</h4>
					</div>
					<div class="panel-body"><div class="row">
							<div class="col-md-10 ">
							<table class="col-md-offset-1" id="customers">
									<tr>
									<th>Beneficiary Name</th>
									<th>Account Number</th>
									</tr>
									<%@page import="java.util.*" %>
								
								<% 
									   ArrayList<String> list=new ArrayList();
							        	ArrayList<String> list1=new ArrayList();
									try{
									  	list=(ArrayList)request.getAttribute("name");
									  	list1=(ArrayList)request.getAttribute("account");
									  	System.out.println(list);
									  	if(list.size()==0 || list==null ||list1.size()==0 || list1==null){
									  		%>
                                       <tr>
										<td><% out.print("No Data"); %></td>
										<td><%out.print("No Data"); %></td>
									  </tr>
									  		<% 
									  	}
									  	else{
									  for(int i=0;i<list.size();i++){
									%>  
									<tr>
										<td><% out.print(list.get(i)); %></td>
										<form method="post" action="UsernameLogin.jsp"><td><button><%out.print(list1.get(i)); %></button>
										<input type="hidden" name="getTaskId" value="<%out.print(list1.get(i));%>" /></td></form>
									</tr>
										<% }
									  }}
									  catch(Exception e)
									  {
										  %><tr>
												<td><% out.print("No Data"); %></td>
												<td><%out.print("No Data"); %></td>
											</tr> <%
									  } %>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			 <form method="post" action="custLogin">
						<button class="btn btn-primary col-md-offset-5" name="Home" value="Home" >
							<span class="glyphicon glyphicon-home"> Home 
						</button>
						</form>
		</div>
	</div>		
</body>
</html>
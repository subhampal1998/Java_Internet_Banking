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
	<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>
									<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
	<script>
		function validation(){
			if(document.myform.AMOUNT.value==""){
				sweetAlert("Amount cannot be blank");
				return false;
			}
			var r=parseInt(document.myform.AMOUNT.value);
		    if(Number.isInteger(r))
		    	{
					if(r<=0)
						{
						sweetAlert("Amount must be  a positive number");
						return false;
				        }

		    	}
			else{
				sweetAlert("Amount should be  a number");
				return false;
			    }
		    
		    	
		}
		function sweetAlert(msg){
			$(document).ready(function(){
				swal(msg);
			});
		}
			function change()
		   {
			document.getElementById().value="TransactionProcess";
		   }
			function exp(e)
			{
				
				var charcheck
				if(window.event)
					{
					keynum=e.keyCode
					}
				keychar=String.fromCharCode(keynum)
				charcheck=/\d/
				return charcheck.test(keychar)
			}
	</script>
	
<link rel="stylesheet" type="text/css" href="include/design.css">
<meta charset="UTF-8">
<title></title>
</head>
<body class="bg-banking">
<jsp:include page="include/header.jsp"></jsp:include>
<jsp:include page="include/footer.jsp"></jsp:include>
	<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
	<div class="container">
		<div class="row row-style">
			<div class="col-xs-6 col-xs-offset-3 column-style">
				<div class="panel panel-primary">
					<div class="panel-heading ">
						<h4>Transaction</h4>
					</div>
					<div class="panel-body">
						<p class="text-warning">Transaction Amount</p>

						<div class="row">
							<div class="col-xs-8">
								<form method="post" action="custLogin" id="accountchecked" name="myform" onsubmit="return(validation());">
								<%String str=request.getParameter("acctno"); 
                                     session.setAttribute("ACCTNO",str);%>
									<div class="form-group">
										<input type="number" class="form-control" id="AmountCheck" onkeypress="return exp(event)" 
											placeholder="Enter amount" name="AMOUNT">
											<input type="hidden" name="acctnotransaction" value="<%out.print(str);%>" />
									</div>
                                 

									<button class="btn btn-primary" id="Button5" name="Transaction" value="TransactionDone">Submit</button>
								</form>
							
							</div>
                                       </div>
                               <form method="post" action="custLogin">
						<button class="btn btn-primary col-md-offset-5" name="Home" value="Home" >
							<span class="glyphicon glyphicon-home"> Home 
						</button>
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

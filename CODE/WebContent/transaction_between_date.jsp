<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
    <head>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function change()
{
	document.getElementById().value="TransactionDetailsClick";
}
</script>


<link rel="stylesheet" type="text/css" href="include/design.css">
        <meta charset="UTF-8">
        <title></title>
    </head>
 <body class="bg-banking">
  <jsp:include page="include/header.jsp"></jsp:include>
  <jsp:include page="include/footer.jsp"></jsp:include>
     <div class="container">
            <div class="row row-style" >
                <div class="col-xs-6 col-xs-offset-3 column-style">
                    <div class="panel panel-primary">
                        <div class="panel-heading ">
                            <h4>Banking</h4>
                        </div>
                        <div class="panel-body">
                            <p class="text-warning">Transactions For a Time Period</p>
                            
                            <div class="row">
                                <div class="col-xs-8">
                                    <form method="post" action="custLogin">
                             <label for="from" >From</label>  
                                <div class="form-group" id="from">
                                    <input type="date" class="form-control" name="from_date" placeholder="From">
                                </div> 
                             <label for="to" >To</label>  
                                <div class="form-group" id="from">
                                    <input type="date" class="form-control" name="to_date" placeholder="To">
                                </div> 
                              
                              <button class="btn btn-primary" id="Button6"onclick="change()" name="Transaction Details">Submit</button>
                            </form> 
                                </div>
                                
                            </div>
                           
                        </div>
                        <div class="panel-footer"><a href=""></a></div>
                    </div>
                </div>
            </div>
             <form method="post" action="custLogin">
						<button class="btn btn-primary col-md-offset-5" name="Home" value="Home" >
							<span class="glyphicon glyphicon-home"> Home 
						</button>
						</form>
        </div>            
    </body>
</html>
    
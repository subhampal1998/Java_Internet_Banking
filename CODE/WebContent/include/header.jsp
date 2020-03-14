<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <link rel="stylesheet" type="text/css" href="include/design.css">
<% String s = (String)session.getAttribute("Customer_no");%>

 <div class="navbar navbar-light bg-primary text-secondary ">
            <div class="container ">
                <div class="navbar-header">
                <span class="navbar-brand">FOSSILS BANK</span>
                    <button type="button" class="navbar-toggle " data-toggle="collapse"  data-target="#myNavbar">
                        <span style="color: white" class="icon-bar togglecolor"></span>
                        <span style="color: white" class="icon-bar togglecolor"></span>
                        <span style="color: white" class="icon-bar togglecolor"></span>                        
                    </button>                    
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                  <%  if(s==null){ %>
                   <ul class="nav navbar-nav navbar-right ">
                   <li><a href="EmployeeRegistration.jsp" class="navscolor"><span class="glyphicon glyphicon-user" style="color: black;"></span><font style="color:black;">Employee Section</font></a></li> 
				            <li><a href = "login.jsp" class="navscolor"><span class="glyphicon glyphicon-log-user" style="color: black;"></span> <font style="color:black;">Customer Section</font></a></li>       
              </ul> <%}else{ %> 
                   		 <ul class="nav navbar-nav navbar-right ">
                   		 <li><a href="logout.jsp" class="navscolor"><span class="glyphicon glyphicon-log-in" style="color: white;"></span><font style="color:white;">  Logout</font></a></li> 

                   </ul><%} %>
                                  
                </div>
            </div>
 </div> 

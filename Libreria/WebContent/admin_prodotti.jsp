<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="ISO-8859-1">
<title>root@AS-New Reading</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
		<div class="nav-container">
		<nav class="centered-logo top-bar">
		  	<div class="container">
				  <div class="row">
				    <div class="col-sm-12 text-center">
				    	<form >
							<a href="index_admin.jsp"><img class="logo logo-dark" alt="Logo" src="images/eer.png" style="width: 80px; height: 60px;"></a>
						</form>
						<p class="lead">Accesso eseguito come Admin: </p>
						<p class="lead"> Admin -> <%=session.getAttribute("nome") %></p>
				    </div>
				    
				  </div>
				  <br></br>
				  <div class="row">			    
				    <div class="col text-center">
						<form action="admin_inserisci.jsp" method="get">
							<button class="btn btn-success">Aggiungi Prodotto</button>
						</form>
				    </div>	
				     <div class="col text-center">
						<p class="lead"><%	if(null!=request.getAttribute("Success")) out.print(request.getAttribute("Success").toString());
											if(null!=request.getAttribute("ErrorMessage")) out.print(request.getAttribute("ErrorMessage").toString());
						%></p>
			   	     </div>				    			    			    
				    <div class="col text-center">
						<form action="Logout" method="post">
							<button class="btn btn-danger">Logout</button>
						</form>
				    </div>				    
				  </div>
			 </div>

	    <%String db_url = "jdbc:mysql://localhost:3306/Librerie";
	      String user_db = "root";
	      String pass_db = "admin";
	      Connection connessione = null;
	      Class.forName("com.mysql.jdbc.Driver");
	      connessione = DriverManager.getConnection(db_url,user_db,pass_db);
	      Statement cmd = connessione.createStatement();
	      String query = "select * from Products";
	      ResultSet res = cmd.executeQuery(query);%>
	      
	      <br>
	      <div class="demo">
	        <div class="container demobg">
	            <div class="row text-center">
	            </div>		
	            <div class="row">
	            
	<% while(res.next()){ %>			    
	                <div class="col-md-4 col-sm-6 border border-success">
	                    <div class="pricingTable">
	                    	<br>
	                        <h3 class="title"><%= res.getString("titolo") %></h3>              
	                        <span class="subtitle"></span>
							<form action="OpzioniCatalogo" method="post">
							    <ul class="pricing-content">
							        <li><strong>isbn:</strong> <%= res.getString("isbn") %> <input name="isbn" type="hidden" value="<%= res.getString("isbn") %>"/></li>
							        <li><strong>titolo:</strong> <%= res.getString("titolo") %></li>
							        <li><strong>prezzo:</strong> &#8364 <%= res.getString("prezzo") %></li>
							        <li><strong>casaEditrice:</strong> <%= res.getString("casaEditrice") %></li>
							    </ul>
							    <div class="container">
							        <a href="admin_edit.jsp?isbn=<%= res.getString("isbn") %>" class="btn btn-success">Modifica</a>
							        <Button name="action" value="delete" type="submit" class="btn btn-primary">Elimina</Button>
							    </div>
							</form>

	                    </div>
	                </div>              
	<% }%>		                          
	        </div>
	    </div>
	    </div>
		<br>
</body>
</html>
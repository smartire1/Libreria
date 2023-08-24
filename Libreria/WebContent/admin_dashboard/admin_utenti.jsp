<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" import="model.*" import="dao.*" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="img/ico.png">
    <title>root@AS-New Readings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <!-- Aggiungi eventuali stili CSS o script JS necessari -->
</head>
<body>
		<div class="nav-container">
		<nav class="centered-logo top-bar">
		  	<div class="container">
				  <div class="row">
				    <div class="col-sm-12 text-center">
				    	<form >
							<a href="../index_admin.jsp"><img class="logo logo-dark" alt="Logo" src="images/eer.png" style="width: 80px; height: 60px;"></a>
						</form>
						<p class="lead">Accesso eseguito come Admin: </p>
						<p class="lead"> Bentornato <%=session.getAttribute("nome") %></p>
				    </div>
				  </div>
				  <br>
				  <div class="row">			    
				    <div class="col text-center">
						<form action="Logout" method="post">
							<button class="btn btn-danger">Logout</button>
						</form>
				    </div>
				  </div>
			</div>
		</nav>
	</div>
	<br>
	<%String db_url = "jdbc:mysql://localhost:3306/Librerie";
    String user_db = "root";
    String pass_db = "admin";
    Connection connessione = null;
    Class.forName("com.mysql.jdbc.Driver");
    connessione = DriverManager.getConnection(db_url,user_db,pass_db);
    CustomerDAO CDAO = new CustomerDAO(connessione);
    List<Customer> customers = CDAO.getAllCustomers();
	%>
	
     <div class="container table-center">
        <table class="table">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                    <th>Azioni</th>
                </tr>
            </thead>
            <tbody>
                <%-- Esegui un loop per ogni utente e crea una riga della tabella --%>
                <% for (Customer  c: customers) { if(!c.getRole()){%>
                    <tr>
                        <td><%= c.getNome() %></td>
                        <td><%= c.getCognome() %></td>
                        <td><%= c.getEmail() %></td>
                        <td>
                            <form action="../UserOrdini" method="post">
                                <input type="hidden" name="email" value="<%= c.getEmail() %>">
                                <button type="submit" class="btn btn-outline-danger">Visualizza ordini</button>
                            </form>
                        </td>
                    </tr>
                <% }} %>
            </tbody>
        </table>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" import="model.*" import="dao.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet"> 
    <link href="css/footer.css" rel="stylesheet"> 
    <link href="css/card.css" rel="stylesheet"> 
    <script src="js/addCart.js"></script>
    <link rel="icon" type="image/png" href="img/ico.png">
	
	<title>AS-New Readings</title>
	
	<style>
		.product h1 {
		    font-size: 19px;
		    font-weight: 900;
		    color: #000;
		    line-height: 26px;
		    text-transform: uppercase;
		    border-bottom: 3px solid rgba(139, 144, 157, 0.18);
		    padding: 0 0 8px;
		    margin: 0 0 35px;
		    transition: all 300ms linear 0ms;
		    text-align: left;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    overflow: hidden;		
		}
		.product img{
			height: 500px;
			width: 300px;
		}
	</style>
</head>
<body class="bgSand" id="catalogo">
	    <div class="bg-white">
			<div class="logo-container">
				<a href="index.jsp">
					<img src="img/as.png" alt="Logo">
				</a>
			</div>
	    </div>
	
	    <jsp:include page="navbar.jsp" />
	    
	    	<%
	    		String isbn = request.getParameter("isbn");
	    	
		        String db_url = "jdbc:mysql://localhost:3306/Librerie";
		        String user_db = "root";
		        String pass_db = "admin";
		        Connection connessione = null;
		        Class.forName("com.mysql.jdbc.Driver");
		        connessione = DriverManager.getConnection(db_url, user_db, pass_db);
		        
		        ProductsDAO PDAO = new ProductsDAO(connessione);
		        Products p = PDAO.getProductByIsbn(isbn);
	    	%>	    
	    
	    <br/>
	    <br/>
	    <br/>
	    
	    <div class="container product">
	    	<div class="row">
	    		<div class="col col-md-6">
					<div class="text-center"><img src="<%= p.getImg() %>" alt="img"></div>
				</div>
	    		<div class="col col-md-6">
					<h1><%= p.getTitolo()%></h1>
					<p></p>
				</div>				
	    	</div>
	    </div>
</body>
</html>
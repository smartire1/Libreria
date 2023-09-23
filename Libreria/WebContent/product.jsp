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
		.product li{
		    font-size: 21px;
		    font-style: italic;
		    color: #4d4a4a;
		    line-height: 26px;
		    text-align: left;
		}	
		.product button{
		    display: block;
		    padding: 15px 30px;
		    border-radius: 52px;
		    border: 2px solid transparent;
		    font-size: 14px;
		    font-weight: 700;
		    letter-spacing: 0.32px;
		    text-transform: uppercase;
		    text-align: center;
		    transition: all 300ms linear 0ms;
		    color: #ca293e;
		    background-color: #eef0f2;
		    border-color: #ca293e;
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
					<ul>
						<li><%= p.getIsbn()%></li>
						<li><%= p.getCasaEditrice()%></li>
						<li><%= p.getPrezzo()%> &#8364</li>
					</ul>
					<br>
					<br>
					<br>
					<button>Aggiungi al carrello</button>
				</div>				
	    	</div>
	    </div>
	    
    <br>
    <footer>
        <div class="footer-container">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <p>Seguici sui social per rimanere sempre aggiornato!</p>
                        <ul class="social-icons">
                            <li>
                                <a href="https://twitter.com/login?lang=it">
                                    <i class="fab fa-twitter fa-2x"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.facebook.com/">
                                    <i class="fab fa-facebook fa-2x"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.google.com/?hl=it">
                                    <i class="fab fa-instagram fa-2x"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>
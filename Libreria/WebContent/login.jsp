<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	
	<script>
	
		function validateForm() {
			let x = document.forms["log_in"]["email"].value;
			let y = document.forms["log_in"]["pass"].value:
			if(x == "" || y == "") {
				alert("riempi tutti i campi");
				return false;
			}
		}
	
	</script>
	
	<meta charset="ISO-8859-1">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>AS-New Reading</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	</head>
	
	<body>
	
	  	<div class="container">
		  <div class="row">
		    <div class="col-sm-12 text-center">
		    	<form >
					<a href="index.jsp"><img class="logo logo-dark" alt="Logo" src="images/eer.png" style="width: 80px; height: 60px;"></a>
				</form>
				<p class="lead">AS-New Reading</p>
		    </div>
		  </div>
		</div>
	
		<div class="container">
			<p class="lead text-center">Inserisci email e password</p>
				<form name="log_in" action="Login" method="post" onSubmit="return validateForm()">					
			  	<div class="container">
				  <div class="row text-center">
					<div class="col-sm-12">
						<input type="text" placeholder="email" name="email"/>
					</div>
					<div class="col-sm-12">
						<input type="password" placeholder="Password" name="pass"/>
					</div>
					<div class="col-sm-12">
						<br>
						<input type="submit" value="Accedi" class="btn btn-success btn-sm" />
					</div>
					<div class="col-sm">
						<br>
						<p class="lead"> Non sei registrato?</p>
						<a href="signin.jsp" class="btn btn-warning" target="_self">Registrati</a>
					</div>					
				  </div>
				</div> 							
				</form>
		 		<br></br>
		</div>
		<p class="lead text-center">
		<%
			if(null != request.getAttribute("errorMessage")) {
				out.print(request.getAttribute("errorMessage"));
			} 
		%>
		</p>
	</body>
</html>
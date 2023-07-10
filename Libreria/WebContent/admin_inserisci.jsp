<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>root@AS-New Reading</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<style>
  .form-group {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
  }
  .form-group strong {
    margin-right: 10px;
    width: 100px;
  }
</style>
    <script>
        function goBack() {
        	window.location.href = "admin_prodotti.jsp";
        }
    </script>
</head>
<body>
      <div class="container">
        <div class="row">
          <div class="col-sm-12 text-center">
            <form>
              <a href="index_admin.jsp"><img class="logo logo-dark" alt="Logo" src="images/eer.png" style="width: 80px; height: 60px;"></a>
            </form>
            <p class="lead">Accesso eseguito come Admin:</p>
            <p class="lead"> Admin -> <%=session.getAttribute("nome") %></p>
          </div>
        </div>
        <br></br>
        <div class="row">
          <div class="col text-center">
              <button type="button" onClick="goBack()" class="btn btn-warning">Indietro</button>
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
		<br>
		<div class="demo">
		  <div class="container demobg">
		    <div class="row justify-content-center"> <!-- Aggiunto justify-content-center per centrare orizzontalmente -->
		      <div class="col-md-4 col-sm-6 border border-danger">
		        <div class="pricingTable">
		          <br>
		          <h3 class="title">Inserimento nuovo prodotto</h3>
		          <span class="subtitle"></span>
		          <form action="OpzioniCatalogo" method="post">
		            <ul class="pricing-content">
		              <li class="form-group">
		                <strong>isbn:</strong>
		                <input type="text" class="form-control" placeholder="isbn" name="isbn" value="" />
		              </li>
		              <li class="form-group">
		                <strong>titolo:</strong>
		                <input type="text" class="form-control" placeholder="titolo" name="titolo" value="" />
		              </li>
		              <li class="form-group">
		                <strong>prezzo:</strong>
		                <input type="text" class="form-control" placeholder="prezzo" name="prezzo" value="" pattern="[0-9]+(\.[0-9]+)?" />
		              </li>
		              <li class="form-group">
		                <strong>casaEditrice:</strong>
		                <input type="text" class="form-control" placeholder="casaEditrice" name="casaEditrice" value="" />
		              </li>
		            </ul>
		            <div class="text-center"> <!-- Aggiunta la classe text-center per centrare verticalmente e orizzontalmente -->
		              <button name="action" value="insert" type="submit" class="btn btn-outline-success">Applica</button>
		            </div>
		          </form>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<br>
</body>
</html>
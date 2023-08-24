<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<link rel="icon" type="image/png" href="img/index.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<!-- CSS Files -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> 
	<link href="css/style.css" rel="stylesheet">
	<link href="css/footer.css" rel="stylesheet">
	<link rel="icon" type="image/png" href="img/ico.png">
	<title>Admin Dashboard</title>
</head>

<body>
	<div class="logo-container">
		<a href="index_admin.jsp">
			<img src="img/as.png" alt="Logo">
		</a>
		<p>Logged as Admin</p>
	</div>
	
	<jsp:include page="navbar.jsp" />
	
	<div class="text-center image-bg">
		<button style="margin-top:50px;" id="OP" class="btn btn-danger" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">Menu Operazioni</button>
		<div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
			<div class="offcanvas-body small">
				<div class="container text-center">
					<p class="lead">Operazioni</p>
					<hr>
					<div class="row">
						<div class="col-lg-4 col-md-4">
							<a href="admin_dashboard/admin_prodotti.jsp" class="btn btn-danger">Visualizza prodotti</a>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-12">
							<div class=logo-container-admin>
								<img src="img/as.png" alt="Logo" >
							</div>
						</div>						
						<div class="col-lg-4 col-md-4">
							<a href="admin_dashboard/admin_utenti.jsp" class="btn btn-danger">Visualizza utenti</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="footer">
		<div class="container">
			<nav>
				<p class="copyright text-center">
					Copyright
					<script>
						document.write(new Date().getFullYear())
					</script>
					<a href="index_admin.jsp">AS-New Readings</a>
				</p>
			</nav>
		</div>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>

</html>

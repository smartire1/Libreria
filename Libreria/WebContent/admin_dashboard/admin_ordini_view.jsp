<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" import="model.*" import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <base href="/Libreria/" />
    <meta charset="ISO-8859-1">
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="icon" type="image/png" href="img/ico.png">
    <title>root@AS-New Readings</title>
    <!-- CSS Files -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> 
    <link href="css/style.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link href="css/navbar.css" rel="stylesheet">
    <link href="css/card.css" rel="stylesheet"> 
       
</head>
<body>
    <div class="bg-white">
        <div class="logo-container">
            <a href="index_admin.jsp">
                <img src="img/as.png" alt="Logo">
            </a>
            <p style="margin-bottom: 0; padding-bottom: 15px;">Logged as Admin</p>
        </div>
    </div>
    
    <jsp:include page="../navbar.jsp" />
	<br></br>
    
    
    
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
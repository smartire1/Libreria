<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <link rel="icon" type="image/png" href="img/index.ico">
    <link href="css/style.css" rel="stylesheet"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Admin Dashboard</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!-- CSS Files -->
    <link href="dashboard/css/bootstrap.min.css" rel="stylesheet" />
    <link href="dashboard/css/light-bootstrap-dashboard.css?v=2.0.1" rel="stylesheet" />

</head>

<body>
    <div class="wrapper">
        <div class="sidebar bgSand" data-color="azure" data-image="dashboard/img/sidebar.png">

            <div class="sidebar-wrapper">
                <div class="logo-container">
                    <a href="index_admin.jsp" class="simple-text">
                        <img src="img/as.png">
                    </a>
                </div>
                <ul class="nav">
                    <li  class="nav-item active">
                        <a class="nav-link" href="index_admin.jsp">
                            <p>Admin</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="admin_dashboard/admin_prodotti.jsp">
                            <p>Prodotti</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="admin_dashboard/admin_utenti.jsp">
                            <p>Utenti</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class=" container-fluid  ">
                    <a class="navbar-brand" href="#Dashboard"> Dashboard </a>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#User">
                                    <span class="no-icon"> <%if(session.getAttribute("nome")==null) {}%><%=session.getAttribute("nome") %> </span>
                                </a>
                            </li>
                            <li class="nav-item">
                            <form action="Logout" method="post" name="log-out">                         
                                <a href="javascript:void(0)" class="nav-link" onclick="document.forms['log-out'].submit()">
                                    <span class="no-icon">Log out</span>
                                </a></form></li>
                        </ul>
                    </div>
                </div>
            </nav>
                                
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
        </div>
    </div>
</body>

</html>
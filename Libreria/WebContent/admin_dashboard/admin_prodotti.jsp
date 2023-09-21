<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <base href="/Libreria/" />
    <meta charset="ISO-8859-1">
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <link rel="icon" type="image/png" href="img/ico.png">
    <title>root@AS-New Readings</title>
    <!-- CSS Files -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> 
    <link href="css/style.css" rel="stylesheet">
    <link href="css/footer.css" rel="stylesheet">
    <link href="css/navbar.css" rel="stylesheet">
    <link href="css/card.css" rel="stylesheet"> 
    
    <script>
        function voidCartMessage() {
            document.getElementById("table-bg").style.height = "40%";    
        }
    </script>    
    
    <title>root@AS-New Readings</title>
</head>
<body class="bgSand">

	<%if(session.getAttribute("admin") == null) {%>
		<script>
        	window.location.href = 'catalogo.jsp';
    	</script>
	<%} %>

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
    <div class="container">
        <div class="row">                                    
            <div class="col text-center">
                <p class="lead">
                    <%
                    if(null!=request.getAttribute("Success"))
                        out.print(request.getAttribute("Success").toString());
                    if(null!=request.getAttribute("ErrorMessage"))
                        out.print(request.getAttribute("ErrorMessage").toString());
                    %>
                </p>
            </div>
        </div>
    </div>

    <%
    ResultSet res;
    if (null != request.getAttribute("show")) {
        res = (ResultSet) request.getAttribute("show");
    } else {
        String db_url = "jdbc:mysql://localhost:3306/Librerie";
        String user_db = "root";
        String pass_db = "admin";
        Connection connessione = null;
        Class.forName("com.mysql.jdbc.Driver");
        connessione = DriverManager.getConnection(db_url, user_db, pass_db);
        Statement cmd = connessione.createStatement();
        String query = "select * from Products";
        res = cmd.executeQuery(query);
    } 
    %>
    
    <div class="overlay" id="Overlay"></div>
    <div class="container text-center pricingTable" id="Popup">
        <button id="closeBtn"><i class="fas fa-times"></i></button>
        <div class="container">
            <h3 id="Operation" class="title">Inserimento nuovo prodotto</h3>
            <form action="OpzioniCatalogo" method="post" onSubmit="submitForm()">
                <ul class="pricing-content">
                    <li class="form-group">
                        <strong>isbn:</strong>
                        <input type="text" class="form-control" placeholder="isbn" name="isbn" id="bookIsbn" value="" />
                    </li>
                    <li class="form-group">
                        <strong>titolo:</strong>
                        <input type="text" class="form-control" placeholder="titolo" name="titolo" id="bookName" value="" />
                    </li>
                    <li class="form-group">
                        <strong>prezzo:</strong>
                        <input type="text" class="form-control" placeholder="prezzo" name="prezzo" id="bookPrezzo" value="" pattern="[0-9]+(\.[0-9]+)?" />
                    </li>
                    <li class="form-group">
                        <strong>casaEditrice:</strong>
                        <input type="text" class="form-control" placeholder="casaEditrice" name="casaEditrice" id="bookCasa" value="" />
                    </li>
                    <li class="form-group" id="inputImg">
                        <strong>copertina:</strong>
                        <input type="file" accept=".jpg, .jpeg, .png" class="form-control" name="sfoglia" id="myFileInput"/>
                        <input id="imageByteArray" name="imageByteArray" type="hidden"/>                                    
                    </li>              
                </ul>
                <div class="text-center">
                    <button id="addButton" type="submit" class="btn btn-outline-danger" name="action" value="insert">Applica</button>
                    <button id="editButton" type="submit" class="btn btn-outline-danger" name="action" value="edit" style="display: none;">Applica</button>    
                </div>                                                                                
            </form>         
        </div>
    </div>

    <br>
    <form action="ShowCatalogo" method="post">
        <div class="pricingTableBack">
        <div class="text-center pricingTable">
            <div class="row">
                <div class="col-lg-3 col-md-12 col-sm-12 ">
                    <p class="lead text-center"> Cerca per ISBN:</p>
                    <input name="Fisbn" type="text" placeholder="isbn"/>
                </div>
                <div class="col-lg-3 col-md-12 col-sm-12 ">
                    <p class="lead">Cerca per casa editrice:</p>
                    <select class="form-select" id="FcasaEditrice" name="FcasaEditrice">
                        <option value="" selected>Tutte</option>
                        <option value="Adelfi">Adelfi</option>
                        <option value="Rizzoli">Rizzoli</option>
                        <option value="Soprani">Soprani</option>
                        <option value="Ferdona">Ferdona</option>
                        <option value="Bollati Boringhieri">Bollati Boringhieri</option>
                        <option value="Feltrinelli">Feltrinelli</option>
                        <option value="Sellario">Sellario</option>
                        <!-- Aggiungi altre opzioni qui -->
                    </select>
                </div>
                <div class="col-lg-3 col-md-12 col-sm-12 ">
                    <div class="price-filter">
                        <p class="lead text-center"> Cerca per prezzo:</p>
                        <input type="range" id="max-price" name="Fmaxprice" min="0" max="30" step="1" value="30">
                        <span id="max-price-value">30</span> euro
                    </div>
                </div>
                <div class="col-lg-3 col-md-12 col-sm-12">
                    <div class="col-sm-12">                    
                        <button type="submit" class="btn btn-danger ">Applica filtri</button>
                    </div>
                    <hr>
                    <div class="col-sm-12">
                        <button onclick="addButton()" type="button" class="btn btn-danger open-popup-btn">Aggiungi Prodotto</button>  
                    </div>                  
                </div>
            </div>
        </div>
        </div>
    </form>
          
    <% if (null != request.getAttribute("Fisbn") || null != request.getAttribute("FcasaEditrice") || null != request.getAttribute("Fmaxprice")) { %>
        <div class="text-center filterTable">
            <div class="col-md-12">
                <p style="color: red;">Ricerca per:</p>
                <p><span style="color: black;">ISBN</span> - "<%= ("" == request.getAttribute("Fisbn").toString()) ? "Tutti" : request.getAttribute("Fisbn").toString() %>"</p>
                <p><span style="color: black;">Casa Editrice</span> - "<%= ("" == request.getAttribute("FcasaEditrice").toString()) ? "Tutte" : request.getAttribute("FcasaEditrice").toString() %>"</p>
                <p><span style="color: black;">Prezzo max</span> - "<%= ("" == request.getAttribute("Fmaxprice").toString()) ? "Max" : request.getAttribute("Fmaxprice").toString() %>"</p>
            </div>
        </div>
    <% } %>

    <div class="pricingTableBack" id="table-bg">
        <div class="row ">
            <% if (res.next()) { %>
                <% do {%>    
                <div class="col-xxl-3 col-xl-4 col-lg-6 d-flex justify-content-center" style="margin-top: 60px; ">
                    <div class="card pricingTable" >
                        <h3 class="title" ><%= res.getString("titolo") %> </h3>
                        <span><img src="<%= res.getString("img") %>" alt="img" class="card-img-top"></span>
                        <br>
                        <div class="card-body text-center">
                        <form action="OpzioniCatalogo" method="post">
                            <hr/><p><strong>ISBN: </strong><%= res.getString("isbn") %>  <input id="isbn" name="isbn" type="hidden" value="<%= res.getString("isbn") %>"/></p>
                            <p><strong>casa editrice:  </strong><%= res.getString("casaEditrice") %></p>
                            <p><strong>prezzo: </strong> <%= res.getString("prezzo") %> &#8364</p><hr/>
                            <button onclick="editButton('<%= res.getString("isbn") %>')" class="btn btn-danger open-popup-btn" type="button">Modifica</button>    
                            <br>
                            <br>
                            <button class="btn btn-danger" name="action" value="delete" type="submit">Elimina</button>
                        </form> 
                        </div>
                    </div>              
                </div>
                <%} while(res.next()); %>
            <% } else { %>
                <script>
                    voidCartMessage();
                </script>
                <p id="void">Nessun prodotto trovato</p>              
            <%} %>
        </div>
    </div> 
    
    <footer class="footer bg-white">
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
        
    <script>
        const maxPriceInput = document.getElementById('max-price');
        const maxPriceValue = document.getElementById('max-price-value');

        // Aggiorniamo il valore visualizzato quando l'utente sposta la barra
        maxPriceInput.addEventListener('input', () => {
            maxPriceValue.textContent = maxPriceInput.value;
        });
    </script>
            
    <script src="js/AddRemove.js"></script>
    <script src="js/offCanvas.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>

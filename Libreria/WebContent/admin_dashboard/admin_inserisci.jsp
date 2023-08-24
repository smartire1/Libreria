<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>root@AS-New Readings</title>
	<link rel="icon" type="image/png" href="img/ico.png">
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
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<form>
					<a href="../index_admin.jsp"><img class="logo logo-dark" alt="Logo" src="images/eer.png" style="width: 80px; height: 60px;"></a>
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
			<div class="row justify-content-center">
				<div class="col-md-4 col-sm-6 border border-danger">
					<div class="pricingTable">
						<br>
						<h3 class="title">Inserimento nuovo prodotto</h3>
						<span class="subtitle"></span>
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
								<li class="form-group">
									<strong>copertina:</strong>
									<input type="file" accept=".jpg, .jpeg, .png" class="form-control" name="sfoglia" id="myFileInput"/>
									<input id="imageByteArray" name="imageByteArray" type="hidden"/> 									
								</li>	              
							</ul>
							<div class="text-center">
								<button type="submit" class="btn btn-outline-success" name="action" value="insert">Applica</button>	
							</div>																				
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	<br>
	
	<script>

		function goBack() {
			window.location.href = "admin_prodotti.jsp";
		}

		function submitForm() {
			  const bookIsbn = document.getElementById("bookIsbn").value;
			  const bookName = document.getElementById("bookName").value;
			  const bookPrezzo = document.getElementById("bookPrezzo").value;
			  const bookCasa = document.getElementById("bookCasa").value;

			  if (bookIsbn === "" || bookName === "" || bookPrezzo === "" || bookCasa === "") {
			    alert("Riempi prima tutti i campi");
			    event.preventDefault();
			  } 
		}
		
		// Ottieni il riferimento all'elemento input
		const fileInput = document.getElementById("myFileInput");

		// Aggiungi l'event handler per l'evento 'change'
		fileInput.addEventListener("change", handleFileSelection);

		// Funzione di gestione dell'evento 'change'
		function handleFileSelection(event) {
		  const selectedFile = event.target.files[0];

		  if (selectedFile) {
		    // Esegui le operazioni desiderate con il file selezionato
		    console.log("File selezionato:", selectedFile.name);
		    base64conv(selectedFile);
		  } else {
		    console.log("Nessun file selezionato");
		  }
		}

		function base64conv(file) {
		    const selectedFile = file;

		    const reader = new FileReader();

		    reader.onload = function() {
		      const fileData = new Uint8Array(reader.result);

		      // Codifica il bytearray come Base64
    		  const base64Data = btoa(new Uint8Array(fileData).reduce((data, byte) => data + String.fromCharCode(byte), ''));

		      // Assegna il valore codificato al campo di input nascosto
		      document.getElementById("imageByteArray").value = base64Data;
	      	  console.log("file codificato");
		    };
		    reader.readAsArrayBuffer(selectedFile);
		}
		
	</script>
</body>
</html>

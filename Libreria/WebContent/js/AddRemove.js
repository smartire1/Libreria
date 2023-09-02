/**
 * 
 */
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
		
    function editButton(isbn) {
		document.getElementById("Operation").innerHTML = "MODIFICA DEL PRODOTTO PRESANTE";
		document.getElementById("bookName").value = "";
		document.getElementById("bookPrezzo").value = "";
		document.getElementById("bookCasa").value = "";		
		
        const isbnElement = document.getElementById("bookIsbn");
        isbnElement.value = isbn;
        isbnElement.setAttribute("readonly", "readonly");
        document.getElementById("inputImg").style.display = "none";

        document.getElementById("editButton").style.display = "block";
        document.getElementById("addButton").style.display = "none";	
    }
		
		function addButton(){
			document.getElementById("Operation").innerHTML = "INSERIMENTO NUOVO PRODOTTO";
        	const isbnElement = document.getElementById("bookIsbn");
        	isbnElement.value = isbn;
        	isbnElement.removeAttribute("readonly");
        				
			document.getElementById("bookIsbn").value = "";
			document.getElementById("bookName").value = "";
			document.getElementById("bookPrezzo").value = "";
			document.getElementById("bookCasa").value = "";
			
			document.getElementById("editButton").style.display = "none";
			document.getElementById("addButton").style.display = "block";
			document.getElementById("inputImg").style.display = "block";	
		}
		
		
		function viewButton(email, nome, cognome) {
		    document.getElementById("Operation").innerHTML = "User: " + email;
		    document.getElementById("Unome").value = nome;
		    document.getElementById("Ucognome").value = cognome;
		    document.getElementById("Uemail").value = email;
		    document.getElementById("toSend").value = email;
		}

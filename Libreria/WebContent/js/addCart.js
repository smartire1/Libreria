/**
 * 
 */

function addToCart(isbn, email) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      // Gestisci la risposta del server, se necessario
      var response = this.responseText;
      // Esegui altre azioni o aggiornamenti sulla pagina, se necessario
      alert('Prodotto aggiunto');
    }
  };
  xhttp.open("POST", "AggiungiCarrello", true); // Imposta il percorso al file Java che aggiunge al carrello
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("isbn=" + encodeURIComponent(isbn) + "&email=" + encodeURIComponent(email));
}

/*	stessa funziona ma usando jquery
function addToCart(isbn, email) {
  $.ajax({
    url: "AggiungiCarrello",
    type: "POST",
    data: {
      isbn: isbn,
      email: email
    },
    success: function(response) {
      // Gestisci la risposta del server, se necessario
      alert('Prodotto aggiunto');
    },
    error: function(xhr, status, error) {
      // Gestisci l'errore, se necessario
    }
  });
}
*/

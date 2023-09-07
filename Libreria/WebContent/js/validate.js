/**
 * 	login
 */

function validateForm() {
  let x = document.forms["log_in"]["email"].value;
  let y = document.forms["log_in"]["pass"].value;
  if (x === "" || y === "") {
    alert("Riempi tutti i campi");
    return false;
  }
}	

function showElement() {
  document.body.innerHTML += "<p class='lead text-center'><strong>Password errata o utente inesistente</strong></p>";
}

/**
 *	signin 
 */

function validateFormS() {  
  if ($("#nome1").val() === "" ||
      $("#cognome1").val() === "" ||
      $("#email1").val() === "" ||
      $("#pass1").val() === "") {
    alert('Riempire ogni campo richiesto');
    return false;
  }
  
 
  
 
  
};

/**
 * 
 */
    	function voidCartMessage() {
    		document.getElementById("pagah").disabled = true;
    		document.getElementById("fixedLogo").style.display = "none";
    		document.getElementById("fixedDiv").classList.remove("fixed-container");
    		document.getElementById("fixedDiv").classList.add("fixed-container-void");
    		document.getElementById("image-bg").classList.add("pricingTable");
    		document.getElementById("image-bg").style.height = "450px";  
    		document.getElementById("image-bg").style.width = "500px";   
    		document.getElementById("image-bg").style.marginLeft = "200px"; 		
    		}
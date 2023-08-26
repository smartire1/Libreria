/**
 * 
 */
    	function voidCartMessage() {
    		document.getElementById("pagah").disabled = true;
    		document.getElementById("fixedLogo").style.display = "none";
    		document.getElementById("fixedDiv").classList.remove("fixed-container");
    		document.getElementById("fixedDiv").classList.add("fixed-container-void");
    		document.getElementById("image-bg").classList.add("container");
    		document.getElementById("image-bg").classList.add("pricingTable");
    		document.getElementById("image-bg").classList.add("voidCart");		
    		}
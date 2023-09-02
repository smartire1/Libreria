/**
 * 
 */
const openBtns = document.querySelectorAll(".open-popup-btn");
const closeBtn = document.getElementById("closeBtn");
const popup = document.getElementById("Popup");
const overlay = document.getElementById("Overlay");

openBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
        popup.style.display = "block";
        overlay.style.display = "block";
    });
});

closeBtn.addEventListener("click", () => {
    popup.style.display = "none";
    overlay.style.display = "none";
});


const openBtns1 = document.querySelectorAll(".open-popup-btn");
const closeBtn1 = document.getElementById("closeBtn");
const popup1 = document.getElementById("Popup1");
const overlay1 = document.getElementById("Overlay");

openBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
        popup1.style.display = "block";
        overlay1.style.display = "block";
    });
});

closeBtn.addEventListener("click", () => {
    popup1.style.display = "none";
    overlay1.style.display = "none";
});

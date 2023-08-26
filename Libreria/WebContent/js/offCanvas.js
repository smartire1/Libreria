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

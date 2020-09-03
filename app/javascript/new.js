window.addEventListener('load', function(){
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
    
  price.addEventListener("input", function() {
    const inputValue = document.getElementById("item-price").value;
    tax.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
    profit.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
  })
})        
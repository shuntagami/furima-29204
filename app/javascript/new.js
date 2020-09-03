window.addEventListener('load', function(){

  const price = document.getElementById("item-price")
  price.addEventListener('input', function(){
    value = price.innerHTML
    console.log(value)
  })
})
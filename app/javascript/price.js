function post (){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value;
    addTaxPrice.innerHTML = Math.floor(0.1*inputValue);
    profit.innerHTML = inputValue - Math.floor(0.1*inputValue)
  })
}
window.addEventListener('load', post)
function price (){
  const price = document.getElementById("item-price")
  price.addEventListener("input", () => {
    const total = price.value
    const commission = document.getElementById("add-tax-price");
    commission.innerHTML = Math.floor(total * 0.1)
    const profit = document.getElementById("profit");
    profit.innerHTML = (total - Math.floor(total * 0.1));
  })
};

window.addEventListener('load', price);
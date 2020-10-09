function calc() {
  const item_price = document.getElementById("item-price");
  const tax = document.getElementById('add-tax-price');
  const gain = document.getElementById('profit');

  item_price.addEventListener('keyup', () => {
  const price = item_price.value;
    if (300 <= price && price <= 9999999) {
     const fee = Math.floor(price / 10);
     const prosper = (price - fee);
     
      tax.innerHTML = fee;
      gain.innerHTML = prosper;
     
   } else {
      tax.innerHTML = "";
      gain.innerHTML = "";
   }
  });
}
window.addEventListener("load", calc);

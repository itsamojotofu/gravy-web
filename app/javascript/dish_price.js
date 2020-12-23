window.addEventListener('load', () => {
  const priceInput = document.getElementById('dish-price');
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addCommission = document.getElementById('add-tax-price');
    addCommission.innerHTML = Math.floor(inputValue*0.05)

    const addProfit = document.getElementById('profit');
    addProfit.innerHTML = Math.floor(inputValue*0.95)
  })
}); 
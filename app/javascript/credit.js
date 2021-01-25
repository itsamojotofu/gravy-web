const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charging-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault(); 

    const formResult = document.getElementById("charging-form");
    const formData = new FormData(formResult);

    
    const credit = {
      number: formData.get("order[number]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
      cvc: formData.get("order[cvc]"),
    };

    Payjp.createToken(credit, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charging-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charging-form").submit();
      document.getElementById("charging-form").reset();
    });
  });
};


window.addEventListener("load", pay);
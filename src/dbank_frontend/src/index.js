import { dbank_backend } from "../../declarations/dbank_backend"

window.addEventListener("load", async function()
{
    update();

});

document.querySelector("form").addEventListener("submit", async function(event){
    event.preventDefault();

    const btn = event.target.querySelector("#submit-btn");

    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const withdrawAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    console.log(withdrawAmount);

    if (document.getElementById("input-amount").value.length != 0){
        btn.setAttribute("disabled", true);
        await dbank_backend.topUp(inputAmount);
        document.getElementById("input-amount").value = "";
    }
    if (document.getElementById("withdrawal-amount").value.length != 0){
        btn.setAttribute("disabled", true);
        await dbank_backend.withdraw(withdrawAmount);
        document.getElementById("withdrawal-amount").value = "";
    }

    // await dbank_backend.compound();

    update();
    btn.removeAttribute("disabled");

});

async function update(){
    await dbank_backend.compound();
    const currentAmount = await dbank_backend.checkBalance();
    document.getElementById("value").innerText = Math.round(currentAmount * 100)/100;

}
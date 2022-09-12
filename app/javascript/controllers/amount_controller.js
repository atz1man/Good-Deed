import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="amount"
export default class extends Controller {

  donate(e){
    let amount = parseInt(e.target.innerText.split("").slice(1).join(""))
    document.querySelector('#donation_amount').value = amount;
    this.form, "submit"
  }
}

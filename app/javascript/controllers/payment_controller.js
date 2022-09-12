import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="payment"
export default class extends Controller {
  static targets = ["form"]
  connect() {
  }

  preventRefresh(event) {
    // event.preventDefault()
  }
}

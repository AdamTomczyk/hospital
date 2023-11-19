import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  static targets = ["years"]

  connect() {
  }

  updateYears(e){
    this.yearsTarget.innerText = `${e.currentTarget.value} years`
  }
}

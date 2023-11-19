import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {
  static targets = ["accordion"]

  connect() {
    this.activateAccordion()
  }

  activateAccordion(){
    const acc = this.accordionTargets;
    let i;

    for (i = 0; i < acc.length; i++) {
      acc[i].addEventListener("click", function (e) {
        /* Toggle between adding and removing the "active" class,
        to highlight the button that controls the panel */
        this.classList.toggle("active");



        /* Toggle between hiding and showing the active panel */
        var panel = this.nextElementSibling;
        if (panel.style.display === "grid") {
          panel.style.display = "none";
          e.currentTarget.style.borderBottomLeftRadius = "12px"
          e.currentTarget.style.borderBottomRightRadius = "12px"
          e.currentTarget.innerText = "Options +"

        } else {
          panel.style.display = "grid";
          e.currentTarget.style.borderBottomLeftRadius = "0px"
          e.currentTarget.style.borderBottomRightRadius = "0px"
          e.currentTarget.innerText = "Options -"
        }
      });
    }

  }
}

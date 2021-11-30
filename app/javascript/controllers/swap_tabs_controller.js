import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["tabcompany", "contentcompany", "tabemployees", "contentemployees"]

  connect() {
    console.log("Hello from your Stimulus controller");
  }

  activateCompany() {
    this.tabcompanyTarget.classList.remove("inactive");
    this.contentcompanyTarget.classList.remove("d-none");
    this.tabemployeesTarget.classList.add("inactive");
    this.contentemployeesTarget.classList.add("d-none");
  }

  activateEmployees() {
    this.tabemployeesTarget.classList.remove("inactive");
    this.contentemployeesTarget.classList.remove("d-none");
    this.tabcompanyTarget.classList.add("inactive");
    this.contentcompanyTarget.classList.add("d-none");
  }
}

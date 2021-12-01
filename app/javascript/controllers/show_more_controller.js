import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["fulllist", "shortlist"]

  connect() {
    console.log("Hello from your first Stimulus controller")
  }

  unhide() {
    this.fulllistTarget.classList.remove("d-none");
    this.shortlistTarget.classList.add("d-none");
    console.log("unhiding text");
  }

  hide() {
    this.fulllistTarget.classList.add("d-none");
    this.shortlistTarget.classList.remove("d-none");
    console.log("hiding text");
  }

}

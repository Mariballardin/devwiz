import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loader"
export default class extends Controller {
  static targets = ['loading']
  connect() {
    console.log("hello from loader_controller")
  }

  display() {
    console.log("hello from submit")
    this.loadingTarget.classList.remove('d-none')
  }
}

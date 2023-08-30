import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="story-generation"
export default class extends Controller {
  static targets = ["content", "form"]

  connect() {
    console.log("Hello");
  }

  toggleContent() {
    this.contentTarget.classList.toggle("d-none");
    this.formTarget.classList.toggle("d-none");
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ["label", "input"];

  update() {
    console.log("Slider value changed:", this.inputTarget.value);
    const durations = ["2 min", "5 min", "10 min", "15 min", "20 min"];
    this.labelTarget.textContent = durations[this.inputTarget.value - 1];
  }
}

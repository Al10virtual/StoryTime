import { Controller } from "@hotwired/stimulus"



// Connects to data-controller="play"

export default class extends Controller {
  static values = {
    audioFile: String
  }

  connect() {
    console.log(this.audioFileValue);
  }

  go() {
    var audio = new Audio('/speech/elodie.mp3');
    var audio = new Audio(this.audioFileValue);
    audio.play();
    this.element.setAttribute("disabled", "");
  }
  stop() {
    audio.stop();
  }
}

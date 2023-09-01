import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="play"
export default class extends Controller {
  connect() {
    console.log('connecté a play2')
  }




  go() {
    var audio = new Audio('/speech/elodie.mp3');
    audio.play();
    this.element.setAttribute("disabled", "");
  }
  stop() {
    audio.stop();
  }
}

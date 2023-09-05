import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="play"

export default class extends Controller {
  static targets = ['playBtn', 'pauseBtn']

  static values = {
    audioFile: String
  }

  connect() {
    console.log(audio.url)
  }

  go() {
    this.audio = new Audio(this.audioFileValue);
    this.audio.play();
    this.playBtnTarget.classList.add('d-none');
    this.pauseBtnTarget.classList.remove('d-none');
  }

  pause() {
    this.audio.pause();
    this.playBtnTarget.classList.remove('d-none');
    this.pauseBtnTarget.classList.add('d-none');
  }
}

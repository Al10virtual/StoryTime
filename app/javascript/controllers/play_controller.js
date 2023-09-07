import { Controller } from "@hotwired/stimulus"
// import Plyr from 'plyr';

// Connects to data-controller="play"

export default class extends Controller {
  static targets = ['playBtn', 'pauseBtn']
  // static targets = ['playBtn', 'pauseBtn', 'plyrControl']

  static values = {
    audioFile: String
  }

  connect() {
    console.log('play_controller connected')
    // const player = new Plyr(this.plyrControlTarget);
  }

  go() {
    this.audio = new Audio(this.audioFileValue);
    console.log('go_method connected');
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

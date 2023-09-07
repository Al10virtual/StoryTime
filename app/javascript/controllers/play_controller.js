import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  static targets = ['playBtn', 'pauseBtn']

  static values = {
    audioFile: String
  }

  connect() {
    console.log('play_controller connected')
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

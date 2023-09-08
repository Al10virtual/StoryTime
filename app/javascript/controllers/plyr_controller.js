import { Controller } from "@hotwired/stimulus"
import Plyr from 'plyr'

// Connects to data-controller="plyr"
export default class extends Controller {
  connect() {
//     const controls = `
// <div class="plyr__controls">
//     <button type="button" class="plyr__control" data-plyr="restart">
//         <svg role="presentation"><use xlink:href="#plyr-restart"></use></svg>
//         <span class="plyr__tooltip" role="tooltip">Restart</span>
//     </button>
//     <button type="button" class="plyr__control" aria-label="Play, {title}" data-plyr="play">
//         <svg class="icon--pressed" role="presentation"><use xlink:href="#plyr-pause"></use></svg>
//         <svg class="icon--not-pressed" role="presentation"><use xlink:href="#plyr-play"></use></svg>
//         <span class="label--pressed plyr__tooltip" role="tooltip">Pause</span>
//         <span class="label--not-pressed plyr__tooltip" role="tooltip">Play</span>
//     </button>
//     <div class="plyr__progress">
//         <input data-plyr="seek" type="range" min="0" max="100" step="0.01" value="0" aria-label="Seek">
//         <progress class="plyr__progress__buffer" min="0" max="100" value="0">% buffered</progress>
//         <span role="tooltip" class="plyr__tooltip">00:00</span>
//     </div>
//     <div class="plyr__time plyr__time--current" aria-label="Current time">00:00</div>
//     <div class="plyr__time plyr__time--duration" aria-label="Duration">00:00</div>
//     <button type="button" class="plyr__control" aria-label="Mute" data-plyr="mute">
//         <svg class="icon--pressed" role="presentation"><use xlink:href="#plyr-muted"></use></svg>
//         <svg class="icon--not-pressed" role="presentation"><use xlink:href="#plyr-volume"></use></svg>
//         <span class="label--pressed plyr__tooltip" role="tooltip">Unmute</span>
//         <span class="label--not-pressed plyr__tooltip" role="tooltip">Mute</span>
//     </button>
//     <div class="plyr__volume">
//         <input data-plyr="volume" type="range" min="0" max="1" step="0.05" value="1" autocomplete="off" aria-label="Volume">
//     </div>
// </div>
// `;

    // Setup the player

    const player = new Plyr(this.element);

  }
}

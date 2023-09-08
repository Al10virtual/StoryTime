import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['playButton', 'pauseButton']

  static values = {
    audioFile: String
  }
  connect() {
    console.log('web_audio_controller connected')
    try {
      window.AudioContext = window.AudioContext || window.webkitAudioContext;
      window.audioContext = new window.AudioContext();
    } catch (e) {
      console.log("No Web Audio API support");
    }
  }
  go() {
    /*
    * WebAudioAPISoundManager Constructor
    */
    var WebAudioAPISoundManager = function (context) {
      this.context = context;
      this.bufferList = {};
      this.playingSounds = {};
    };

    /*
    * WebAudioAPISoundManager Prototype
    */
    WebAudioAPISoundManager.prototype = {
      addSound: function (url) {
        // Load buffer asynchronously
        var request = new XMLHttpRequest();
        request.open("GET", url, true);
        request.responseType = "arraybuffer";

        var self = this;

        request.onload = function () {
          // Asynchronously decode the audio file data in request.response
          self.context.decodeAudioData(
            request.response,

            function (buffer) {
              if (!buffer) {
                alert('error decoding file data: ' + url);
                return;
              }
              self.bufferList[url] = buffer;
            });
        };

        request.onerror = function () {
          alert('BufferLoader: XHR error');
        };

        request.send();
      },
      stopSoundWithUrl: function (url) {
        if (this.playingSounds.hasOwnProperty(url)) {
          for (var i in this.playingSounds[url]) {
            if (this.playingSounds[url].hasOwnProperty(i))
              this.playingSounds[url][i].noteOff(0);
          }
        }
      }
    };

    /*
    * WebAudioAPISound Constructor
    */
    var WebAudioAPISound = function (url, options) {
      this.settings = {
        loop: false
      };

      for (var i in options) {
        if (options.hasOwnProperty(i))
          this.settings[i] = options[i];
      }

      this.url = url + '.mp3';
      window.webAudioAPISoundManager = window.webAudioAPISoundManager || new WebAudioAPISoundManager(window.audioContext);
      this.manager = window.webAudioAPISoundManager;
      this.manager.addSound(this.url);
    };

    /*
    * WebAudioAPISound Prototype
    */
    WebAudioAPISound.prototype = {
      play: function () {
        var buffer = this.manager.bufferList[this.url];
        //Only play if it's loaded yet
        if (typeof buffer !== "undefined") {
          var source = this.makeSource(buffer);
          source.loop = this.settings.loop;
          source.noteOn(0);

          if (!this.manager.playingSounds.hasOwnProperty(this.url))
            this.manager.playingSounds[this.url] = [];
          this.manager.playingSounds[this.url].push(source);
        }
      },
      stop: function () {
        this.manager.stopSoundWithUrl(this.url);
      },
      getVolume: function () {
        return this.translateVolume(this.volume, true);
      },
      //Expect to receive in range 0-100
      setVolume: function (volume) {
        this.volume = this.translateVolume(volume);
      },
      translateVolume: function (volume, inverse) {
        return inverse ? volume * 100 : volume / 100;
      },
      makeSource: function (buffer) {
        var source = this.manager.context.createBufferSource();
        var gainNode = this.manager.context.createGainNode();
        gainNode.gain.value = this.volume;
        source.buffer = buffer;
        source.connect(gainNode);
        gainNode.connect(this.manager.context.destination);
        return source;
      }
    };
    var storySound, backgroundMusic;

    backgroundMusic = new WebAudioAPISound('/speech/music', { loop: true });
    storySound = new WebAudioAPISound(this.audioFileValue);

    backgroundMusic.play();
    storySound.play();

    //Play background music for 30 seconds
    // setTimeout(function () {
    //   backgroundMusic.stop();
    // }, 30 * 1000);
  }
  pause() {
    var storySound, backgroundMusic;

    storySound = new WebAudioAPISound(this.audioFileValue);
    backgroundMusic = new WebAudioAPISound('/speech/music', { loop: true });

    backgroundMusic.pause();
    storySound.pause();

    //Play background music for 30 seconds
    // setTimeout(function () {
    //   backgroundMusic.stop();
    // }, 30 * 1000);
  }
}

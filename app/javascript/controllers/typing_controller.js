import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js'

// Connects to data-controller="typing"
export default class extends Controller {
  static targets = ["typeA", "typeB", "typeC", "typeD", "typeE", "typeF", "typeG", "typeH"]

  connect() {

    console.log("Typing field connected");

    const typed = new Typed('#typing-field', {
      strings: [
       this.typeATarget.innerText,
       this.typeBTarget.innerText,
       this.typeCTarget.innerText,
       this.typeDTarget.innerText,
       this.typeETarget.innerText,
       this.typeFTarget.innerText,
       this.typeGTarget.innerText,
       this.typeHTarget.innerText,
       this.typeATarget.innerText,
       this.typeBTarget.innerText,
       this.typeCTarget.innerText,
       this.typeDTarget.innerText,
       this.typeETarget.innerText,
       this.typeFTarget.innerText,
       this.typeGTarget.innerText,
       this.typeHTarget.innerText,
      ],
      typeSpeed: 40,
      fadeOut: true,
      fadeOutClass: 'typed-fade-out',
      cursorClass: 'typed-cursor',
      fadeOutDelay: 2000,
      showCursor: false,
      // loop: true,
      // loopCount: Infinity
    });
  }
}

import { Controller } from "@hotwired/stimulus"
import Plyr from 'plyr'

// Connects to data-controller="plyr"
export default class extends Controller {
  connect() {
    const player = new Plyr(this.element);
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="split-form"
export default class extends Controller {

  static targets = ["section"];
  connect() {

  }

  next(event) {
    // 1. Je veux récupérer l'element du dom dans lequel mon bouton est
    const currentSection = event.currentTarget.parentElement;
    // 2. Je récuperer toute mes sections
    const sections = this.sectionTargets
    // 3. Je récupère l'index de l'element (1) dans le tableau de mes sections (2)
    const currentIndex = sections.indexOf(currentSection);
    // 4. Sur l'element (1), je toggle la classe "active"
    currentSection.classList.toggle("active");
    // 5. Sur l'element qui a l'index suivant, je toggle la classe "active"
    sections[currentIndex + 1].classList.toggle("active");

  }
  previous(event) {
    // 1. Je veux récupérer l'element du dom dans lequel mon bouton est
    const currentSection = event.currentTarget.parentElement.parentElement;
    // 2. Je récuperer toute mes sections
    const sections = this.sectionTargets
    // 3. Je récupère l'index de l'element (1) dans le tableau de mes sections (2)
    const currentIndex = sections.indexOf(currentSection);
    // 4. Sur l'element (1), je toggle la classe "active"
    currentSection.classList.toggle("active");
    // 5. Sur l'element qui a l'index suivant, je toggle la classe "active"
    sections[currentIndex - 1].classList.toggle("active");

  }
}

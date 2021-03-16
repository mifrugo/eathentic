import { Controller } from "stimulus";

export default class extends Controller {

  click() {
    const element = this.element.getAttribute('data-target')
    document.querySelector(`section[data-section="${element}"]`).scrollIntoView({ behavior: 'smooth', block: 'start' });
  }

}

import { Controller } from "stimulus";

export default class extends Controller {

  click() {
    const element = this.element.getAttribute('data-target')

    $('html, body').animate({
      scrollTop: $(`section[data-section="${element}"]`).offset().top
    }, 1000);
  }

}

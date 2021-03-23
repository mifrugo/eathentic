import { Controller } from "stimulus";

export default class extends Controller {

  count() {
    console.log(this.element.getAttribute('data-value'))
  }
}

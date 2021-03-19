import { Controller } from "stimulus";

export default class extends Controller {

  spinner(event) {
    const el = document.querySelector('form i')
    const classes = ['fas', 'fa-spinner', 'fa-pulse', 'fa', 'fa-search']
    classes.forEach(cl => el.classList.toggle(cl))
  }

}

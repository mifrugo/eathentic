import { Controller } from "stimulus";

export default class extends Controller {

  click() {

    document.querySelector('#sidebar').classList.toggle('active');
    document.body.classList.toggle('sidebar-open')

    const barNav = document.querySelector('#sidebarCollapse > i')
    const classes = ['fa-bars', 'fa-times']
    classes.map(c => barNav.classList.toggle(c))

  }

  close() {
    document.body.classList.contains('sidebar-open') && this.click()
  }

}

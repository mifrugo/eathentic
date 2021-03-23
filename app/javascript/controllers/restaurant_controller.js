import { Controller } from 'stimulus'

export default class extends Controller {

  redirect() {
    console.log(this.targetElement)
  }

}

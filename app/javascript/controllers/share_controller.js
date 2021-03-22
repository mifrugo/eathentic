import { Controller } from "stimulus";

export default class extends Controller {
  click() {
    const shareData = {
      title: 'Eathentic',
      text: 'Share this page',
      url: window.location.href
    }
    try {
      navigator.share(shareData)
    } catch(err) {
      resultPara.textContent = 'Error: ' + err
    }
  }
}

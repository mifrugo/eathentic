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
      window.open(`https://addthis.com/bookmark.php?url=${window.location.href}`)
    }
  }
}

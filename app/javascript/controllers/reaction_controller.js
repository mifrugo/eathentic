import { Controller } from "stimulus";

export default class extends Controller {

  count() {
    window.navigator.vibrate(100);

    const aVote = this.element.getAttribute('data-value')
    const id = Number(this.element.closest("div").dataset["id"])
    fetch(`/reviews/${id}/reactions`, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        authenticity_token: window._token, number: aVote
      })
    })
      .then(response => response.json())
      .then(data => {
        console.log(data.action)
      if (data.action == "saved" ) {
        document.querySelector(`.counter-${id} .badge`).innerHTML = data.counter
        this.element.closest(".reactions-icons").remove()
      }
    })
  }
}

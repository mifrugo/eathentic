import { Controller } from "stimulus";

export default class extends Controller {

  count() {
    const classes = ['badge-info', 'badge-success', 'badge-warning']
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
        if (data.action == "saved" ) {
          let badge = document.querySelector(`.counter-${id} .badge`)
          badge.innerHTML = data.counter
          classes.forEach(c => badge.classList.remove(c))

          badge.classList.add(
            data.counter === 0 ? 'badge-warning' : ( data.counter > 0 ? 'badge-success' : 'badge-danger')
          )

          this.element.closest('.reaction-list').innerHTML = this.element.outerHTML
        }
    })
  }
}

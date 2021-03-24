import { Controller } from 'stimulus'

const favorite = 'favorite'

export default class extends Controller {


  toggle(e) {
    e.stopPropagation()
    const card = this.element.closest('.card')
    const id = Number(card.dataset['id'])
    const type = this.element.dataset['type']

    fetch(`/${type}/${id}/favorite`, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        authenticity_token: window._token
      })
    })
      .then(response => response.json())
      .then(data => {
        if( data.action == 'removed') {
          $(`.card-${type}[data-id="${id}"]`).removeClass(favorite)
          $(`#favoriteModal .card-${type}[data-id="${id}"]`).slideUp(500, function () { $(this).remove()})
        } else {
          $(`#favoriteModal #pills-${type}`).prepend(card.outerHTML)
          $(`.card-${type}[data-id="${id}"]`).addClass(favorite)
        }
      })
  }
}

import { Controller } from 'stimulus'

const favorite = 'favorite'

export default class extends Controller {


  toggle(e) {
    e.stopPropagation()
    const card = this.element.closest('.favorite-container')
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
          $(`.favorite-container-${type}[data-id="${id}"]`).removeClass(favorite)
          $(`#favoriteModal .favorite-container-${type}[data-id="${id}"]`).slideUp(500,
            function () {
              $(this).remove()
              if ($(`#favoriteModal #pills-${type} .favorite-container`).length === 0) {
                $(`#favoriteModal #pills-${type} .no-results`).slideDown()
              }
            }
          )

        } else {
          card.nodeName !== 'HEADER' && $(`#favoriteModal #pills-${type}`).prepend(card.outerHTML)
          $(`.favorite-container-${type}[data-id="${id}"]`).addClass(favorite)
          $(`#favoriteModal #pills-${type} .no-results`).slideUp()
        }
      })
  }
}

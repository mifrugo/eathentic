import { Controller } from 'stimulus'

const favorite = 'favorite'

export default class extends Controller {


  toggle(e) {
    e.stopPropagation()
    const card = this.element.closest('.card')

    fetch(`/${this.element.dataset['type']}/${Number(card.dataset['id'])}/favorite`, {
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
          card.classList.remove(favorite)
        } else {
          card.classList.add(favorite)
        }
      })
  }
}

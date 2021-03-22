import Autocomplete from '@trevoreyre/autocomplete-js'
import '@trevoreyre/autocomplete-js/dist/style.css'


const autoComplete = () => {
  new Promise((resolve, reject) => {
    new Autocomplete('#autocomplete', {

      search: input => {
        const url = `/api/v1/search?q=${encodeURI(input)}`

        return new Promise(resolve => {
          if (input.length < 3) {
            return resolve([])
          }

          fetch(url)
            .then(response => response.json())
            .then(data => {
              console.log(data)
              resolve(data)
            })
        })
      },

      renderResult: (result, props) => `
        <li ${props}>
          <div class="search-name">
            ${result.name}
          </div>
          <div class="search-type">
            ${result.type[0].toUpperCase() + result.type.slice(1)}
          </div>
        </li>
      `,

      getResultValue: result => result.name,

      onSubmit: result => {
        console.log(result)
        window.location.href = `${result.url}/${result.id}`
      },

      onShow: event => {
        console.log(event)
      },

    })
  }).then(() => {
    console.log('kl')
  })
}

export { autoComplete }

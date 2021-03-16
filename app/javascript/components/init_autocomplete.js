import Autocomplete from '@trevoreyre/autocomplete-js'
import '@trevoreyre/autocomplete-js/dist/style.css'

const wikiUrl = 'https://en.wikipedia.org'
const params = 'action=query&list=search&format=json&origin=*'

const autoComplete = () => {
  new Promise((resolve, reject) => {
    new Autocomplete('#autocomplete', {

      search: input => {
        const url = `${wikiUrl}/w/api.php?${params
          }&srsearch=${encodeURI(input)}`

        return new Promise(resolve => {
          if (input.length < 3) {
            return resolve([])
          }

          fetch(url)
            .then(response => response.json())
            .then(data => {
              resolve(data.query.search)
            })
        })
      },


      getResultValue: result => result.title,
      onSubmit: result => {
        console.log('lol')
        window.open(`${wikiUrl}/wiki/${encodeURI(result.title)
          }`)
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

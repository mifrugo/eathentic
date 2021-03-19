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


      getResultValue: result => {
        console.log(result)
      },
      onSubmit: result => {
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

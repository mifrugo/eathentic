import * as mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
import MapboxGeocoder from 'mapbox-gl-geocoder/dist/mapbox-gl-geocoder.min.js';
import 'mapbox-gl/dist/mapbox-gl.css';
import 'mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

let mapMarkers = []
let map;

const clearMarkers = () => {
  mapMarkers.forEach((marker) => marker.remove());
  mapMarkers = [];
};

const formatHTML = (_k, val) => {
  let html = `<h5 class="text-center">${val.name}</h5>`

  if (val.address !== null) {
    html += `<h6>${val.address}</h6>`
  }

  html += `<a href="/restaurants/${val.id}" class="btn btn-outline-secondary btn-rounded py-0">Discover it!</a>`

  return `<div class="text-center mt-3">${html}</div>`
};

const setMarker = () => {

  if (document.querySelector('#restaurantMap').dataset['markers']) {
    const markers = JSON.parse(document.querySelector('#restaurantMap').dataset['markers']);

    for (let [key, value] of Object.entries(markers)) {

      const popup = new mapboxgl.Popup({ offset: 25 }).setHTML(formatHTML(key, value));

      let el = document.createElement('div');
      el.classList.add('marker')

      let marker = new mapboxgl.Marker({color: "#e4a502"})
        .setLngLat([value.longitude, value.latitude])
        .setPopup(popup)
        .addTo(map);

      mapMarkers.push(marker)
    }

  }
};

const getNewRestaurants = ( {latitude, longitude} = {} ) => {

  const {lng, lat} = (latitude && longitude) ? { longitude, latitude } : map.getCenter();

  if ( lng && lat ) {

    fetch(`/api/v1/restaurants?latitude=${lat}&longitude=${lng}`)
      .then(response => response.json())
      .then(data => {
        document.querySelector('#restaurantMap').setAttribute('data-markers', JSON.stringify(data))
        clearMarkers()
        setMarker()
      });

  }
}

const restaurantMap = () => {

  console.log('Map init');

  mapboxgl.accessToken = document.querySelector('#restaurantMap').dataset['apikey']

  map = new mapboxgl.Map({
    container: 'restaurantMap',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [document.querySelector('#restaurantMap').dataset['longitude'], document.querySelector('#restaurantMap').dataset['latitude']],
    zoom: 12,
  });

  setMarker()

  const geocoder = new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
    mapboxgl: mapboxgl
  })

  map.addControl(geocoder)

  map.on('moveend', function (e) {
    getNewRestaurants()
  })

  geocoder.on('result', function (ev) {
    const [ latitude, longitude ] = ev.result.center

    if (typeof latitude !== 'undefined' && typeof longitude !== 'undefined' ) {
      getNewRestaurants({ latitude: latitude, longitude: longitude })
    }

  })

};

export { restaurantMap }

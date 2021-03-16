import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
import MapboxGeocoder from 'mapbox-gl-geocoder/dist/mapbox-gl-geocoder.min.js'
import 'mapbox-gl/dist/mapbox-gl.css';
import 'mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'

let markers = []
var map;

const clearMarkers = () => {
  markers.forEach((marker) => marker.remove());
  markers = [];
};

const setMarker = () => {

  const marker = new mapboxgl.Marker()
    .setLngLat(map.getCenter())
    .addTo(map);

  markers.push(marker);

};

const getLocation = () => {
  const storage = sessionStorage.getItem('geo')
  if( storage ) {
    return JSON.parse(storage)
  }

  return { "latitude": 41.89306, "longitude": 12.48278 }
}

const renderMap = () => {

  console.log('Map init');
  const {latitude, longitude} = getLocation();

  mapboxgl.accessToken = document.querySelector('#userMap').dataset['apikey']

  map = new mapboxgl.Map({
    container: 'userMap',
    style: 'mapbox://styles/mapbox/streets-v9',
    center: [longitude, latitude],
    zoom: 13,
  });

  var geolocate = new mapboxgl.GeolocateControl({
    positionOptions: {
      enableHighAccuracy: true
    },
    trackUserLocation: true
  });

  map.addControl(geolocate);

  geolocate.on('geolocate', function (ev) {

    const data = {
      latitude: ev.coords.latitude,
      longitude: ev.coords.longitude
    }
    sessionStorage.setItem('geo', JSON.stringify(data))

  });

  setMarker();

  document.getElementById('geocoder') && setGeocoder();
};

const setGeocoder = () => {

  console.log('Geocoder init')

  var geocoder = new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
    mapboxgl: mapboxgl
  });

  document.getElementById('geocoder').appendChild(geocoder.onAdd(map));

  geocoder.on('result', function (ev) {
    const styleSpec = ev.result;
    const data = {
      latitude: styleSpec.center[1],
      longitude: styleSpec.center[0]
    }
    sessionStorage.setItem('geo', JSON.stringify(data))
  });


};


export { renderMap };

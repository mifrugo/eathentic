// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


//
// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import $ from 'jquery';
window.$ = $ = jQuery;
import "bootstrap";
import "controllers";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { setVH } from '../components/init_vh';
import { autoComplete } from '../components/init_autocomplete'
import { getLocation } from '../components/init_geolocal'
import { renderMap } from '../components/init_userMap'
import { setBodyClass } from '../components/init_body'
import { alerts } from '../components/init_alerts'
import { initTimeAgo } from '../components/init_timeago'
import { cardSwipe, bodySwipe } from '../components/init_swipe'

document.addEventListener('turbolinks:load', () => {
  setVH();
  setBodyClass();

  getLocation();
  alerts();
  initTimeAgo();

  cardSwipe();
  bodySwipe();

  document.querySelector('#userMap') && renderMap();

  autoComplete();
});


window.addEventListener('resize', () => {
  setVH();
  setBodyClass();
});


window.addEventListener('load', () => {
  navigator.serviceWorker.register('/service-worker.js').then(registration => {
    console.log('ServiceWorker registered: ', registration);

    var serviceWorker;
    if (registration.installing) {
      serviceWorker = registration.installing;
      console.log('Service worker installing.');
    } else if (registration.waiting) {
      serviceWorker = registration.waiting;
      console.log('Service worker installed & waiting.');
    } else if (registration.active) {
      serviceWorker = registration.active;
      console.log('Service worker active.');
    }
  }).catch(registrationError => {
    console.log('Service worker registration failed: ', registrationError);
  });
});

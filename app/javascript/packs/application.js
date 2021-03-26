
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// External imports
import $ from 'jquery';
window.$ = $ = jQuery;
import "bootstrap";
import "controllers";

import { setVH } from '../components/init_vh';
import { autoComplete } from '../components/init_autocomplete'
import { getLocation } from '../components/init_geolocal'
import { renderMap } from '../components/init_userMap'
import { setBodyClass } from '../components/init_body'
import { alerts } from '../components/init_alerts'
import { initTimeAgo } from '../components/init_timeago'
import { cardSwipe, bodySwipe, homeSwipe } from '../components/init_swipe'
import { restaurantMap } from '../components/init_restaurantMap'
import { initActions } from '../components/init_actions'

document.addEventListener('turbolinks:load', () => {

  setBodyClass();
  initActions();

  getLocation();
  alerts();
  initTimeAgo();

  // cardSwipe();
  // bodySwipe();

  document.querySelector('#restaurantMap') && restaurantMap();

  document.body.classList.contains('pages-home') && homeSwipe();

  document.querySelector('#userMap') && renderMap();

  setTimeout(() => {
    document.querySelector('#sidebar').classList.remove('d-none');
  }, 0);

  autoComplete();
  setVH();

});

document.addEventListener('turbolinks:request-end', () => {
  setVH();
})


window.addEventListener('resize', () => {
  setVH();
  setBodyClass();
});


window.addEventListener('load', () => {
  navigator.serviceWorker.register('/service-worker.js').then(registration => {

      let serviceWorker;
      if (registration.installing) {
        serviceWorker = registration.installing;
      } else if (registration.waiting) {
        serviceWorker = registration.waiting;
      } else if (registration.active) {
        serviceWorker = registration.active;
      }
    })

  setVH();
});

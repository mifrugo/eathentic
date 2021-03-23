import Cookies from 'js-cookie'

const setLocation = (position) => {
  const data = {'latitude': position.coords.latitude, 'longitude': position.coords.longitude}
  Cookies.set('latitude', position.coords.latitude)
  Cookies.set('longitude', position.coords.longitude)

  return data
}

const errorLocation = () => {

  if( !Cookies.get('alert-location') ) {

    Cookies.set('alert-location', 1)

    let alert = document.createElement("div");

    alert.innerHTML = `To find restaurants, set your location`;
    ['alert', 'alert-warning', 'text-center'].forEach(c => alert.classList.add(c))

    document.body.appendChild(alert);

    alert.addEventListener('click', (el) => {
      $(el.currentTarget).slideUp()
      $('#userLocationModal').modal()
    })

  }
}

const browserLocation = () => {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(setLocation, errorLocation)
  }
}


const getLocation = () => {
  const latitude = Cookies.get('latitude')
  const longitude = Cookies.get('longitude')

  console.log(latitude)

  if( typeof latitude !== 'undefined' && typeof longitude !== 'undefined' ) {
    return { 'latitude': latitude, 'longitude': longitude }
  }

  return browserLocation();

}

export { getLocation }

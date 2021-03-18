import Cookies from 'js-cookie'

const setLocation = (position) => {
  const data = {'latitude': position.coords.latitude, 'longitude': position.coords.longitude}
  Cookies.set('latitude', position.coords.latitude)
  Cookies.set('longitude', position.coords.longitude)

  return data
}

const errorLocation = () => {
  $('#userLocationModal').modal('show')
}

const browserLocation = () => {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(setLocation, errorLocation)
  }
}


const getLocation = () => {
  const latitude = Cookies.get('latitude')
  const longitude = Cookies.get('longitude')

  if( typeof latitude !== 'undefined' && typeof longitude !== 'undefined' ) {
    return { 'latitude': latitude, 'longitude': longitude }
  }

  return browserLocation();

}

export { getLocation }

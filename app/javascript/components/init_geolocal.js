const setLocation = (position) => {
  const data = {'latitude': position.coords.latitude, 'longitude': position.coords.longitude}
  sessionStorage.setItem('geo', JSON.stringify(data))
  return data
}

const errorLocation = () => {
  alert('Error in establishing your current position.')
}

const browserLocation = () => {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(setLocation, errorLocation)
  }
}


const getLocation = () => {
  const geoStorage = sessionStorage.getItem('geo')

  if( geoStorage ) {
    return geoStorage
  }

  return browserLocation();

}

export { getLocation }

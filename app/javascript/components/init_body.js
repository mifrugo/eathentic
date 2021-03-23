const getSize = () => {
  const width = Math.max(
    document.documentElement.clientWidth,
    window.innerWidth || 0
  )
  if (width <= 576) return 'xs'
  if (width <= 768) return 'sm'
  if (width <= 992) return 'md'
  if (width <= 1200) return 'lg'
  return 'xl'
}

const iOS = ()  => {
  return [
    'iPad Simulator',
    'iPhone Simulator',
    'iPod Simulator',
    'iPad',
    'iPhone',
    'iPod'
  ].includes(navigator.platform)
    || (navigator.userAgent.includes("Mac") && "ontouchend" in document)
}

const setBodyClass = () => {
  ['device-xs', 'device-sm', 'device-md', 'device-lg', 'device-xl'].forEach(c => document.body.classList.remove(c))
  document.body.classList.add(`device-${getSize()}`)
  iOS() && document.body.classList.add('device-ios')
}

export { setBodyClass }

const vibrate = () => {
  window.navigator.vibrate(50);
}

const cardSwipe = () => {
  document.querySelectorAll('.card-swipe').forEach(el => {

    let mc = new Hammer(el);

    let Press = new Hammer.Press({
      time: 300
    });

    mc.on("swipeleft", function (ev) {
      vibrate();

      el.style.transform = `translateX(-1em)`

      setTimeout(() => {

        if(ev.distance > 100 ) {

          el.click();

        } else {

          el.style.transform = '';

        }

      }, 100);

    });

    mc.add(Press)

    mc.on("press", function(e) {
      e.preventDefault();
      vibrate();
      alert("Add to fav")
    })

  })

}

const bodySwipe = () => {

  if( document.body.classList.contains('restaurants-map')) {
    return
  }

  let mc = new Hammer(document.querySelector('body'))

  mc.on('swiperight', function() {
    vibrate();
    document.getElementById('sidebarCollapse').click()
  })
}

const SwipeElement = (el) => el.scrollIntoView({ behavior: 'smooth', block: 'start' });

const homeSwipe = () => {
  document.querySelectorAll('section').forEach(el => {
    let mc = new Hammer(el);

    mc.get('swipe').set({ direction: Hammer.DIRECTION_ALL });

    mc.on("swipeup", function (ev) {

      if (el.nextElementSibling) {
        SwipeElement(el.nextElementSibling)
      } else {
        SwipeElement(document.querySelectorAll('section')[0])
      }

    })

    mc.on('swipedown', function() {
      el.previousElementSibling && SwipeElement(el.previousElementSibling)
    })

  });
}


export { cardSwipe, bodySwipe, homeSwipe }

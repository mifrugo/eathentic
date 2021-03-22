const vibrate = () => {
  window.navigator.vibrate(50);
}

const cardSwipe = () => {
  document.querySelectorAll('.card').forEach(el => {

    let mc = new Hammer(el);

    let Press = new Hammer.Press({
      time: 500
    });

    mc.on("swipeleft", function (ev) {
      vibrate();

      el.style.transform = `translateX(-2em)`

      setTimeout(() => {

        if(ev.distance > 100 ) {

          el.click();

        } else {

          el.style.transform = '';

        }

      }, 200);

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
  let mc = new Hammer(document.querySelector('body'))

  mc.on('swiperight', function() {
    vibrate();
    document.getElementById('sidebarCollapse').click()
  })
}


export { cardSwipe, bodySwipe }

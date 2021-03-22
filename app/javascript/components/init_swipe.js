const cardSwipe = () => {
  document.querySelectorAll('.card').forEach(el => {

    let mc = new Hammer(el);

    mc.on("swipeleft", function (ev) {
      el.click();
    });

  })

}

const bodySwipe = () => {
  let mc = new Hammer(document.querySelector('body'))

  mc.on('swiperight', function() {
    document.getElementById('sidebarCollapse').click()
  })
}

export { cardSwipe, bodySwipe }

const initActions = () => {
  $('[data-toggle="popover"]').popover()

  /*$(document).on('click', 'a:not([href="#"]), div[onclick]', function () {
    $('body').append(`<div class="loader"><div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div></div>`)
  })*/

  if (window.location.hash == '#reviews') {
    setTimeout(() => {
      document.querySelector('.btn-reviews').click()
    }, 0);
  }
}

export { initActions }

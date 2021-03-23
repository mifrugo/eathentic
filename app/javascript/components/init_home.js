const homeButton = () => {
  document.querySelectorAll('.next-button').forEach((el) => {

    el.addEventListener('click', (event) => {
      const section = event.currentTarget.dataset['action']
      $('html, body').animate({
        scrollTop: $(`section[data-section="${element}"]`).offset().top
      }, 800);
    });

  });
}

export { homeButton }

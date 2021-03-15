const homeButton = () => {
  document.querySelectorAll('.next-button').forEach((el) => {

    el.addEventListener('click', (event) => {
      const section = event.currentTarget.dataset['action']
      document.querySelector(`section[data-section="${section}"]`).scrollIntoView({ behavior: 'smooth', block: 'start' });
    });

  });
}

export { homeButton }

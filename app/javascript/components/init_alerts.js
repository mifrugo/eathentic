const alerts = () => {

  document.querySelectorAll('.alert').forEach((element) => {
    setTimeout(() => {
      $(element).fadeOut().remove();
    }, 3000);
  })

}

export { alerts }

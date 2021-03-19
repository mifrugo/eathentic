const alerts = () => {

  document.querySelectorAll('.alert').forEach((element) => {
    setTimeout(() => {
      $(element).slideUp()
    }, 3000);
  })

}

export { alerts }

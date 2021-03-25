import { Controller } from "stimulus";

export default class extends Controller {

  change() {
    const rating = this.element.getAttribute('data-star')
    document.querySelector('#review_rating').value = rating

    const class_add = ['text-warning', 'fas']
    const class_remove = ['far']

    document.querySelectorAll('.review-stars i').forEach((element) => {
      const value = element.dataset['star']
      class_add.forEach(el => value <= rating ? element.classList.add(el) : element.classList.remove(el))
      class_remove.forEach(el => value <= rating ? element.classList.remove(el) : element.classList.add(el))
    })
  }

  show_reviews() {
    $('#dishes').slideUp();
    $('#reviews').slideDown();
  }

  show_dishes() {
    $('#dishes').slideDown();
    $('#reviews').slideUp();
  }

}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['form', 'toggle']

  connect() {
    this.formTarget.classList.add('d-none')
    document.addEventListener('click', this.closeForm.bind(this))
  }

  toggle(event) {
    event.stopPropagation()
    this.formTarget.classList.toggle('d-none')
  }

  closeForm(event) {
    if (!event.target.closest('[data-controller="comment-form"]')) {
      this.formTarget.classList.add('d-none')
    }
  }
}

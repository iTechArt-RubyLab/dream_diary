import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr'

export default class extends Controller {
  static targets = ["search", "date"]

  connect() {
    flatpickr('.s_date')
  }

  submit(event) {
    if (this.searchTarget.value === "" && this.dateTarget.value === "") {
      event.preventDefault()
    }
  }

  clear() {
    this.searchTarget.value = ""
    this.dateTarget.value = ""
  }
}

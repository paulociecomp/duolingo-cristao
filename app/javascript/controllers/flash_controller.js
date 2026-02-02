import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { timeout: Number }

  connect() {
    if (this.timeoutValue > 0) {
      this.timeout = setTimeout(() => this.dismiss(), this.timeoutValue)
    }
  }

  dismiss() {
    this.element.classList.add("opacity-0", "transform", "-translate-y-2")
    setTimeout(() => this.element.remove(), 300)
  }

  disconnect() {
    if (this.timeout) {
      clearTimeout(this.timeout)
    }
  }
}

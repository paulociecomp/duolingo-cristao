import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["count"]
  static values = { count: Number }

  connect() {
    this.pulse()
  }

  pulse() {
    if (this.countValue <= 1) {
      this.element.classList.add("animate-pulse")
    }
  }

  decrement() {
    this.countValue--
    this.countTarget.textContent = this.countValue
    this.shake()
  }

  shake() {
    this.element.classList.add("animate-shake")
    setTimeout(() => {
      this.element.classList.remove("animate-shake")
    }, 500)
  }
}

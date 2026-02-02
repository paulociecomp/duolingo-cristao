import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bar"]
  static values = { progress: Number, animated: Boolean }

  connect() {
    if (this.animatedValue) {
      this.animateProgress()
    } else {
      this.barTarget.style.width = `${this.progressValue}%`
    }
  }

  animateProgress() {
    this.barTarget.style.width = '0%'

    requestAnimationFrame(() => {
      this.barTarget.style.transition = 'width 1s ease-out'
      this.barTarget.style.width = `${this.progressValue}%`
    })
  }

  update(newProgress) {
    this.progressValue = newProgress
    this.barTarget.style.width = `${newProgress}%`
  }
}

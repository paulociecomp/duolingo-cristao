import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["value"]
  static values = { start: Number, end: Number, duration: Number }

  connect() {
    this.animateCount()
  }

  animateCount() {
    const start = this.startValue || 0
    const end = this.endValue
    const duration = this.durationValue || 1000
    const startTime = performance.now()

    const animate = (currentTime) => {
      const elapsed = currentTime - startTime
      const progress = Math.min(elapsed / duration, 1)

      const easeOut = 1 - Math.pow(1 - progress, 3)
      const current = Math.round(start + (end - start) * easeOut)

      this.valueTarget.textContent = current.toLocaleString()

      if (progress < 1) {
        requestAnimationFrame(animate)
      }
    }

    requestAnimationFrame(animate)
  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["leftItem", "rightItem", "answer", "matchCount"]
  static values = { lessonId: Number, exerciseId: Number }

  connect() {
    this.selectedLeft = null
    this.matches = {}
    this.matchedLeft = new Set()
    this.matchedRight = new Set()
  }

  selectLeft(event) {
    const button = event.currentTarget
    const index = button.dataset.index

    if (this.matchedLeft.has(index)) return

    // Deselect previous left
    this.leftItemTargets.forEach(item => {
      if (!this.matchedLeft.has(item.dataset.index)) {
        item.style.borderColor = "#37464F"
        item.style.backgroundColor = "#1A2C32"
      }
    })

    // Select current
    button.style.borderColor = "#1CB0F6"
    button.style.backgroundColor = "#1A3A4A"
    this.selectedLeft = { index, value: button.dataset.value }
  }

  selectRight(event) {
    if (!this.selectedLeft) return

    const button = event.currentTarget
    const index = button.dataset.index

    if (this.matchedRight.has(index)) return

    // Create match
    const leftBtn = this.leftItemTargets.find(b => b.dataset.index === this.selectedLeft.index)

    this.matches[this.selectedLeft.value] = button.dataset.value
    this.matchedLeft.add(this.selectedLeft.index)
    this.matchedRight.add(index)

    // Style matched items
    leftBtn.style.borderColor = "#58CC02"
    leftBtn.style.backgroundColor = "#1A3A2A"
    leftBtn.style.opacity = "0.75"

    button.style.borderColor = "#58CC02"
    button.style.backgroundColor = "#1A3A2A"
    button.style.opacity = "0.75"

    this.selectedLeft = null
    this.updateMatchCount()
    this.updateAnswer()
  }

  updateMatchCount() {
    this.matchCountTarget.textContent = Object.keys(this.matches).length
  }

  updateAnswer() {
    this.answerTarget.value = JSON.stringify(this.matches)

    const exerciseController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="exercise"]'),
      'exercise'
    )

    if (exerciseController && Object.keys(this.matches).length === this.leftItemTargets.length) {
      exerciseController.enableSubmit()
    }
  }
}

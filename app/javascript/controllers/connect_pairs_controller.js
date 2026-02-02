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
        item.classList.remove("border-[#1CB0F6]", "bg-[#1A3A4A]")
        item.classList.add("border-[#37464F]", "bg-[#1A2C32]")
      }
    })

    // Select current
    button.classList.remove("border-[#37464F]", "bg-[#1A2C32]")
    button.classList.add("border-[#1CB0F6]", "bg-[#1A3A4A]")
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
    leftBtn.classList.remove("border-[#1CB0F6]")
    leftBtn.classList.add("border-[#58CC02]", "bg-[#1A3A2A]", "opacity-75")
    button.classList.add("border-[#58CC02]", "bg-[#1A3A2A]", "opacity-75")

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

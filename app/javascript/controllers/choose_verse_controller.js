import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["option", "answer"]
  static values = { lessonId: Number, exerciseId: Number }

  select(event) {
    const button = event.currentTarget
    const value = button.dataset.value

    // Deselect all
    this.optionTargets.forEach(opt => {
      opt.style.borderColor = "#37464F"
      opt.style.backgroundColor = "#1A2C32"
    })

    // Select clicked
    button.style.borderColor = "#1CB0F6"
    button.style.backgroundColor = "#1A3A4A"

    this.answerTarget.value = value

    const exerciseController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="exercise"]'),
      'exercise'
    )
    if (exerciseController) {
      exerciseController.enableSubmit()
    }
  }
}

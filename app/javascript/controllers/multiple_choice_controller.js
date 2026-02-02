import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["option", "answer", "options"]
  static values = { lessonId: Number, exerciseId: Number }

  connect() {
    this.selectedValue = null
  }

  select(event) {
    const button = event.currentTarget
    const value = button.dataset.value

    // Deselect all options
    this.optionTargets.forEach(opt => {
      opt.style.borderColor = "#37464F"
      opt.style.backgroundColor = "#1A2C32"
    })

    // Select clicked option
    button.style.borderColor = "#1CB0F6"
    button.style.backgroundColor = "#1A3A4A"

    // Update hidden input
    this.answerTarget.value = value
    this.selectedValue = value

    // Enable submit button
    const exerciseController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="exercise"]'),
      'exercise'
    )
    if (exerciseController) {
      exerciseController.enableSubmit()
    }
  }
}

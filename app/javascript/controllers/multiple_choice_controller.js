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
      opt.classList.remove("border-[#1CB0F6]", "bg-[#1A3A4A]")
      opt.classList.add("border-[#37464F]", "bg-[#1A2C32]")
    })

    // Select clicked option
    button.classList.remove("border-[#37464F]", "bg-[#1A2C32]")
    button.classList.add("border-[#1CB0F6]", "bg-[#1A3A4A]")

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

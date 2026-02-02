import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["word", "answer", "blank", "blankText", "wordBank"]
  static values = { lessonId: Number, exerciseId: Number }

  connect() {
    this.selectedWord = null
  }

  selectWord(event) {
    const button = event.currentTarget
    const word = button.dataset.word

    // If clicking the same word, deselect it
    if (this.selectedWord === word) {
      this.deselectWord(button, word)
      return
    }

    // Deselect previous word if any
    if (this.selectedWord) {
      this.wordTargets.forEach(w => {
        if (w.dataset.word === this.selectedWord) {
          w.classList.remove("border-[#1CB0F6]", "bg-[#1A3A4A]", "opacity-50")
          w.classList.add("border-[#37464F]", "bg-[#1A2C32]")
        }
      })
    }

    // Select new word
    button.classList.remove("border-[#37464F]", "bg-[#1A2C32]")
    button.classList.add("border-[#1CB0F6]", "bg-[#1A3A4A]", "opacity-50")

    this.selectedWord = word
    this.answerTarget.value = word
    this.blankTextTarget.textContent = word

    // Enable submit
    const exerciseController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="exercise"]'),
      'exercise'
    )
    if (exerciseController) {
      exerciseController.enableSubmit()
    }
  }

  deselectWord(button, word) {
    button.classList.remove("border-[#1CB0F6]", "bg-[#1A3A4A]", "opacity-50")
    button.classList.add("border-[#37464F]", "bg-[#1A2C32]")
    this.selectedWord = null
    this.answerTarget.value = ""
    this.blankTextTarget.innerHTML = "&nbsp;"

    const exerciseController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="exercise"]'),
      'exercise'
    )
    if (exerciseController) {
      exerciseController.disableSubmit()
    }
  }
}

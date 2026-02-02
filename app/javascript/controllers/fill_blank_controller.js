import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["word", "answer", "blank", "blankText", "wordBank"]
  static values = { lessonId: Number, exerciseId: Number }

  connect() {
    this.selectedWord = null
    console.log("Fill blank controller connected", this.element)
  }

  selectWord(event) {
    console.log("selectWord called", event.currentTarget)
    const button = event.currentTarget
    const word = button.dataset.word
    console.log("Word selected:", word)

    // If clicking the same word, deselect it
    if (this.selectedWord === word) {
      this.deselectWord(button, word)
      return
    }

    // Deselect previous word if any
    if (this.selectedWord) {
      this.wordTargets.forEach(w => {
        if (w.dataset.word === this.selectedWord) {
          w.style.borderColor = "#37464F"
          w.style.backgroundColor = "#1A2C32"
          w.style.opacity = "1"
        }
      })
    }

    // Select new word
    button.style.borderColor = "#1CB0F6"
    button.style.backgroundColor = "#1A3A4A"
    button.style.opacity = "0.7"

    this.selectedWord = word

    if (this.hasAnswerTarget) {
      this.answerTarget.value = word
      console.log("Answer set to:", word)
    }

    if (this.hasBlankTextTarget) {
      this.blankTextTarget.textContent = word
      console.log("Blank text set to:", word)
    }

    // Enable submit
    const exerciseController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="exercise"]'),
      'exercise'
    )
    console.log("Exercise controller found:", exerciseController)
    if (exerciseController) {
      exerciseController.enableSubmit()
    }
  }

  deselectWord(button, word) {
    button.style.borderColor = "#37464F"
    button.style.backgroundColor = "#1A2C32"
    button.style.opacity = "1"

    this.selectedWord = null

    if (this.hasAnswerTarget) {
      this.answerTarget.value = ""
    }

    if (this.hasBlankTextTarget) {
      this.blankTextTarget.innerHTML = "&nbsp;"
    }

    const exerciseController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="exercise"]'),
      'exercise'
    )
    if (exerciseController) {
      exerciseController.disableSubmit()
    }
  }
}

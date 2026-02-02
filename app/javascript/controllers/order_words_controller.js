import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["word", "answer", "selectedWords", "wordBank", "placeholder", "answerArea"]
  static values = { lessonId: Number, exerciseId: Number }

  connect() {
    this.selectedWords = []
  }

  selectWord(event) {
    const button = event.currentTarget
    const word = button.dataset.word

    // Check if word is already selected
    const wordIndex = this.selectedWords.indexOf(word)
    if (wordIndex > -1) {
      // Remove from selected
      this.selectedWords.splice(wordIndex, 1)
      button.classList.remove("opacity-50", "cursor-not-allowed")
      button.disabled = false
    } else {
      // Add to selected
      this.selectedWords.push(word)
      button.classList.add("opacity-50", "cursor-not-allowed")
      button.disabled = true
    }

    this.updateDisplay()
    this.updateAnswer()
  }

  removeWord(event) {
    const index = parseInt(event.currentTarget.dataset.index)
    const word = this.selectedWords[index]

    this.selectedWords.splice(index, 1)

    // Re-enable the word button
    this.wordTargets.forEach(btn => {
      if (btn.dataset.word === word && btn.disabled) {
        btn.classList.remove("opacity-50", "cursor-not-allowed")
        btn.disabled = false
      }
    })

    this.updateDisplay()
    this.updateAnswer()
  }

  updateDisplay() {
    // Update selected words display
    if (this.selectedWords.length > 0) {
      this.placeholderTarget.classList.add("hidden")
      this.selectedWordsTarget.innerHTML = this.selectedWords.map((word, index) => `
        <button type="button"
                class="px-4 py-2 bg-[#1A3A4A] border-2 border-[#1CB0F6] rounded-lg font-medium text-white hover:bg-[#1A4A5A] transition"
                data-action="click->order-words#removeWord"
                data-index="${index}">
          ${word}
          <span class="ml-1 text-[#1CB0F6]">×</span>
        </button>
      `).join("")
    } else {
      this.placeholderTarget.classList.remove("hidden")
      this.selectedWordsTarget.innerHTML = ""
    }
  }

  updateAnswer() {
    this.answerTarget.value = JSON.stringify(this.selectedWords)

    const exerciseController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="exercise"]'),
      'exercise'
    )

    if (exerciseController) {
      if (this.selectedWords.length > 0) {
        exerciseController.enableSubmit()
      } else {
        exerciseController.disableSubmit()
      }
    }
  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["timer", "question", "option", "answer", "answeredCount"]
  static values = { lessonId: Number, exerciseId: Number, timeLimit: Number }

  connect() {
    this.answers = {}
    this.timeRemaining = this.timeLimitValue
    this.startTimer()
  }

  startTimer() {
    this.timerInterval = setInterval(() => {
      this.timeRemaining--
      this.timerTarget.textContent = this.timeRemaining

      if (this.timeRemaining <= 10) {
        this.timerTarget.style.color = "#FF4B4B"
      }

      if (this.timeRemaining <= 0) {
        clearInterval(this.timerInterval)
        this.submitQuiz()
      }
    }, 1000)
  }

  selectAnswer(event) {
    const button = event.currentTarget
    const questionIndex = button.dataset.question
    const value = button.dataset.value

    // Deselect other options for this question
    this.optionTargets.forEach(opt => {
      if (opt.dataset.question === questionIndex) {
        opt.style.borderColor = "#37464F"
        opt.style.backgroundColor = "#131F24"
      }
    })

    // Select this option
    button.style.borderColor = "#1CB0F6"
    button.style.backgroundColor = "#1A3A4A"

    this.answers[questionIndex] = value
    this.updateAnsweredCount()
    this.updateAnswer()
  }

  updateAnsweredCount() {
    this.answeredCountTarget.textContent = Object.keys(this.answers).length
  }

  updateAnswer() {
    const orderedAnswers = this.questionTargets.map((_, i) => this.answers[i] || null)
    this.answerTarget.value = JSON.stringify(orderedAnswers)

    const exerciseController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="exercise"]'),
      'exercise'
    )

    if (exerciseController && Object.keys(this.answers).length === this.questionTargets.length) {
      exerciseController.enableSubmit()
    }
  }

  submitQuiz() {
    const exerciseController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="exercise"]'),
      'exercise'
    )
    if (exerciseController) {
      exerciseController.submit()
    }
  }

  disconnect() {
    if (this.timerInterval) {
      clearInterval(this.timerInterval)
    }
  }
}

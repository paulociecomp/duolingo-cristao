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
        this.timerTarget.classList.add("text-red-600", "animate-pulse")
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
        opt.classList.remove("border-[#1CB0F6]", "bg-[#1A3A4A]")
        opt.classList.add("border-[#37464F]", "bg-[#1A2C32]")
      }
    })

    // Select this option
    button.classList.remove("border-[#37464F]", "bg-[#1A2C32]")
    button.classList.add("border-[#1CB0F6]", "bg-[#1A3A4A]")

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

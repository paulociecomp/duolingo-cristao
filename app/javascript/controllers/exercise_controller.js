import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submitButton", "skipButton", "answer"]
  static values = { type: String }

  connect() {
    this.submitted = false
    console.log("Exercise controller connected")
  }

  enableSubmit() {
    if (this.hasSubmitButtonTarget) {
      this.submitButtonTarget.disabled = false
    }
  }

  disableSubmit() {
    if (this.hasSubmitButtonTarget) {
      this.submitButtonTarget.disabled = true
    }
  }

  skip() {
    if (this.submitted) return

    this.submitted = true

    const form = document.createElement('form')
    form.method = 'POST'
    form.action = window.location.href + '/skip'

    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    const csrfInput = document.createElement('input')
    csrfInput.type = 'hidden'
    csrfInput.name = 'authenticity_token'
    csrfInput.value = csrfToken
    form.appendChild(csrfInput)

    document.body.appendChild(form)
    form.requestSubmit()
  }

  submit() {
    if (this.submitted) return
    if (!this.hasAnswerTarget || !this.answerTarget.value) return

    this.submitted = true
    this.submitButtonTarget.disabled = true
    this.submitButtonTarget.innerHTML = '<span class="animate-spin">⏳</span> Verificando...'

    const form = document.createElement('form')
    form.method = 'POST'
    form.action = window.location.href + '/answer'

    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    const csrfInput = document.createElement('input')
    csrfInput.type = 'hidden'
    csrfInput.name = 'authenticity_token'
    csrfInput.value = csrfToken
    form.appendChild(csrfInput)

    const answerInput = document.createElement('input')
    answerInput.type = 'hidden'
    answerInput.name = 'answer'
    answerInput.value = this.answerTarget.value
    form.appendChild(answerInput)

    document.body.appendChild(form)
    form.requestSubmit()
  }

  continue() {
    // Navigate to next exercise
    const feedbackEl = document.getElementById('exercise-feedback')
    const nextUrl = feedbackEl?.dataset?.nextUrl
    if (nextUrl) {
      window.location.href = nextUrl
    }
  }
}

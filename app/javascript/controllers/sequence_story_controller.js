import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["event", "sequence", "eventsBank", "placeholder", "answer", "dropZone"]
  static values = { lessonId: Number, exerciseId: Number }

  connect() {
    this.orderedEvents = []
  }

  selectEvent(event) {
    const button = event.currentTarget
    const eventText = button.dataset.event

    // Check if already in sequence
    const eventIndex = this.orderedEvents.indexOf(eventText)
    if (eventIndex > -1) {
      // Remove from sequence
      this.orderedEvents.splice(eventIndex, 1)
      button.classList.remove("opacity-50", "cursor-not-allowed")
      button.disabled = false
    } else {
      // Add to sequence
      this.orderedEvents.push(eventText)
      button.classList.add("opacity-50", "cursor-not-allowed")
      button.disabled = true
    }

    this.updateDisplay()
    this.updateAnswer()
  }

  removeFromSequence(event) {
    const index = parseInt(event.currentTarget.dataset.index)
    const eventText = this.orderedEvents[index]

    this.orderedEvents.splice(index, 1)

    // Re-enable the event button
    this.eventTargets.forEach(btn => {
      if (btn.dataset.event === eventText && btn.disabled) {
        btn.classList.remove("opacity-50", "cursor-not-allowed")
        btn.disabled = false
      }
    })

    this.updateDisplay()
    this.updateAnswer()
  }

  updateDisplay() {
    if (this.orderedEvents.length > 0) {
      this.placeholderTarget.classList.add("hidden")
      this.sequenceTarget.innerHTML = this.orderedEvents.map((event, index) => `
        <div class="flex items-center gap-3 p-3 bg-[#1A3A4A] border-2 border-[#1CB0F6] rounded-lg">
          <span class="w-6 h-6 rounded-full bg-[#1CB0F6] text-white text-sm flex items-center justify-center font-bold">${index + 1}</span>
          <span class="flex-1 text-white">${event}</span>
          <button type="button"
                  class="text-gray-400 hover:text-red-500 transition"
                  data-action="click->sequence-story#removeFromSequence"
                  data-index="${index}">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
            </svg>
          </button>
        </div>
      `).join("")
    } else {
      this.placeholderTarget.classList.remove("hidden")
      this.sequenceTarget.innerHTML = ""
    }
  }

  updateAnswer() {
    this.answerTarget.value = JSON.stringify(this.orderedEvents)

    const exerciseController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="exercise"]'),
      'exercise'
    )

    if (exerciseController) {
      if (this.orderedEvents.length === this.eventTargets.length) {
        exerciseController.enableSubmit()
      } else {
        exerciseController.disableSubmit()
      }
    }
  }
}

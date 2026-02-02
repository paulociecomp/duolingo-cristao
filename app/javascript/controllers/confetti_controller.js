import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { autoStart: Boolean }

  connect() {
    if (this.autoStartValue) {
      this.burst()
    }
  }

  burst() {
    const colors = ['#4F46E5', '#10B981', '#F59E0B', '#EF4444', '#8B5CF6']
    const confettiCount = 100

    for (let i = 0; i < confettiCount; i++) {
      this.createConfetti(colors[Math.floor(Math.random() * colors.length)])
    }
  }

  createConfetti(color) {
    const confetti = document.createElement('div')
    confetti.className = 'fixed pointer-events-none z-50'
    confetti.style.cssText = `
      width: ${Math.random() * 10 + 5}px;
      height: ${Math.random() * 10 + 5}px;
      background-color: ${color};
      left: ${Math.random() * 100}vw;
      top: -20px;
      border-radius: ${Math.random() > 0.5 ? '50%' : '0'};
      transform: rotate(${Math.random() * 360}deg);
    `

    document.body.appendChild(confetti)

    const animation = confetti.animate([
      { transform: `translateY(0) rotate(0deg)`, opacity: 1 },
      { transform: `translateY(100vh) rotate(${Math.random() * 720}deg)`, opacity: 0 }
    ], {
      duration: Math.random() * 2000 + 2000,
      easing: 'cubic-bezier(0.25, 0.46, 0.45, 0.94)'
    })

    animation.onfinish = () => confetti.remove()
  }
}

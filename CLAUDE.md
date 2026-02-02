# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Development Commands

```bash
# Install dependencies
bundle install
npm install

# Database
rails db:create db:migrate db:seed

# Build assets (REQUIRED after JS/CSS changes)
npm run build        # JavaScript (esbuild)
npm run build:css    # CSS (Tailwind)

# Run server
rails server

# Tests
bundle exec rspec                          # All tests
bundle exec rspec spec/models/user_spec.rb # Single file
bundle exec rspec spec/services/           # Directory

# Linting
bundle exec rubocop
bundle exec brakeman
```

## Architecture Overview

Rails 8 MVC app with Hotwire (Turbo + Stimulus) for frontend interactivity. Gamified Bible learning platform inspired by Duolingo.

### Key Layers

**Services** (`app/services/`) - Business logic encapsulation:
- `XpService` - XP addition, level ups
- `LifeService` - Lives management (5 max, 30min regen)
- `StreakService` - Daily streak tracking
- `ExerciseChecker` - Answer validation
- `BadgeService`, `LeagueService`, `MissionService` - Gamification
- `SpacedRepetitionService` - SM-2 algorithm for review

**Stimulus Controllers** (`app/javascript/controllers/`) - Exercise interactivity:
- `exercise_controller.js` - Coordinates submit/skip
- Each exercise type has its own controller: `fill_blank_controller.js`, `multiple_choice_controller.js`, etc.

**Important**: After modifying JS controllers, run `npm run build` to recompile.

### Content Hierarchy

```
Track → Unit → Lesson → Exercise
```

Exercise types: `multiple_choice`, `fill_blank`, `true_false`, `order_words`, `connect_pairs`, `quick_quiz`, `choose_verse`, `sequence_story`

### Layouts

- `application.html.erb` - Main layout with navbar/sidebar
- `exercise.html.erb` - Clean layout for exercises (no navigation)

## UI/Theme (Dark Duolingo Style)

Key colors:
- Background: `#131F24`, Cards: `#1A2C32`, Borders: `#37464F`
- Green (success): `#58CC02`, Blue (active): `#1CB0F6`
- Yellow (XP): `#FFC800`, Orange (streak): `#FF9600`, Red (lives): `#FF4B4B`

**Important**: Dynamic Tailwind classes in JS don't work. Use inline styles for dynamic state changes in Stimulus controllers.

## Authentication

OmniAuth with Google OAuth2. User created/found via `User.from_omniauth(auth)`. Session stored in `session[:user_id]`.

## Testing

RSpec with FactoryBot. Models in `spec/models/`, services in `spec/services/`.

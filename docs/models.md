# Modelos de Dados

## Diagrama de Relacionamentos

```
User
├── has_many :user_track_progresses
├── has_many :user_lesson_attempts
├── has_many :user_exercise_attempts
├── has_many :user_streaks
├── has_many :user_badges
├── has_many :badges (through: user_badges)
├── has_many :league_participants
├── has_many :user_daily_missions
└── has_many :spaced_repetition_cards

Track
├── has_many :units
└── has_many :user_track_progresses

Unit
├── belongs_to :track
└── has_many :lessons

Lesson
├── belongs_to :unit
├── has_many :exercises
└── has_many :user_lesson_attempts

Exercise
├── belongs_to :lesson
├── has_many :user_exercise_attempts
└── has_many :spaced_repetition_cards
```

## Modelos Principais

### User

Usuário da plataforma.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `provider` | string | Provedor OAuth (google) |
| `uid` | string | ID único do provedor |
| `email` | string | Email do usuário |
| `name` | string | Nome do usuário |
| `avatar_url` | string | URL da foto de perfil |
| `total_xp` | integer | XP total acumulado |
| `current_level` | integer | Nível atual |
| `lives` | integer | Vidas (máx 5) |
| `current_streak` | integer | Sequência atual em dias |
| `longest_streak` | integer | Maior sequência já atingida |
| `gems` | integer | Moeda virtual |
| `streak_freeze_count` | integer | Proteções de streak |
| `premium` | boolean | Usuário premium |

### Track (Trilha)

Trilha de estudo (ex: "Novo Testamento", "Salmos").

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `name` | string | Nome da trilha |
| `slug` | string | URL amigável |
| `description` | text | Descrição |
| `icon` | string | Emoji/ícone |
| `color` | string | Cor hex (#RRGGBB) |
| `position` | integer | Ordem de exibição |

### Unit (Unidade)

Unidade dentro de uma trilha.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `track_id` | integer | Trilha pai |
| `name` | string | Nome da unidade |
| `description` | text | Descrição |
| `icon` | string | Emoji/ícone |
| `position` | integer | Ordem na trilha |

### Lesson (Lição)

Lição dentro de uma unidade.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `unit_id` | integer | Unidade pai |
| `name` | string | Nome da lição |
| `description` | text | Descrição |
| `xp_reward` | integer | XP ao completar |
| `position` | integer | Ordem na unidade |

### Exercise (Exercício)

Exercício dentro de uma lição.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `lesson_id` | integer | Lição pai |
| `exercise_type` | string | Tipo do exercício |
| `content` | jsonb | Conteúdo (pergunta, opções, etc) |
| `position` | integer | Ordem na lição |

**Tipos de exercício:**
- `multiple_choice` - Múltipla escolha
- `fill_blank` - Completar lacuna
- `true_false` - Verdadeiro ou falso
- `order_words` - Ordenar palavras
- `connect_pairs` - Conectar pares
- `quick_quiz` - Quiz rápido
- `choose_verse` - Escolher versículo
- `sequence_story` - Ordenar eventos

## Modelos de Progresso

### UserTrackProgress

Progresso do usuário em uma trilha.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `user_id` | integer | Usuário |
| `track_id` | integer | Trilha |
| `current_lesson_id` | integer | Lição atual |
| `completed_lessons_count` | integer | Lições completas |
| `completion_percentage` | decimal | % de conclusão |

### UserLessonAttempt

Tentativa de completar uma lição.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `user_id` | integer | Usuário |
| `lesson_id` | integer | Lição |
| `score` | integer | Pontuação (0-100) |
| `xp_earned` | integer | XP ganho |
| `completed_at` | datetime | Data de conclusão |
| `perfect` | boolean | 100% de acertos |

### UserExerciseAttempt

Tentativa de responder um exercício.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `user_lesson_attempt_id` | integer | Tentativa da lição |
| `exercise_id` | integer | Exercício |
| `user_answer` | jsonb | Resposta do usuário |
| `correct` | boolean | Acertou? |
| `time_spent_seconds` | integer | Tempo gasto |

## Modelos de Gamificação

### Badge (Conquista)

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `name` | string | Nome |
| `description` | text | Descrição |
| `icon` | string | Emoji/ícone |
| `category` | string | Categoria |
| `requirement_type` | string | Tipo de requisito |
| `requirement_value` | integer | Valor necessário |

### League (Liga)

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `name` | string | Nome (Bronze, Prata, etc) |
| `icon` | string | Emoji |
| `min_rank` | integer | Rank mínimo |
| `max_rank` | integer | Rank máximo |

### DailyMission (Missão Diária)

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `name` | string | Nome |
| `description` | text | Descrição |
| `icon` | string | Emoji |
| `mission_type` | string | Tipo (lessons, xp, etc) |
| `target_value` | integer | Meta |
| `xp_reward` | integer | XP de recompensa |
| `gem_reward` | integer | Gems de recompensa |

### SpacedRepetitionCard

Card para revisão espaçada (algoritmo SM-2).

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `user_id` | integer | Usuário |
| `exercise_id` | integer | Exercício |
| `easiness_factor` | decimal | Fator de facilidade |
| `interval_days` | integer | Intervalo até próxima revisão |
| `repetitions` | integer | Número de repetições |
| `next_review_at` | datetime | Próxima revisão |

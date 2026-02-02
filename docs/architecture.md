# Arquitetura do Sistema

## Visão Geral

O Duolingo Crente é uma aplicação Rails 8 com arquitetura MVC tradicional, utilizando Hotwire (Turbo + Stimulus) para interatividade no frontend.

## Stack Tecnológico

| Camada | Tecnologia |
|--------|------------|
| Backend | Ruby on Rails 8 |
| Banco de Dados | PostgreSQL |
| Frontend | Hotwire (Turbo + Stimulus) |
| CSS | Tailwind CSS 4 |
| JavaScript | ES6+ com esbuild |
| Autenticação | OmniAuth (Google OAuth2) |

## Estrutura de Diretórios

```
app/
├── controllers/        # Controllers MVC
├── models/            # Models ActiveRecord
├── views/             # Views ERB
│   ├── layouts/       # Layouts (application, exercise)
│   ├── exercises/     # Views de exercícios
│   │   └── types/     # Partials por tipo de exercício
│   └── ...
├── services/          # Service Objects (lógica de negócio)
├── helpers/           # View Helpers
└── javascript/
    └── controllers/   # Stimulus Controllers
```

## Fluxo de Dados

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Browser   │────▶│  Controller │────▶│   Service   │
└─────────────┘     └─────────────┘     └─────────────┘
                           │                   │
                           ▼                   ▼
                    ┌─────────────┐     ┌─────────────┐
                    │    View     │     │    Model    │
                    └─────────────┘     └─────────────┘
```

## Camadas

### Controllers

Responsáveis por:
- Receber requisições HTTP
- Autenticação/Autorização
- Coordenar Services
- Renderizar Views

### Services

Encapsulam lógica de negócio complexa:

| Service | Responsabilidade |
|---------|------------------|
| `XpService` | Adicionar XP, level up |
| `LevelService` | Cálculo de níveis e progresso |
| `LifeService` | Gerenciar vidas e regeneração |
| `StreakService` | Controle de sequência diária |
| `BadgeService` | Verificar e conceder conquistas |
| `LeagueService` | Ranking semanal |
| `MissionService` | Missões diárias |
| `SpacedRepetitionService` | Revisão espaçada (SM-2) |
| `ExerciseChecker` | Validar respostas dos exercícios |

### Models

Ver [Modelos de Dados](./models.md)

### Stimulus Controllers

Controllers JavaScript para interatividade:

| Controller | Uso |
|------------|-----|
| `exercise` | Coordena submissão de exercícios |
| `fill-blank` | Exercício de completar |
| `multiple-choice` | Exercício de múltipla escolha |
| `true-false` | Exercício verdadeiro/falso |
| `order-words` | Exercício de ordenar palavras |
| `connect-pairs` | Exercício de conectar pares |
| `quick-quiz` | Quiz com timer |
| `choose-verse` | Escolher versículo correto |
| `sequence-story` | Ordenar eventos |

## Autenticação

Utiliza OmniAuth com Google OAuth2:

1. Usuário clica em "Entrar com Google"
2. Redirecionado para Google
3. Google retorna callback com dados
4. `User.from_omniauth` cria/atualiza usuário
5. Sessão criada com `session[:user_id]`

## Layouts

- `application.html.erb` - Layout principal com navbar e sidebar
- `exercise.html.erb` - Layout limpo para exercícios (sem navegação)

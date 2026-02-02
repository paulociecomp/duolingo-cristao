# Duolingo Crente

Aplicativo de aprendizado bíblico gamificado, inspirado no Duolingo. Aprenda a Bíblia de forma divertida e interativa!

## Screenshots

| Trilhas | Exercício | Ranking |
|---------|-----------|---------|
| ![Trilhas](docs/screenshots/tracks.png) | ![Exercício](docs/screenshots/exercise.png) | ![Ranking](docs/screenshots/leaderboard.png) |

## Funcionalidades

- **Trilhas de Estudo** - Conteúdo organizado em trilhas, unidades e lições
- **8 Tipos de Exercícios** - Múltipla escolha, completar, ordenar, conectar pares, quiz e mais
- **Sistema de Vidas** - 5 vidas com regeneração a cada 30 minutos
- **XP e Níveis** - Ganhe experiência e suba de nível
- **Streak** - Mantenha sua sequência diária de estudos
- **Conquistas** - Desbloqueie badges por marcos alcançados
- **Ranking Semanal** - Compita em ligas (Bronze → Prata → Ouro → Diamante)
- **Missões Diárias** - Complete desafios para ganhar recompensas
- **Revisão Espaçada** - Algoritmo SM-2 para fixar o conhecimento
- **Loja** - Use gems para comprar itens especiais

## Stack Tecnológico

| Tecnologia | Uso |
|------------|-----|
| Ruby on Rails 8 | Backend |
| PostgreSQL | Banco de Dados |
| Hotwire (Turbo + Stimulus) | Frontend interativo |
| Tailwind CSS 4 | Estilização |
| esbuild | Bundler JavaScript |
| OmniAuth | Autenticação (Google) |

## Quick Start

```bash
# Clonar repositório
git clone <repo-url>
cd duolingo-crente

# Instalar dependências
bundle install
npm install

# Configurar ambiente
cp .env.example .env
# Editar .env com suas credenciais Google OAuth

# Criar banco de dados
rails db:create db:migrate db:seed

# Compilar assets
npm run build
npm run build:css

# Iniciar servidor
rails server
```

Acesse http://localhost:3000

## Documentação

| Documento | Descrição |
|-----------|-----------|
| [Setup](docs/setup.md) | Instruções de instalação e configuração |
| [Arquitetura](docs/architecture.md) | Visão geral da arquitetura do sistema |
| [Modelos](docs/models.md) | Documentação dos modelos de dados |
| [Funcionalidades](docs/features.md) | Detalhes das funcionalidades |
| [UI/Tema](docs/ui-theme.md) | Design system e componentes visuais |

## Estrutura do Projeto

```
app/
├── controllers/     # Controllers MVC
├── models/          # Models ActiveRecord
├── views/           # Views ERB
├── services/        # Service Objects
├── helpers/         # View Helpers
└── javascript/
    └── controllers/ # Stimulus Controllers

docs/                # Documentação
config/              # Configurações Rails
db/                  # Migrations e seeds
```

## Comandos Úteis

```bash
# Servidor de desenvolvimento
rails server

# Console interativo
rails console

# Executar testes
bundle exec rspec

# Compilar JavaScript
npm run build

# Compilar CSS
npm run build:css

# Verificar segurança
bundle exec brakeman

# Linting
bundle exec rubocop
```

## Testes

```bash
# Todos os testes
bundle exec rspec

# Com cobertura
COVERAGE=true bundle exec rspec

# Testes específicos
bundle exec rspec spec/models/user_spec.rb
bundle exec rspec spec/services/
```

## Contribuindo

1. Fork o projeto
2. Crie sua feature branch (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

Feito com ❤️ para a comunidade cristã

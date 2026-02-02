# Setup do Projeto

## Requisitos

- Ruby 3.2+
- Rails 8.0+
- PostgreSQL 14+
- Node.js 18+
- npm ou yarn

## Instalação

### 1. Clonar o repositório

```bash
git clone <repo-url>
cd duolingo-crente
```

### 2. Instalar dependências Ruby

```bash
bundle install
```

### 3. Instalar dependências JavaScript

```bash
npm install
```

### 4. Configurar variáveis de ambiente

Criar arquivo `.env` na raiz:

```env
# Google OAuth
GOOGLE_CLIENT_ID=seu_client_id
GOOGLE_CLIENT_SECRET=seu_client_secret

# Database (opcional se usar defaults)
DATABASE_URL=postgres://user:pass@localhost/duolingo_crente_development
```

### 5. Configurar Google OAuth

1. Acesse [Google Cloud Console](https://console.cloud.google.com/)
2. Crie um novo projeto
3. Ative a API Google+ ou People API
4. Configure a tela de consentimento OAuth
5. Crie credenciais OAuth 2.0
6. Adicione URIs de redirecionamento:
   - `http://localhost:3000/auth/google_oauth2/callback`

### 6. Criar banco de dados

```bash
rails db:create
rails db:migrate
rails db:seed  # Opcional: dados de exemplo
```

### 7. Compilar assets

```bash
npm run build      # JavaScript
npm run build:css  # CSS
```

## Executando

### Modo desenvolvimento

Terminal 1 - Servidor Rails:
```bash
rails server
```

Terminal 2 - Watcher JavaScript (opcional):
```bash
npm run build -- --watch
```

Terminal 3 - Watcher CSS (opcional):
```bash
npm run build:css -- --watch
```

Ou use `foreman` / `overmind` com Procfile.dev.

### Acessar

Abra http://localhost:3000

## Testes

```bash
# Executar todos os testes
bundle exec rspec

# Testes específicos
bundle exec rspec spec/models/
bundle exec rspec spec/services/
```

## Comandos úteis

```bash
# Console Rails
rails console

# Rotas
rails routes

# Verificar segurança
bundle exec brakeman

# Linting
bundle exec rubocop
```

## Estrutura do Banco de Dados

Para visualizar o schema:
```bash
cat db/schema.rb
```

Para criar migration:
```bash
rails generate migration AddFieldToModel field:type
```

## Deploy

### Variáveis de ambiente necessárias

```
RAILS_ENV=production
SECRET_KEY_BASE=<gerar com `rails secret`>
DATABASE_URL=postgres://...
GOOGLE_CLIENT_ID=...
GOOGLE_CLIENT_SECRET=...
```

### Assets em produção

```bash
RAILS_ENV=production rails assets:precompile
```

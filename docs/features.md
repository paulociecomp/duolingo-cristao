# Funcionalidades

## Sistema de Aprendizado

### Trilhas de Estudo

Conteúdo organizado hierarquicamente:

```
Trilha (Track)
└── Unidade (Unit)
    └── Lição (Lesson)
        └── Exercício (Exercise)
```

**Progressão:**
- Lições são desbloqueadas sequencialmente
- Completar uma lição desbloqueia a próxima
- Barra de progresso mostra % de conclusão

### Tipos de Exercícios

| Tipo | Descrição | Interação |
|------|-----------|-----------|
| **Múltipla Escolha** | Pergunta com 4 opções | Selecionar uma opção |
| **Completar Lacuna** | Versículo com palavra faltando | Escolher palavra do banco |
| **Verdadeiro/Falso** | Afirmação para avaliar | Botões V ou F |
| **Ordenar Palavras** | Palavras embaralhadas | Tocar para ordenar |
| **Conectar Pares** | Duas colunas para associar | Tocar esquerda, depois direita |
| **Quiz Rápido** | Múltiplas perguntas com timer | Responder antes do tempo |
| **Escolher Versículo** | Texto bíblico, adivinhar referência | Selecionar referência correta |
| **Ordenar Eventos** | Acontecimentos bíblicos | Colocar em ordem cronológica |

### Sistema de Vidas

- Máximo de **5 vidas**
- Perde 1 vida por resposta errada
- Regenera 1 vida a cada **30 minutos**
- Pode comprar vidas com gems na loja
- Usuários premium têm vidas ilimitadas

## Gamificação

### Sistema de XP

- Ganhe XP ao completar lições
- XP bônus por respostas perfeitas
- XP por completar missões diárias

**Níveis:**
```
XP necessário = 100 × (nível ^ 1.5)
```

### Streak (Sequência)

- Mantido estudando ao menos 1 lição por dia
- **Streak Freeze** protege por 1 dia sem estudar
- Máximo de 2 freezes armazenados
- Compre freezes na loja (10 gems)

### Conquistas (Badges)

Categorias:
- **Sequência** - Manter streak por X dias
- **Experiência** - Acumular X XP
- **Lições** - Completar X lições
- **Perfeição** - X lições com 100%
- **Ligas** - Alcançar liga X
- **Especiais** - Eventos e marcos

### Ligas e Ranking

Sistema de competição semanal:

1. **Bronze** → **Prata** → **Ouro** → **Diamante**
2. Top 10 são promovidos
3. Bottom 10 são rebaixados
4. Reset toda segunda-feira
5. Ranking baseado em XP da semana

### Missões Diárias

Geradas automaticamente, exemplos:
- Completar 3 lições
- Ganhar 50 XP
- Acertar 10 exercícios seguidos

Recompensas: XP + Gems

## Revisão Espaçada

Algoritmo **SM-2** (SuperMemo):

1. Exercícios errados viram cards de revisão
2. Intervalo aumenta conforme acertos:
   - 1 dia → 3 dias → 7 dias → 14 dias → ...
3. Cards fáceis: intervalo aumenta mais
4. Cards difíceis: intervalo reseta

## Loja

Itens disponíveis:

| Item | Custo | Efeito |
|------|-------|--------|
| Streak Freeze | 10 gems | Protege streak por 1 dia |
| Restaurar Vidas | 50 gems | 5 vidas instantaneamente |

**Ganhar Gems:**
- Missões diárias
- Conquistas
- Promoção de liga

## Interface

### Navegação Desktop

- **Sidebar** esquerda com menu principal
- **Navbar** superior com stats (XP, streak, vidas, gems)
- **Área principal** centralizada

### Navegação Mobile

- **Bottom nav** com 4 itens principais
- **Navbar** compacta no topo
- Layout responsivo

### Tema Visual

Baseado no Duolingo (tema escuro):

| Elemento | Cor |
|----------|-----|
| Background | `#131F24` |
| Cards | `#1A2C32` |
| Bordas | `#37464F` |
| Verde (sucesso) | `#58CC02` |
| Azul (destaque) | `#1CB0F6` |
| Amarelo (XP) | `#FFC800` |
| Laranja (streak) | `#FF9600` |
| Vermelho (vidas) | `#FF4B4B` |

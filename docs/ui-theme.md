# UI e Tema Visual

## Design System

O Duolingo Crente utiliza um tema escuro inspirado no Duolingo original.

## Paleta de Cores

### Cores Base

| Nome | Hex | Uso |
|------|-----|-----|
| Background | `#131F24` | Fundo principal da página |
| Card | `#1A2C32` | Cards, sidebar, navbar |
| Card Hover | `#232F36` | Hover em elementos |
| Border | `#37464F` | Bordas e divisores |
| Border Light | `#4A5D66` | Bordas em hover |

### Cores de Destaque

| Nome | Hex | Uso |
|------|-----|-----|
| Verde | `#58CC02` | Sucesso, logo, botão primário |
| Verde Escuro | `#4CAF00` | Hover do verde |
| Azul | `#1CB0F6` | Links, item ativo, destaque |
| Azul Escuro | `#0EA5E9` | Hover do azul |
| Amarelo | `#FFC800` | XP, progress bars |
| Laranja | `#FF9600` | Streak |
| Vermelho | `#FF4B4B` | Vidas, erros, alertas |
| Roxo | `#CE82FF` | Botões especiais |

### Texto

| Nome | Hex | Uso |
|------|-----|-----|
| Primário | `#FFFFFF` | Títulos, texto principal |
| Secundário | `#AFAFAF` | Descrições |
| Terciário | `#6B7280` | Texto desabilitado |

## Componentes

### Botões

**Primário (Verde):**
```html
<button class="bg-[#58CC02] hover:bg-[#4CAF00] text-white font-semibold
               py-3 px-6 rounded-xl transition cursor-pointer">
  Continuar
</button>
```

**Secundário (Azul):**
```html
<button class="bg-[#1CB0F6] hover:bg-[#0EA5E9] text-white font-semibold
               py-3 px-6 rounded-xl transition cursor-pointer">
  Verificar
</button>
```

**Outline:**
```html
<button class="bg-transparent border-2 border-[#37464F] text-[#56696F]
               font-semibold py-3 px-6 rounded-xl hover:bg-[#232F36]
               transition cursor-pointer">
  Pular
</button>
```

**Desabilitado:**
```html
<button class="bg-[#37464F] text-gray-400 font-semibold py-3 px-6
               rounded-xl cursor-not-allowed" disabled>
  Desabilitado
</button>
```

### Cards

```html
<div class="bg-[#1A2C32] rounded-2xl border border-[#37464F] p-6
            hover:border-[#1CB0F6] transition">
  Conteúdo do card
</div>
```

### Inputs/Opções de Exercício

**Normal:**
```html
<button class="w-full p-4 bg-[#1A2C32] border-2 border-[#37464F]
               rounded-2xl text-white hover:border-[#4A5D66]
               transition cursor-pointer">
  Opção
</button>
```

**Selecionado:**
```html
<button style="border-color: #1CB0F6; background-color: #1A3A4A;">
  Opção Selecionada
</button>
```

### Progress Bar

```html
<div class="w-full bg-[#37464F] rounded-full h-3">
  <div class="bg-[#58CC02] h-3 rounded-full transition-all"
       style="width: 75%"></div>
</div>
```

### Badges/Tags

```html
<span class="bg-[#1CB0F6]/20 text-[#1CB0F6] px-3 py-1 rounded-full
             text-sm font-medium">
  Tag
</span>
```

## Layout

### Desktop

```
┌─────────────────────────────────────────────────────────────┐
│  Navbar (h-16)                                    Stats     │
├──────────┬──────────────────────────────────────────────────┤
│          │                                                  │
│ Sidebar  │              Main Content                        │
│ (w-64)   │           (max-w-2xl mx-auto)                   │
│          │                                                  │
│          │                                                  │
└──────────┴──────────────────────────────────────────────────┘
```

### Mobile

```
┌─────────────────────┐
│  Navbar    Stats    │
├─────────────────────┤
│                     │
│   Main Content      │
│                     │
│                     │
├─────────────────────┤
│   Bottom Nav (4)    │
└─────────────────────┘
```

### Layout de Exercício

```
┌─────────────────────────────────────────┐
│  X    [====Progress Bar====]    ❤️ 5   │
├─────────────────────────────────────────┤
│                                         │
│           Conteúdo do Exercício         │
│              (centralizado)             │
│                                         │
├─────────────────────────────────────────┤
│  [PULAR]                   [VERIFICAR]  │
└─────────────────────────────────────────┘
```

## Tailwind Classes Comuns

```css
/* Backgrounds */
bg-[#131F24]   /* Fundo página */
bg-[#1A2C32]   /* Cards */
bg-[#232F36]   /* Hover */

/* Borders */
border-[#37464F]   /* Normal */
border-[#4A5D66]   /* Hover */

/* Text */
text-white         /* Títulos */
text-gray-400      /* Descrições */
text-[#58CC02]     /* Sucesso */
text-[#1CB0F6]     /* Links */
text-[#FFC800]     /* XP */
text-[#FF9600]     /* Streak */
text-[#FF4B4B]     /* Vidas/Erro */

/* Rounded */
rounded-xl         /* Botões */
rounded-2xl        /* Cards */
rounded-full       /* Avatares, badges */
```

## Responsividade

| Breakpoint | Prefix | Uso |
|------------|--------|-----|
| < 640px | (default) | Mobile |
| ≥ 640px | `sm:` | Mobile grande |
| ≥ 768px | `md:` | Tablet |
| ≥ 1024px | `lg:` | Desktop |

Exemplos:
```html
<!-- Sidebar só no desktop -->
<aside class="hidden lg:flex lg:w-64">

<!-- Bottom nav só no mobile -->
<nav class="lg:hidden fixed bottom-0">

<!-- Grid responsivo -->
<div class="grid md:grid-cols-2 lg:grid-cols-3">
```

# frozen_string_literal: true

# Complemento do Antigo Testamento - Lições Extras
# Adiciona lições para completar 5 lições por unidade
# Total: 9 lições, 90 exercícios

puts "\n=== Criando Lições Complementares do Antigo Testamento ==="

at = Track.find_by(slug: "antigo-testamento")

# ============================================
# UNIDADE 1: A CRIAÇÃO (+2 lições)
# ============================================

unit_criacao = at.units.find_by(name: "A Criação")

# LIÇÃO 4: Caim e Abel (Gênesis 4)
puts "  Criando: Caim e Abel..."
lesson_caim_abel = unit_criacao.lessons.create!(
  name: "Caim e Abel",
  description: "O primeiro homicídio da história - Gênesis 4",
  position: 3,
  xp_reward: 15
)

lesson_caim_abel.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Qual era a profissão de Abel?",
      options: ["Pastor de ovelhas", "Lavrador da terra", "Caçador", "Carpinteiro"]
    },
    correct_answer: { value: "Pastor de ovelhas" },
    explanation: "Abel foi pastor de ovelhas, enquanto Caim foi lavrador da terra (Gênesis 4:2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Por que Deus não aceitou a oferta de Caim?",
      options: ["Caim não ofereceu com fé e coração sincero", "A oferta era pequena demais", "Caim ofereceu no dia errado", "Deus não gostava de vegetais"]
    },
    correct_answer: { value: "Caim não ofereceu com fé e coração sincero" },
    explanation: "A Bíblia indica que o problema estava na atitude de Caim, não no tipo de oferta (Gênesis 4:5-7; Hebreus 11:4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que Deus colocou em Caim para protegê-lo?",
      options: ["Um sinal", "Uma armadura", "Um anjo guardião", "Uma capa"]
    },
    correct_answer: { value: "Um sinal" },
    explanation: "O Senhor pôs um sinal em Caim para que ninguém o ferisse (Gênesis 4:15)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Acaso sou eu ___ do meu irmão?",
      word_bank: ["guardador", "servo", "amigo", "senhor"],
      reference: "Gênesis 4:9"
    },
    correct_answer: { value: "guardador" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "A voz do ___ do teu irmão clama a mim desde a terra",
      word_bank: ["sangue", "espírito", "corpo", "nome"],
      reference: "Gênesis 4:10"
    },
    correct_answer: { value: "sangue" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Caim matou Abel no campo",
      reference: "Gênesis 4:8"
    },
    correct_answer: { value: "true" },
    explanation: "Caim levantou-se contra Abel, seu irmão, e o matou no campo (Gênesis 4:8)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Caim foi condenado à morte por matar Abel",
      reference: "Gênesis 4:12"
    },
    correct_answer: { value: "false" },
    explanation: "Caim foi amaldiçoado a ser fugitivo e errante na terra, mas não foi morto (Gênesis 4:12)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Onde", "está", "Abel", "teu", "irmão"],
      reference: "Gênesis 4:9"
    },
    correct_answer: { order: ["Onde", "está", "Abel", "teu", "irmão"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Abel", "Caim", "Oferta de Abel", "Sinal de Caim"],
      right: ["Pastor de ovelhas", "Lavrador da terra", "Aceita por Deus", "Proteção divina"]
    },
    correct_answer: {
      pairs: {
        "Abel" => "Pastor de ovelhas",
        "Caim" => "Lavrador da terra",
        "Oferta de Abel" => "Aceita por Deus",
        "Sinal de Caim" => "Proteção divina"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "Caim e Abel",
      events: [
        "Caim e Abel trazem ofertas a Deus",
        "Deus aceita a oferta de Abel e rejeita a de Caim",
        "Caim fica irado e seu semblante decai",
        "Caim mata Abel no campo",
        "Deus pergunta a Caim onde está Abel",
        "Caim é amaldiçoado mas recebe um sinal de proteção"
      ]
    },
    correct_answer: { order: [
      "Caim e Abel trazem ofertas a Deus",
      "Deus aceita a oferta de Abel e rejeita a de Caim",
      "Caim fica irado e seu semblante decai",
      "Caim mata Abel no campo",
      "Deus pergunta a Caim onde está Abel",
      "Caim é amaldiçoado mas recebe um sinal de proteção"
    ] }
  }
])

# LIÇÃO 5: Sete e os Descendentes (Gênesis 5)
puts "  Criando: Sete e os Descendentes..."
lesson_sete = unit_criacao.lessons.create!(
  name: "Sete e os Descendentes",
  description: "A linhagem de Adão até Noé - Gênesis 5",
  position: 4,
  xp_reward: 15
)

lesson_sete.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quem nasceu para substituir Abel na linhagem de Adão?",
      options: ["Sete", "Enos", "Enoque", "Lameque"]
    },
    correct_answer: { value: "Sete" },
    explanation: "Eva disse: 'Deus me deu outro filho em lugar de Abel' e chamou-o Sete (Gênesis 4:25)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que aconteceu com Enoque?",
      options: ["Deus o tomou e ele não viu a morte", "Morreu de velhice", "Foi morto em guerra", "Afogou-se no dilúvio"]
    },
    correct_answer: { value: "Deus o tomou e ele não viu a morte" },
    explanation: "Enoque andou com Deus e já não era mais, porque Deus o tomou (Gênesis 5:24)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quem foi o homem que mais viveu na Bíblia?",
      options: ["Matusalém", "Adão", "Noé", "Sete"]
    },
    correct_answer: { value: "Matusalém" },
    explanation: "Matusalém viveu 969 anos, sendo o homem mais longevo da Bíblia (Gênesis 5:27)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Enoque ___ com Deus; e já não era, porque Deus o tomou",
      word_bank: ["andou", "falou", "orou", "viveu"],
      reference: "Gênesis 5:24"
    },
    correct_answer: { value: "andou" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Adão viveu ___ anos e gerou um filho à sua semelhança",
      word_bank: ["cento e trinta", "duzentos", "cem", "noventa"],
      reference: "Gênesis 5:3"
    },
    correct_answer: { value: "cento e trinta" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Noé era filho de Lameque",
      reference: "Gênesis 5:28-29"
    },
    correct_answer: { value: "true" },
    explanation: "Lameque gerou um filho e chamou-o Noé (Gênesis 5:28-29)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Todos os descendentes de Adão até Noé viveram menos de 500 anos",
      reference: "Gênesis 5"
    },
    correct_answer: { value: "false" },
    explanation: "A maioria dos patriarcas viveu mais de 800 anos, com Matusalém vivendo 969 anos."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Enoque", "andou", "com", "Deus"],
      reference: "Gênesis 5:24"
    },
    correct_answer: { order: ["Enoque", "andou", "com", "Deus"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Sete", "Enoque", "Matusalém", "Lameque"],
      right: ["Substituiu Abel", "Não viu a morte", "Mais longevo", "Pai de Noé"]
    },
    correct_answer: {
      pairs: {
        "Sete" => "Substituiu Abel",
        "Enoque" => "Não viu a morte",
        "Matusalém" => "Mais longevo",
        "Lameque" => "Pai de Noé"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "De Adão a Noé",
      events: [
        "Adão gera Sete",
        "Sete gera Enos",
        "Enoque anda com Deus e é tomado",
        "Matusalém vive 969 anos",
        "Lameque gera Noé",
        "Noé encontra graça aos olhos do Senhor"
      ]
    },
    correct_answer: { order: [
      "Adão gera Sete",
      "Sete gera Enos",
      "Enoque anda com Deus e é tomado",
      "Matusalém vive 969 anos",
      "Lameque gera Noé",
      "Noé encontra graça aos olhos do Senhor"
    ] }
  }
])

puts "  Unidade 'A Criação' completada: #{unit_criacao.lessons.count} lições"

# ============================================
# UNIDADE 3: JOSÉ DO EGITO (+2 lições)
# ============================================

unit_jose = at.units.find_by(name: "José do Egito")

# LIÇÃO 4: A Família de Jacó no Egito (Gênesis 46-47)
puts "  Criando: A Família de Jacó no Egito..."
lesson_familia_egito = unit_jose.lessons.create!(
  name: "A Família de Jacó no Egito",
  description: "Jacó e sua família se mudam para o Egito - Gênesis 46-47",
  position: 3,
  xp_reward: 15
)

lesson_familia_egito.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quantas pessoas da família de Jacó foram para o Egito?",
      options: ["Setenta", "Cem", "Quarenta", "Doze"]
    },
    correct_answer: { value: "Setenta" },
    explanation: "Todas as pessoas da casa de Jacó que vieram ao Egito eram setenta (Gênesis 46:27)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Em qual região do Egito a família de Jacó se estabeleceu?",
      options: ["Gósen", "Mênfis", "Tebas", "Alexandria"]
    },
    correct_answer: { value: "Gósen" },
    explanation: "José deu a seus irmãos a terra de Gósen, a melhor região do Egito (Gênesis 47:6)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quantos anos Jacó viveu no Egito?",
      options: ["Dezessete anos", "Sete anos", "Quarenta anos", "Dez anos"]
    },
    correct_answer: { value: "Dezessete anos" },
    explanation: "Jacó viveu dezessete anos na terra do Egito (Gênesis 47:28)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Eu sou Deus, o Deus de teu pai; não temas descer ao ___",
      word_bank: ["Egito", "vale", "deserto", "mar"],
      reference: "Gênesis 46:3"
    },
    correct_answer: { value: "Egito" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "José sustentou seu pai e seus irmãos com ___ durante a fome",
      word_bank: ["pão", "ouro", "gado", "terra"],
      reference: "Gênesis 47:12"
    },
    correct_answer: { value: "pão" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Jacó abençoou Faraó quando o conheceu",
      reference: "Gênesis 47:7"
    },
    correct_answer: { value: "true" },
    explanation: "José apresentou Jacó a Faraó, e Jacó abençoou Faraó (Gênesis 47:7)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Jacó tinha 130 anos quando chegou ao Egito",
      reference: "Gênesis 47:9"
    },
    correct_answer: { value: "true" },
    explanation: "Jacó disse a Faraó: 'Os dias dos anos das minhas peregrinações são cento e trinta anos' (Gênesis 47:9)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Não", "temas", "descer", "ao", "Egito"],
      reference: "Gênesis 46:3"
    },
    correct_answer: { order: ["Não", "temas", "descer", "ao", "Egito"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Gósen", "Setenta pessoas", "130 anos", "José"],
      right: ["Terra da família", "Total que desceu", "Idade de Jacó", "Sustentou a família"]
    },
    correct_answer: {
      pairs: {
        "Gósen" => "Terra da família",
        "Setenta pessoas" => "Total que desceu",
        "130 anos" => "Idade de Jacó",
        "José" => "Sustentou a família"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "A Família no Egito",
      events: [
        "Deus fala com Jacó em Berseba",
        "Jacó parte com toda sua família para o Egito",
        "José vai ao encontro de Jacó em Gósen",
        "Jacó é apresentado a Faraó",
        "A família se estabelece em Gósen",
        "José sustenta a família durante a fome"
      ]
    },
    correct_answer: { order: [
      "Deus fala com Jacó em Berseba",
      "Jacó parte com toda sua família para o Egito",
      "José vai ao encontro de Jacó em Gósen",
      "Jacó é apresentado a Faraó",
      "A família se estabelece em Gósen",
      "José sustenta a família durante a fome"
    ] }
  }
])

# LIÇÃO 5: A Bênção de Jacó (Gênesis 48-50)
puts "  Criando: A Bênção de Jacó..."
lesson_bencao_jaco = unit_jose.lessons.create!(
  name: "A Bênção de Jacó",
  description: "Jacó abençoa seus filhos antes de morrer - Gênesis 48-50",
  position: 4,
  xp_reward: 15
)

lesson_bencao_jaco.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quais filhos de José Jacó adotou como seus próprios?",
      options: ["Efraim e Manassés", "Rúben e Simeão", "Judá e Levi", "Benjamim e Dã"]
    },
    correct_answer: { value: "Efraim e Manassés" },
    explanation: "Jacó adotou Efraim e Manassés como seus filhos (Gênesis 48:5)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Qual filho de José recebeu a maior bênção, mesmo sendo mais novo?",
      options: ["Efraim", "Manassés", "Ambos igualmente", "Nenhum dos dois"]
    },
    correct_answer: { value: "Efraim" },
    explanation: "Jacó pôs a mão direita sobre Efraim, o mais novo, dando-lhe a maior bênção (Gênesis 48:14-19)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Onde Jacó pediu para ser sepultado?",
      options: ["Na caverna de Macpela em Canaã", "No Egito", "Em Berseba", "Em Betel"]
    },
    correct_answer: { value: "Na caverna de Macpela em Canaã" },
    explanation: "Jacó pediu para ser sepultado com seus pais na caverna de Macpela (Gênesis 49:29-30)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "O cetro não se arredará de ___, nem o legislador dentre seus pés",
      word_bank: ["Judá", "José", "Rúben", "Levi"],
      reference: "Gênesis 49:10"
    },
    correct_answer: { value: "Judá" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Jacó viveu cento e ___ anos",
      word_bank: ["quarenta e sete", "trinta", "cinquenta", "vinte"],
      reference: "Gênesis 47:28"
    },
    correct_answer: { value: "quarenta e sete" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "José embalsamou seu pai Jacó segundo o costume egípcio",
      reference: "Gênesis 50:2-3"
    },
    correct_answer: { value: "true" },
    explanation: "José ordenou aos médicos que embalsamassem seu pai (Gênesis 50:2)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "José se vingou de seus irmãos depois da morte de Jacó",
      reference: "Gênesis 50:19-21"
    },
    correct_answer: { value: "false" },
    explanation: "José perdoou seus irmãos e prometeu sustentá-los (Gênesis 50:19-21)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Vós", "intentastes", "o", "mal", "Deus", "o", "tornou", "em", "bem"],
      reference: "Gênesis 50:20"
    },
    correct_answer: { order: ["Vós", "intentastes", "o", "mal", "Deus", "o", "tornou", "em", "bem"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Judá", "José", "Efraim", "Macpela"],
      right: ["O cetro não se arredará", "Ramo frutífero", "Maior bênção", "Sepultura de Jacó"]
    },
    correct_answer: {
      pairs: {
        "Judá" => "O cetro não se arredará",
        "José" => "Ramo frutífero",
        "Efraim" => "Maior bênção",
        "Macpela" => "Sepultura de Jacó"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "Os Últimos Dias de Jacó",
      events: [
        "Jacó adota Efraim e Manassés",
        "Jacó abençoa Efraim com a mão direita",
        "Jacó profetiza sobre cada um de seus 12 filhos",
        "Jacó morre com 147 anos",
        "José leva o corpo de Jacó para Canaã",
        "José perdoa seus irmãos novamente"
      ]
    },
    correct_answer: { order: [
      "Jacó adota Efraim e Manassés",
      "Jacó abençoa Efraim com a mão direita",
      "Jacó profetiza sobre cada um de seus 12 filhos",
      "Jacó morre com 147 anos",
      "José leva o corpo de Jacó para Canaã",
      "José perdoa seus irmãos novamente"
    ] }
  }
])

puts "  Unidade 'José do Egito' completada: #{unit_jose.lessons.count} lições"

# ============================================
# UNIDADE 5: JUÍZES E HERÓIS (+2 lições)
# ============================================

unit_juizes = at.units.find_by(name: "Juízes e Heróis")

# LIÇÃO 4: Josué e Jericó (Josué 1-6)
puts "  Criando: Josué e Jericó..."
lesson_josue = unit_juizes.lessons.create!(
  name: "Josué e Jericó",
  description: "A conquista milagrosa de Jericó - Josué 1-6",
  position: 3,
  xp_reward: 15
)

lesson_josue.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quem foi o sucessor de Moisés na liderança de Israel?",
      options: ["Josué", "Calebe", "Arão", "Eleazar"]
    },
    correct_answer: { value: "Josué" },
    explanation: "Josué, filho de Num, foi escolhido por Deus para suceder Moisés (Josué 1:1-2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Quantos dias os israelitas marcharam ao redor de Jericó?",
      options: ["Sete dias", "Quarenta dias", "Três dias", "Um dia"]
    },
    correct_answer: { value: "Sete dias" },
    explanation: "Israel cercou Jericó por sete dias, dando sete voltas no último dia (Josué 6:3-4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quem foi salva em Jericó por ter ajudado os espias?",
      options: ["Raabe", "Débora", "Miriã", "Ana"]
    },
    correct_answer: { value: "Raabe" },
    explanation: "Raabe escondeu os espias e foi salva com sua família (Josué 6:25)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Sê forte e corajoso; não temas, nem te espantes, porque o Senhor teu Deus é ___ por onde quer que andares",
      word_bank: ["contigo", "à frente", "teu guia", "tua força"],
      reference: "Josué 1:9"
    },
    correct_answer: { value: "contigo" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Os muros de Jericó ___ quando o povo gritou",
      word_bank: ["caíram", "abriram", "tremeram", "racharam"],
      reference: "Josué 6:20"
    },
    correct_answer: { value: "caíram" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Os israelitas atravessaram o rio Jordão a pé enxuto",
      reference: "Josué 3:17"
    },
    correct_answer: { value: "true" },
    explanation: "As águas do Jordão pararam e o povo atravessou em seco (Josué 3:17)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Raabe pendurou um cordão vermelho na janela como sinal",
      reference: "Josué 2:18"
    },
    correct_answer: { value: "true" },
    explanation: "Os espias instruíram Raabe a pendurar um cordão de fio vermelho (Josué 2:18)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Sê", "forte", "e", "corajoso"],
      reference: "Josué 1:9"
    },
    correct_answer: { order: ["Sê", "forte", "e", "corajoso"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Josué", "Raabe", "Jordão", "Jericó"],
      right: ["Sucessor de Moisés", "Salvou os espias", "Águas pararam", "Muros caíram"]
    },
    correct_answer: {
      pairs: {
        "Josué" => "Sucessor de Moisés",
        "Raabe" => "Salvou os espias",
        "Jordão" => "Águas pararam",
        "Jericó" => "Muros caíram"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "A Conquista de Jericó",
      events: [
        "Josué envia dois espias a Jericó",
        "Raabe esconde os espias",
        "Israel atravessa o Jordão em seco",
        "Israel marcha ao redor de Jericó por sete dias",
        "O povo grita e os muros caem",
        "Raabe e sua família são salvas"
      ]
    },
    correct_answer: { order: [
      "Josué envia dois espias a Jericó",
      "Raabe esconde os espias",
      "Israel atravessa o Jordão em seco",
      "Israel marcha ao redor de Jericó por sete dias",
      "O povo grita e os muros caem",
      "Raabe e sua família são salvas"
    ] }
  }
])

# LIÇÃO 5: Débora, a Juíza (Juízes 4-5)
puts "  Criando: Débora, a Juíza..."
lesson_debora = unit_juizes.lessons.create!(
  name: "Débora, a Juíza",
  description: "A profetisa que liderou Israel à vitória - Juízes 4-5",
  position: 4,
  xp_reward: 15
)

lesson_debora.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Qual era a função de Débora em Israel?",
      options: ["Profetisa e juíza", "Rainha", "Sacerdotisa", "Guerreira"]
    },
    correct_answer: { value: "Profetisa e juíza" },
    explanation: "Débora era profetisa e julgava Israel naquele tempo (Juízes 4:4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Quem era o comandante do exército que Débora convocou?",
      options: ["Baraque", "Gideão", "Sansão", "Jefté"]
    },
    correct_answer: { value: "Baraque" },
    explanation: "Débora convocou Baraque para liderar o exército contra Sísera (Juízes 4:6)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quem matou Sísera, o general inimigo?",
      options: ["Jael", "Débora", "Baraque", "Uma pedra"]
    },
    correct_answer: { value: "Jael" },
    explanation: "Jael cravou uma estaca na têmpora de Sísera enquanto ele dormia (Juízes 4:21)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Débora julgava Israel debaixo da palmeira de ___ ",
      word_bank: ["Débora", "Jericó", "Betel", "Ramá"],
      reference: "Juízes 4:5"
    },
    correct_answer: { value: "Débora" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Sísera tinha ___ carros de ferro",
      word_bank: ["novecentos", "trezentos", "cem", "mil"],
      reference: "Juízes 4:3"
    },
    correct_answer: { value: "novecentos" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Baraque se recusou a ir à batalha sem Débora",
      reference: "Juízes 4:8"
    },
    correct_answer: { value: "true" },
    explanation: "Baraque disse: 'Se fores comigo, irei; se não fores, não irei' (Juízes 4:8)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Débora e Baraque cantaram um cântico de vitória",
      reference: "Juízes 5:1"
    },
    correct_answer: { value: "true" },
    explanation: "Débora e Baraque cantaram um cântico no dia da vitória (Juízes 5:1)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Levanta-te", "Baraque", "e", "leva", "cativos"],
      reference: "Juízes 5:12"
    },
    correct_answer: { order: ["Levanta-te", "Baraque", "e", "leva", "cativos"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Débora", "Baraque", "Sísera", "Jael"],
      right: ["Profetisa e juíza", "Comandante de Israel", "General inimigo", "Matou Sísera"]
    },
    correct_answer: {
      pairs: {
        "Débora" => "Profetisa e juíza",
        "Baraque" => "Comandante de Israel",
        "Sísera" => "General inimigo",
        "Jael" => "Matou Sísera"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "A Vitória de Débora",
      events: [
        "Israel é oprimido por Jabim e Sísera",
        "Débora convoca Baraque para a batalha",
        "Baraque pede que Débora vá com ele",
        "O exército de Sísera é derrotado",
        "Sísera foge e é morto por Jael",
        "Débora e Baraque cantam vitória"
      ]
    },
    correct_answer: { order: [
      "Israel é oprimido por Jabim e Sísera",
      "Débora convoca Baraque para a batalha",
      "Baraque pede que Débora vá com ele",
      "O exército de Sísera é derrotado",
      "Sísera foge e é morto por Jael",
      "Débora e Baraque cantam vitória"
    ] }
  }
])

puts "  Unidade 'Juízes e Heróis' completada: #{unit_juizes.lessons.count} lições"

# ============================================
# UNIDADE 6: REIS DE ISRAEL (+1 lição)
# ============================================

unit_reis = at.units.find_by(name: "Reis de Israel")

# LIÇÃO 5: Saul: O Primeiro Rei (1 Samuel 9-15)
puts "  Criando: Saul: O Primeiro Rei..."
lesson_saul = unit_reis.lessons.create!(
  name: "Saul: O Primeiro Rei",
  description: "O primeiro rei de Israel e sua queda - 1 Samuel 9-15",
  position: 4,
  xp_reward: 15
)

lesson_saul.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "De qual tribo era Saul?",
      options: ["Benjamim", "Judá", "Levi", "Efraim"]
    },
    correct_answer: { value: "Benjamim" },
    explanation: "Saul era da tribo de Benjamim, filho de Quis (1 Samuel 9:1-2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Por que o povo pediu um rei?",
      options: ["Queriam ser como as outras nações", "Samuel morreu", "Deus ordenou", "Foram derrotados em guerra"]
    },
    correct_answer: { value: "Queriam ser como as outras nações" },
    explanation: "O povo pediu um rei para ser como as outras nações (1 Samuel 8:5)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Por que Deus rejeitou Saul como rei?",
      options: ["Desobedeceu ao mandamento de Deus", "Era covarde", "Era muito velho", "O povo não o queria mais"]
    },
    correct_answer: { value: "Desobedeceu ao mandamento de Deus" },
    explanation: "Saul desobedeceu a Deus ao poupar Agague e o melhor do gado (1 Samuel 15:23)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Obedecer é melhor do que ___",
      word_bank: ["sacrificar", "orar", "jejuar", "cantar"],
      reference: "1 Samuel 15:22"
    },
    correct_answer: { value: "sacrificar" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Saul era mais alto que todo o povo, desde os ___ para cima",
      word_bank: ["ombros", "joelhos", "pés", "olhos"],
      reference: "1 Samuel 9:2"
    },
    correct_answer: { value: "ombros" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Saul se escondeu entre a bagagem quando ia ser proclamado rei",
      reference: "1 Samuel 10:22"
    },
    correct_answer: { value: "true" },
    explanation: "Saul se escondeu entre a bagagem por timidez (1 Samuel 10:22)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Samuel ficou feliz quando o povo pediu um rei",
      reference: "1 Samuel 8:6"
    },
    correct_answer: { value: "false" },
    explanation: "O pedido desagradou a Samuel e ele orou ao Senhor (1 Samuel 8:6)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Obedecer", "é", "melhor", "do", "que", "sacrificar"],
      reference: "1 Samuel 15:22"
    },
    correct_answer: { order: ["Obedecer", "é", "melhor", "do", "que", "sacrificar"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Saul", "Samuel", "Agague", "Benjamim"],
      right: ["Primeiro rei", "Ungiu Saul", "Rei amalequita", "Tribo de Saul"]
    },
    correct_answer: {
      pairs: {
        "Saul" => "Primeiro rei",
        "Samuel" => "Ungiu Saul",
        "Agague" => "Rei amalequita",
        "Benjamim" => "Tribo de Saul"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "Saul, o Primeiro Rei",
      events: [
        "O povo pede um rei a Samuel",
        "Deus escolhe Saul para ser rei",
        "Samuel unge Saul em secreto",
        "Saul é proclamado rei publicamente",
        "Saul desobedece a Deus na guerra contra Amaleque",
        "Deus rejeita Saul como rei"
      ]
    },
    correct_answer: { order: [
      "O povo pede um rei a Samuel",
      "Deus escolhe Saul para ser rei",
      "Samuel unge Saul em secreto",
      "Saul é proclamado rei publicamente",
      "Saul desobedece a Deus na guerra contra Amaleque",
      "Deus rejeita Saul como rei"
    ] }
  }
])

puts "  Unidade 'Reis de Israel' completada: #{unit_reis.lessons.count} lições"

# ============================================
# UNIDADE 7: OS PROFETAS (+2 lições)
# ============================================

unit_profetas = at.units.find_by(name: "Os Profetas")

# LIÇÃO 4: Eliseu: O Sucessor de Elias (2 Reis 2-6)
puts "  Criando: Eliseu: O Sucessor de Elias..."
lesson_eliseu = unit_profetas.lessons.create!(
  name: "Eliseu: O Sucessor de Elias",
  description: "O profeta que recebeu porção dobrada do espírito - 2 Reis 2-6",
  position: 3,
  xp_reward: 15
)

lesson_eliseu.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que Eliseu pediu a Elias antes dele ser levado?",
      options: ["Porção dobrada do seu espírito", "Seu manto", "Riquezas", "Longa vida"]
    },
    correct_answer: { value: "Porção dobrada do seu espírito" },
    explanation: "Eliseu pediu: 'Que me seja dada porção dobrada do teu espírito' (2 Reis 2:9)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Como Elias foi levado ao céu?",
      options: ["Num carro de fogo com cavalos de fogo", "Subiu uma montanha", "Desapareceu", "Um anjo o levou"]
    },
    correct_answer: { value: "Num carro de fogo com cavalos de fogo" },
    explanation: "Um carro de fogo com cavalos de fogo separou os dois, e Elias subiu num redemoinho (2 Reis 2:11)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que Eliseu fez com o azeite da viúva?",
      options: ["Multiplicou para pagar as dívidas", "Ungiu um rei", "Ofereceu em sacrifício", "Curou enfermos"]
    },
    correct_answer: { value: "Multiplicou para pagar as dívidas" },
    explanation: "Eliseu multiplicou o azeite para a viúva pagar suas dívidas (2 Reis 4:1-7)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Eliseu apanhou o ___ de Elias que caíra dele",
      word_bank: ["manto", "cajado", "anel", "cinto"],
      reference: "2 Reis 2:13"
    },
    correct_answer: { value: "manto" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Naamã foi curado da lepra ao mergulhar ___ vezes no rio Jordão",
      word_bank: ["sete", "três", "dez", "quarenta"],
      reference: "2 Reis 5:14"
    },
    correct_answer: { value: "sete" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Eliseu ressuscitou o filho da sunamita",
      reference: "2 Reis 4:32-35"
    },
    correct_answer: { value: "true" },
    explanation: "Eliseu orou e deitou-se sobre o menino, que espirrou sete vezes e abriu os olhos (2 Reis 4:35)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Eliseu fez flutuar um machado de ferro na água",
      reference: "2 Reis 6:6"
    },
    correct_answer: { value: "true" },
    explanation: "Eliseu cortou um pau, jogou na água, e o ferro flutuou (2 Reis 6:6)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Porção", "dobrada", "do", "teu", "espírito"],
      reference: "2 Reis 2:9"
    },
    correct_answer: { order: ["Porção", "dobrada", "do", "teu", "espírito"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Carro de fogo", "Manto", "Naamã", "Sunamita"],
      right: ["Levou Elias", "Herdado por Eliseu", "Curado da lepra", "Filho ressuscitado"]
    },
    correct_answer: {
      pairs: {
        "Carro de fogo" => "Levou Elias",
        "Manto" => "Herdado por Eliseu",
        "Naamã" => "Curado da lepra",
        "Sunamita" => "Filho ressuscitado"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "Os Milagres de Eliseu",
      events: [
        "Eliseu pede porção dobrada do espírito",
        "Elias é levado num carro de fogo",
        "Eliseu divide as águas do Jordão",
        "Eliseu multiplica o azeite da viúva",
        "Eliseu ressuscita o filho da sunamita",
        "Eliseu cura Naamã da lepra"
      ]
    },
    correct_answer: { order: [
      "Eliseu pede porção dobrada do espírito",
      "Elias é levado num carro de fogo",
      "Eliseu divide as águas do Jordão",
      "Eliseu multiplica o azeite da viúva",
      "Eliseu ressuscita o filho da sunamita",
      "Eliseu cura Naamã da lepra"
    ] }
  }
])

# LIÇÃO 5: Isaías: O Profeta Messiânico (Isaías 6, 9, 53)
puts "  Criando: Isaías: O Profeta Messiânico..."
lesson_isaias = unit_profetas.lessons.create!(
  name: "Isaías: O Profeta Messiânico",
  description: "As profecias sobre o Messias - Isaías 6, 9, 53",
  position: 4,
  xp_reward: 15
)

lesson_isaias.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que os serafins clamavam na visão de Isaías?",
      options: ["Santo, Santo, Santo é o Senhor", "Glória a Deus nas alturas", "Bendito o que vem", "Aleluia ao Senhor"]
    },
    correct_answer: { value: "Santo, Santo, Santo é o Senhor" },
    explanation: "Os serafins clamavam: 'Santo, santo, santo é o Senhor dos Exércitos' (Isaías 6:3)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que Isaías profetizou sobre o Messias em Isaías 9:6?",
      options: ["Um menino nos nasceu, um filho se nos deu", "Ele virá nas nuvens", "Nascerá em Belém", "Será batizado no Jordão"]
    },
    correct_answer: { value: "Um menino nos nasceu, um filho se nos deu" },
    explanation: "Isaías profetizou: 'Porque um menino nos nasceu, um filho se nos deu' (Isaías 9:6)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Segundo Isaías 53, como seria o Messias?",
      options: ["Homem de dores e experimentado nos sofrimentos", "Rei poderoso e conquistador", "Juiz severo e implacável", "Anjo de luz"]
    },
    correct_answer: { value: "Homem de dores e experimentado nos sofrimentos" },
    explanation: "Isaías profetizou que seria 'homem de dores e experimentado nos sofrimentos' (Isaías 53:3)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Eis-me aqui, ___ a mim",
      word_bank: ["envia", "chama", "usa", "leva"],
      reference: "Isaías 6:8"
    },
    correct_answer: { value: "envia" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "O seu nome será: Maravilhoso Conselheiro, Deus Forte, Pai da Eternidade, Príncipe da ___",
      word_bank: ["Paz", "Justiça", "Glória", "Verdade"],
      reference: "Isaías 9:6"
    },
    correct_answer: { value: "Paz" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Isaías viu o Senhor assentado num alto e sublime trono",
      reference: "Isaías 6:1"
    },
    correct_answer: { value: "true" },
    explanation: "Isaías teve uma visão do Senhor em seu trono (Isaías 6:1)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Isaías 53 descreve o Servo Sofredor que carregou nossos pecados",
      reference: "Isaías 53:4-5"
    },
    correct_answer: { value: "true" },
    explanation: "Ele foi ferido pelas nossas transgressões e moído pelas nossas iniquidades (Isaías 53:5)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Santo", "santo", "santo", "é", "o", "Senhor"],
      reference: "Isaías 6:3"
    },
    correct_answer: { order: ["Santo", "santo", "santo", "é", "o", "Senhor"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Isaías 6", "Isaías 7:14", "Isaías 9:6", "Isaías 53"],
      right: ["Visão do trono", "Virgem conceberá", "Príncipe da Paz", "Servo Sofredor"]
    },
    correct_answer: {
      pairs: {
        "Isaías 6" => "Visão do trono",
        "Isaías 7:14" => "Virgem conceberá",
        "Isaías 9:6" => "Príncipe da Paz",
        "Isaías 53" => "Servo Sofredor"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "As Profecias de Isaías",
      events: [
        "Isaías vê o Senhor em seu trono",
        "Um serafim purifica os lábios de Isaías",
        "Isaías responde: Eis-me aqui, envia-me a mim",
        "Isaías profetiza sobre Emanuel",
        "Isaías anuncia o nascimento do Príncipe da Paz",
        "Isaías descreve o Servo Sofredor"
      ]
    },
    correct_answer: { order: [
      "Isaías vê o Senhor em seu trono",
      "Um serafim purifica os lábios de Isaías",
      "Isaías responde: Eis-me aqui, envia-me a mim",
      "Isaías profetiza sobre Emanuel",
      "Isaías anuncia o nascimento do Príncipe da Paz",
      "Isaías descreve o Servo Sofredor"
    ] }
  }
])

puts "  Unidade 'Os Profetas' completada: #{unit_profetas.lessons.count} lições"

# ============================================
# RESUMO FINAL
# ============================================

puts "\n=== Resumo do Complemento ==="
at.reload
at.units.order(:position).each do |u|
  puts "  #{u.name}: #{u.lessons.count} lições"
end
total_lessons = at.units.sum { |u| u.lessons.count }
total_exercises = at.units.sum { |u| u.lessons.sum { |l| l.exercises.count } }
puts "  ---"
puts "  Total: #{at.units.count} unidades, #{total_lessons} lições, #{total_exercises} exercícios"
puts "=== Complemento concluído! ==="

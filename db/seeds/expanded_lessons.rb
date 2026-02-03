# frozen_string_literal: true

# Expanded Lessons Seed File
# Adds ~10 new lessons with 10 exercises each to existing tracks
#
# Distribution per lesson (10 exercises):
# - multiple_choice: 3x
# - fill_blank: 2x
# - true_false: 2x
# - order_words: 1x
# - connect_pairs: 1x
# - sequence_story or choose_verse: 1x

puts "\n=== Criando Lições Expandidas ==="

# ============================================
# NOVO TESTAMENTO - 4 novas lições
# ============================================

nt = Track.find_by(slug: "novo-testamento")

# Unidade 1 - O Nascimento de Jesus (adicionar 1 lição)
unit_nascimento = nt.units.find_by(name: "O Nascimento de Jesus")

puts "  Criando: A Fuga para o Egito..."
lesson_fuga = unit_nascimento.lessons.create!(
  name: "A Fuga para o Egito",
  description: "José, Maria e Jesus fogem de Herodes - Mateus 2:13-23",
  position: 3,
  xp_reward: 15
)

lesson_fuga.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Por que José levou Maria e Jesus para o Egito?",
      options: ["Para fugir de Herodes", "Para visitar parentes", "Para trabalhar", "Para conhecer as pirâmides"]
    },
    correct_answer: { value: "Para fugir de Herodes" },
    explanation: "Um anjo avisou José em sonho que Herodes queria matar o menino (Mateus 2:13)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Como José soube que deveria fugir para o Egito?",
      options: ["Um anjo apareceu em sonho", "Os reis magos avisaram", "Maria teve uma visão", "Um profeta disse"]
    },
    correct_answer: { value: "Um anjo apareceu em sonho" },
    explanation: "O anjo do Senhor apareceu em sonho a José (Mateus 2:13)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que Herodes mandou fazer com os meninos de Belém?",
      options: ["Matar todos de 2 anos para baixo", "Levá-los ao templo", "Batizá-los", "Dar presentes a eles"]
    },
    correct_answer: { value: "Matar todos de 2 anos para baixo" },
    explanation: "Herodes, furioso por ter sido enganado pelos magos, ordenou a morte de todos os meninos de Belém de dois anos para baixo (Mateus 2:16)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Do ___ chamei o meu filho",
      word_bank: ["Egito", "deserto", "mar", "céu"],
      reference: "Mateus 2:15"
    },
    correct_answer: { value: "Egito" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "José ficou no Egito até a ___ de Herodes",
      word_bank: ["morte", "conversão", "velhice", "viagem"],
      reference: "Mateus 2:15"
    },
    correct_answer: { value: "morte" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "José voltou do Egito e foi morar em Nazaré",
      reference: "Mateus 2:23"
    },
    correct_answer: { value: "true" },
    explanation: "Após a morte de Herodes, José levou a família para Nazaré na Galileia (Mateus 2:23)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Os reis magos voltaram a Herodes para contar onde Jesus estava",
      reference: "Mateus 2:12"
    },
    correct_answer: { value: "false" },
    explanation: "Os magos foram avisados em sonho para não voltarem a Herodes e retornaram por outro caminho."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Levanta-te", "toma", "o", "menino", "e", "foge", "para", "o", "Egito"],
      reference: "Mateus 2:13"
    },
    correct_answer: { order: ["Levanta-te", "toma", "o", "menino", "e", "foge", "para", "o", "Egito"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Herodes", "José", "Anjo", "Nazaré"],
      right: ["Queria matar Jesus", "Fugiu para o Egito", "Avisou em sonho", "Cidade onde Jesus cresceu"]
    },
    correct_answer: {
      pairs: {
        "Herodes" => "Queria matar Jesus",
        "José" => "Fugiu para o Egito",
        "Anjo" => "Avisou em sonho",
        "Nazaré" => "Cidade onde Jesus cresceu"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "A Fuga para o Egito",
      events: [
        "Os reis magos visitam Jesus",
        "Um anjo avisa José em sonho",
        "José foge com Maria e Jesus para o Egito",
        "Herodes manda matar os meninos",
        "Herodes morre",
        "José retorna e vai morar em Nazaré"
      ]
    },
    correct_answer: { order: [
      "Os reis magos visitam Jesus",
      "Um anjo avisa José em sonho",
      "José foge com Maria e Jesus para o Egito",
      "Herodes manda matar os meninos",
      "Herodes morre",
      "José retorna e vai morar em Nazaré"
    ] }
  }
])

# Unidade 2 - O Ministério de Jesus (adicionar 2 lições)
unit_ministerio = nt.units.find_by(name: "O Ministério de Jesus")

puts "  Criando: As Tentações no Deserto..."
lesson_tentacoes = unit_ministerio.lessons.create!(
  name: "As Tentações no Deserto",
  description: "Jesus é tentado por Satanás - Mateus 4:1-11",
  position: 2,
  xp_reward: 15
)

lesson_tentacoes.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quantos dias Jesus jejuou no deserto?",
      options: ["40 dias", "7 dias", "30 dias", "21 dias"]
    },
    correct_answer: { value: "40 dias" },
    explanation: "Jesus jejuou quarenta dias e quarenta noites no deserto (Mateus 4:2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Na primeira tentação, Satanás pediu que Jesus transformasse o quê em pão?",
      options: ["Pedras", "Água", "Areia", "Madeira"]
    },
    correct_answer: { value: "Pedras" },
    explanation: "Satanás disse: 'Se tu és o Filho de Deus, manda que estas pedras se transformem em pães' (Mateus 4:3)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Onde Satanás levou Jesus na segunda tentação?",
      options: ["Ao pináculo do templo", "A uma montanha alta", "Ao mar da Galileia", "Ao palácio de Herodes"]
    },
    correct_answer: { value: "Ao pináculo do templo" },
    explanation: "O diabo o levou à cidade santa e o colocou sobre o pináculo do templo (Mateus 4:5)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Nem só de pão viverá o homem, mas de toda ___ que sai da boca de Deus",
      word_bank: ["palavra", "ordem", "lei", "promessa"],
      reference: "Mateus 4:4"
    },
    correct_answer: { value: "palavra" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Ao Senhor teu Deus adorarás, e só a ele ___",
      word_bank: ["servirás", "orarás", "amarás", "ouvirás"],
      reference: "Mateus 4:10"
    },
    correct_answer: { value: "servirás" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Jesus foi levado ao deserto pelo Espírito Santo para ser tentado",
      reference: "Mateus 4:1"
    },
    correct_answer: { value: "true" },
    explanation: "Jesus foi conduzido pelo Espírito ao deserto para ser tentado pelo diabo."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Jesus cedeu à terceira tentação e adorou Satanás",
      reference: "Mateus 4:10"
    },
    correct_answer: { value: "false" },
    explanation: "Jesus resistiu dizendo: 'Vai-te, Satanás! Porque está escrito: Ao Senhor teu Deus adorarás.'"
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Não", "tentarás", "o", "Senhor", "teu", "Deus"],
      reference: "Mateus 4:7"
    },
    correct_answer: { order: ["Não", "tentarás", "o", "Senhor", "teu", "Deus"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["1ª Tentação", "2ª Tentação", "3ª Tentação", "Resposta de Jesus"],
      right: ["Transformar pedras em pão", "Pular do templo", "Adorar Satanás", "Citou as Escrituras"]
    },
    correct_answer: {
      pairs: {
        "1ª Tentação" => "Transformar pedras em pão",
        "2ª Tentação" => "Pular do templo",
        "3ª Tentação" => "Adorar Satanás",
        "Resposta de Jesus" => "Citou as Escrituras"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "Qual versículo Jesus usou para responder à primeira tentação?",
      options: [
        "Nem só de pão viverá o homem",
        "Amarás o Senhor teu Deus",
        "O Senhor é meu pastor",
        "Deus é amor"
      ],
      reference: "Mateus 4:4"
    },
    correct_answer: { value: "Nem só de pão viverá o homem" }
  }
])

puts "  Criando: O Primeiro Milagre..."
lesson_cana = unit_ministerio.lessons.create!(
  name: "O Primeiro Milagre",
  description: "Jesus transforma água em vinho em Caná - João 2:1-11",
  position: 3,
  xp_reward: 15
)

lesson_cana.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Em que cidade Jesus fez seu primeiro milagre?",
      options: ["Caná da Galileia", "Jerusalém", "Belém", "Cafarnaum"]
    },
    correct_answer: { value: "Caná da Galileia" },
    explanation: "Este foi o primeiro sinal que Jesus realizou, em Caná da Galileia (João 2:11)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Qual foi a ocasião do primeiro milagre de Jesus?",
      options: ["Um casamento", "Um funeral", "Uma festa de aniversário", "Uma celebração no templo"]
    },
    correct_answer: { value: "Um casamento" },
    explanation: "Houve um casamento em Caná da Galileia, e a mãe de Jesus estava ali (João 2:1)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quantas talhas de pedra foram usadas no milagre?",
      options: ["Seis", "Três", "Doze", "Quatro"]
    },
    correct_answer: { value: "Seis" },
    explanation: "Estavam ali seis talhas de pedra para as purificações dos judeus (João 2:6)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "A mãe de Jesus disse aos serventes: Fazei tudo quanto ele vos ___",
      word_bank: ["disser", "mandar", "pedir", "ordenar"],
      reference: "João 2:5"
    },
    correct_answer: { value: "disser" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Jesus transformou ___ em vinho",
      word_bank: ["água", "suco", "leite", "azeite"],
      reference: "João 2:9"
    },
    correct_answer: { value: "água" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O mestre-sala disse que o melhor vinho foi servido por último",
      reference: "João 2:10"
    },
    correct_answer: { value: "true" },
    explanation: "O mestre-sala disse: 'Todo homem serve primeiro o bom vinho... mas tu guardaste o bom vinho até agora.'"
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "A mãe de Jesus não estava presente no casamento em Caná",
      reference: "João 2:1"
    },
    correct_answer: { value: "false" },
    explanation: "Maria estava presente e foi ela quem pediu a ajuda de Jesus quando o vinho acabou."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Fazei", "tudo", "quanto", "ele", "vos", "disser"],
      reference: "João 2:5"
    },
    correct_answer: { order: ["Fazei", "tudo", "quanto", "ele", "vos", "disser"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Caná", "Maria", "Seis talhas", "Mestre-sala"],
      right: ["Local do milagre", "Pediu ajuda a Jesus", "Onde a água foi colocada", "Provou o vinho"]
    },
    correct_answer: {
      pairs: {
        "Caná" => "Local do milagre",
        "Maria" => "Pediu ajuda a Jesus",
        "Seis talhas" => "Onde a água foi colocada",
        "Mestre-sala" => "Provou o vinho"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "O Milagre em Caná",
      events: [
        "Jesus e seus discípulos vão a um casamento",
        "O vinho acaba",
        "Maria fala com Jesus",
        "Jesus manda encher as talhas com água",
        "A água se transforma em vinho",
        "O mestre-sala prova o vinho"
      ]
    },
    correct_answer: { order: [
      "Jesus e seus discípulos vão a um casamento",
      "O vinho acaba",
      "Maria fala com Jesus",
      "Jesus manda encher as talhas com água",
      "A água se transforma em vinho",
      "O mestre-sala prova o vinho"
    ] }
  }
])

# Unidade 3 - Sermão da Montanha (adicionar 1 lição)
unit_sermao = nt.units.find_by(name: "Sermão da Montanha")

puts "  Criando: Sal e Luz do Mundo..."
lesson_sal_luz = unit_sermao.lessons.create!(
  name: "Sal e Luz do Mundo",
  description: "Jesus ensina sobre ser sal e luz - Mateus 5:13-16",
  position: 1,
  xp_reward: 15
)

lesson_sal_luz.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "A que Jesus comparou seus seguidores primeiro?",
      options: ["Sal da terra", "Água da vida", "Pão do céu", "Rocha firme"]
    },
    correct_answer: { value: "Sal da terra" },
    explanation: "Jesus disse: 'Vós sois o sal da terra' (Mateus 5:13)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que acontece com o sal que perde o sabor?",
      options: ["É lançado fora e pisado", "É guardado para depois", "É misturado com outro sal", "É jogado no mar"]
    },
    correct_answer: { value: "É lançado fora e pisado" },
    explanation: "Se o sal perder o sabor, para nada mais presta senão para ser lançado fora e pisado pelos homens (Mateus 5:13)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Onde não se coloca uma candeia acesa?",
      options: ["Debaixo do alqueire", "Sobre o velador", "Na janela", "Na porta"]
    },
    correct_answer: { value: "Debaixo do alqueire" },
    explanation: "Não se acende uma candeia para colocá-la debaixo do alqueire, mas no velador (Mateus 5:15)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Vós sois a ___ do mundo",
      word_bank: ["luz", "esperança", "força", "alegria"],
      reference: "Mateus 5:14"
    },
    correct_answer: { value: "luz" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Não se pode esconder uma cidade edificada sobre um ___",
      word_bank: ["monte", "vale", "rio", "campo"],
      reference: "Mateus 5:14"
    },
    correct_answer: { value: "monte" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Jesus disse que devemos esconder nossa luz para não incomodar os outros",
      reference: "Mateus 5:15"
    },
    correct_answer: { value: "false" },
    explanation: "Jesus ensinou o contrário: nossa luz deve brilhar diante dos homens."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "A luz deve brilhar para que vejam as boas obras e glorifiquem o Pai",
      reference: "Mateus 5:16"
    },
    correct_answer: { value: "true" },
    explanation: "Assim brilhe a vossa luz, para que vejam as vossas boas obras e glorifiquem o Pai que está nos céus."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Vós", "sois", "o", "sal", "da", "terra"],
      reference: "Mateus 5:13"
    },
    correct_answer: { order: ["Vós", "sois", "o", "sal", "da", "terra"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Sal", "Luz", "Cidade", "Candeia"],
      right: ["Da terra", "Do mundo", "Sobre o monte", "Sobre o velador"]
    },
    correct_answer: {
      pairs: {
        "Sal" => "Da terra",
        "Luz" => "Do mundo",
        "Cidade" => "Sobre o monte",
        "Candeia" => "Sobre o velador"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "Complete o versículo: 'Assim brilhe a vossa luz diante dos homens...'",
      options: [
        "...para que vejam as vossas boas obras e glorifiquem o Pai",
        "...para que todos vos sigam",
        "...para que sejais famosos",
        "...para que ninguém tropeçe"
      ],
      reference: "Mateus 5:16"
    },
    correct_answer: { value: "...para que vejam as vossas boas obras e glorifiquem o Pai" }
  }
])

puts "  Novo Testamento expandido: +4 lições"

# ============================================
# ANTIGO TESTAMENTO - 2 novas lições
# ============================================

at = Track.find_by(slug: "antigo-testamento")
unit_criacao = at.units.find_by(name: "A Criação")

puts "  Criando: Adão e Eva..."
lesson_adao_eva = unit_criacao.lessons.create!(
  name: "Adão e Eva",
  description: "Deus cria o homem e a mulher - Gênesis 2:7-25",
  position: 1,
  xp_reward: 15
)

lesson_adao_eva.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "De que Deus formou o homem?",
      options: ["Do pó da terra", "Da água", "Do fogo", "Das estrelas"]
    },
    correct_answer: { value: "Do pó da terra" },
    explanation: "Formou o Senhor Deus o homem do pó da terra e soprou em suas narinas o fôlego de vida (Gênesis 2:7)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "De onde Deus tirou a costela para formar Eva?",
      options: ["Do lado de Adão", "Da terra", "De um animal", "De uma árvore"]
    },
    correct_answer: { value: "Do lado de Adão" },
    explanation: "Deus fez cair um sono pesado sobre Adão, tomou uma de suas costelas e formou a mulher (Gênesis 2:21-22)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Como se chamava o jardim onde Deus colocou Adão?",
      options: ["Éden", "Paraíso", "Getsêmani", "Oliveiras"]
    },
    correct_answer: { value: "Éden" },
    explanation: "E plantou o Senhor Deus um jardim no Éden, do lado oriental, e ali colocou o homem que havia formado (Gênesis 2:8)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Deus soprou em suas narinas o fôlego de ___",
      word_bank: ["vida", "amor", "força", "sabedoria"],
      reference: "Gênesis 2:7"
    },
    correct_answer: { value: "vida" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Não é bom que o homem esteja ___",
      word_bank: ["só", "triste", "cansado", "ocupado"],
      reference: "Gênesis 2:18"
    },
    correct_answer: { value: "só" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Adão deu nome a todos os animais",
      reference: "Gênesis 2:19-20"
    },
    correct_answer: { value: "true" },
    explanation: "Deus trouxe todos os animais a Adão para ver como os chamaria (Gênesis 2:19)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Adão e Eva sentiam vergonha de estar nus no jardim",
      reference: "Gênesis 2:25"
    },
    correct_answer: { value: "false" },
    explanation: "Ambos estavam nus e não se envergonhavam (Gênesis 2:25)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Esta", "é", "osso", "dos", "meus", "ossos"],
      reference: "Gênesis 2:23"
    },
    correct_answer: { order: ["Esta", "é", "osso", "dos", "meus", "ossos"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Adão", "Eva", "Éden", "Animais"],
      right: ["Formado do pó", "Formada da costela", "Jardim de Deus", "Nomeados por Adão"]
    },
    correct_answer: {
      pairs: {
        "Adão" => "Formado do pó",
        "Eva" => "Formada da costela",
        "Éden" => "Jardim de Deus",
        "Animais" => "Nomeados por Adão"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "A Criação do Homem e da Mulher",
      events: [
        "Deus forma Adão do pó",
        "Deus sopra o fôlego de vida",
        "Deus planta o jardim do Éden",
        "Adão dá nome aos animais",
        "Deus faz Adão dormir",
        "Deus forma Eva da costela"
      ]
    },
    correct_answer: { order: [
      "Deus forma Adão do pó",
      "Deus sopra o fôlego de vida",
      "Deus planta o jardim do Éden",
      "Adão dá nome aos animais",
      "Deus faz Adão dormir",
      "Deus forma Eva da costela"
    ] }
  }
])

puts "  Criando: A Queda..."
lesson_queda = unit_criacao.lessons.create!(
  name: "A Queda",
  description: "O pecado entra no mundo - Gênesis 3:1-24",
  position: 2,
  xp_reward: 15
)

lesson_queda.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Qual animal tentou Eva?",
      options: ["A serpente", "O leão", "A águia", "O lobo"]
    },
    correct_answer: { value: "A serpente" },
    explanation: "A serpente era mais astuta que todos os animais do campo (Gênesis 3:1)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "De qual árvore Adão e Eva não podiam comer?",
      options: ["Árvore do conhecimento do bem e do mal", "Árvore da vida", "Árvore de figueira", "Árvore de oliveira"]
    },
    correct_answer: { value: "Árvore do conhecimento do bem e do mal" },
    explanation: "Deus disse: 'Da árvore do conhecimento do bem e do mal não comerás' (Gênesis 2:17)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que Adão e Eva fizeram depois de pecar?",
      options: ["Se esconderam de Deus", "Fugiram do jardim", "Pediram perdão", "Culparam a serpente imediatamente"]
    },
    correct_answer: { value: "Se esconderam de Deus" },
    explanation: "Ouvindo a voz do Senhor, Adão e Eva se esconderam entre as árvores (Gênesis 3:8)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Certamente não morrereis. Sereis como ___, conhecendo o bem e o mal",
      word_bank: ["Deus", "anjos", "reis", "deuses"],
      reference: "Gênesis 3:4-5"
    },
    correct_answer: { value: "Deus" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Do suor do teu rosto comerás o teu ___",
      word_bank: ["pão", "fruto", "alimento", "sustento"],
      reference: "Gênesis 3:19"
    },
    correct_answer: { value: "pão" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Adão culpou Eva pelo pecado",
      reference: "Gênesis 3:12"
    },
    correct_answer: { value: "true" },
    explanation: "Adão disse: 'A mulher que me deste por companheira, ela me deu da árvore, e eu comi.'"
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Deus amaldiçoou apenas a serpente, não Adão nem Eva",
      reference: "Gênesis 3:14-19"
    },
    correct_answer: { value: "false" },
    explanation: "Deus pronunciou consequências para a serpente, para Eva e para Adão."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Onde", "estás", "tu"],
      reference: "Gênesis 3:9"
    },
    correct_answer: { order: ["Onde", "estás", "tu"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Serpente", "Eva", "Adão", "Fruto proibido"],
      right: ["Rastejará sobre o ventre", "Dores de parto aumentadas", "Trabalho com suor", "Conhecimento do bem e do mal"]
    },
    correct_answer: {
      pairs: {
        "Serpente" => "Rastejará sobre o ventre",
        "Eva" => "Dores de parto aumentadas",
        "Adão" => "Trabalho com suor",
        "Fruto proibido" => "Conhecimento do bem e do mal"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "A Queda do Homem",
      events: [
        "A serpente conversa com Eva",
        "Eva come do fruto proibido",
        "Eva dá o fruto a Adão",
        "Eles percebem que estão nus",
        "Adão e Eva se escondem de Deus",
        "Deus os expulsa do jardim"
      ]
    },
    correct_answer: { order: [
      "A serpente conversa com Eva",
      "Eva come do fruto proibido",
      "Eva dá o fruto a Adão",
      "Eles percebem que estão nus",
      "Adão e Eva se escondem de Deus",
      "Deus os expulsa do jardim"
    ] }
  }
])

puts "  Antigo Testamento expandido: +2 lições"

# ============================================
# SALMOS - 2 novas lições
# ============================================

salmos = Track.find_by(slug: "salmos")
unit_salmo23 = salmos.units.find_by(name: "Salmo 23")

puts "  Criando: Vale da Sombra da Morte..."
lesson_vale = unit_salmo23.lessons.create!(
  name: "Vale da Sombra da Morte",
  description: "Confiança em Deus nos momentos difíceis - Salmo 23:4-6",
  position: 1,
  xp_reward: 15
)

lesson_vale.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Por que Davi não temia o vale da sombra da morte?",
      options: ["Porque Deus estava com ele", "Porque era corajoso", "Porque tinha armas", "Porque conhecia o caminho"]
    },
    correct_answer: { value: "Porque Deus estava com ele" },
    explanation: "Ainda que eu ande pelo vale da sombra da morte, não temerei mal algum, porque tu estás comigo (Salmo 23:4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que a vara e o cajado de Deus fazem?",
      options: ["Consolam", "Punem", "Protegem das feras", "Abrem caminhos"]
    },
    correct_answer: { value: "Consolam" },
    explanation: "A tua vara e o teu cajado me consolam (Salmo 23:4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Onde Davi habitará para sempre?",
      options: ["Na casa do Senhor", "Em Jerusalém", "No templo", "No palácio"]
    },
    correct_answer: { value: "Na casa do Senhor" },
    explanation: "E habitarei na casa do Senhor por longos dias (Salmo 23:6)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Preparas uma ___ perante mim na presença dos meus inimigos",
      word_bank: ["mesa", "cama", "casa", "festa"],
      reference: "Salmo 23:5"
    },
    correct_answer: { value: "mesa" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Unges a minha cabeça com ___; o meu cálice transborda",
      word_bank: ["óleo", "água", "vinho", "perfume"],
      reference: "Salmo 23:5"
    },
    correct_answer: { value: "óleo" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "A bondade e a misericórdia seguirão Davi todos os dias de sua vida",
      reference: "Salmo 23:6"
    },
    correct_answer: { value: "true" }
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "O vale da sombra da morte é um lugar literal que Davi atravessou",
      reference: "Salmo 23:4"
    },
    correct_answer: { value: "false" },
    explanation: "É uma metáfora para os momentos difíceis e de perigo na vida."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Não", "temerei", "mal", "algum", "porque", "tu", "estás", "comigo"],
      reference: "Salmo 23:4"
    },
    correct_answer: { order: ["Não", "temerei", "mal", "algum", "porque", "tu", "estás", "comigo"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Vara e cajado", "Mesa", "Óleo", "Cálice"],
      right: ["Consolam", "Na presença dos inimigos", "Unge a cabeça", "Transborda"]
    },
    correct_answer: {
      pairs: {
        "Vara e cajado" => "Consolam",
        "Mesa" => "Na presença dos inimigos",
        "Óleo" => "Unge a cabeça",
        "Cálice" => "Transborda"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "Complete: 'Certamente que a bondade e a misericórdia me seguirão...'",
      options: [
        "...todos os dias da minha vida",
        "...enquanto eu viver nesta terra",
        "...até o fim dos tempos",
        "...por toda a eternidade"
      ],
      reference: "Salmo 23:6"
    },
    correct_answer: { value: "...todos os dias da minha vida" }
  }
])

# Nova Unidade - Salmos de Louvor
puts "  Criando nova unidade: Salmos de Louvor..."
unit_louvor = salmos.units.create!(
  name: "Salmos de Louvor",
  description: "Cânticos de adoração ao Senhor",
  icon: "🎶",
  position: 1
)

puts "  Criando: Salmo 100 - Jubilai ao Senhor..."
lesson_salmo100 = unit_louvor.lessons.create!(
  name: "Jubilai ao Senhor",
  description: "Um salmo de ação de graças - Salmo 100",
  position: 0,
  xp_reward: 15
)

lesson_salmo100.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Como devemos entrar na presença de Deus, segundo o Salmo 100?",
      options: ["Com ação de graças", "Com medo", "Em silêncio", "Com ofertas"]
    },
    correct_answer: { value: "Com ação de graças" },
    explanation: "Entrai pelas portas dele com ação de graças, e em seus átrios com louvor (Salmo 100:4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Quem deve jubiliar ao Senhor?",
      options: ["Toda a terra", "Apenas Israel", "Os sacerdotes", "Os levitas"]
    },
    correct_answer: { value: "Toda a terra" },
    explanation: "Jubilai ao Senhor, todas as terras (Salmo 100:1)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Com que devemos servir ao Senhor?",
      options: ["Com alegria", "Com temor", "Com sacrifícios", "Com tristeza"]
    },
    correct_answer: { value: "Com alegria" },
    explanation: "Servi ao Senhor com alegria (Salmo 100:2)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Sabei que o Senhor é ___; foi ele quem nos fez",
      word_bank: ["Deus", "bom", "santo", "justo"],
      reference: "Salmo 100:3"
    },
    correct_answer: { value: "Deus" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Porque o Senhor é bom; a sua ___ dura para sempre",
      word_bank: ["misericórdia", "ira", "justiça", "palavra"],
      reference: "Salmo 100:5"
    },
    correct_answer: { value: "misericórdia" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O Salmo 100 diz que somos ovelhas do pasto de Deus",
      reference: "Salmo 100:3"
    },
    correct_answer: { value: "true" },
    explanation: "Somos dele; somos o seu povo e ovelhas do seu pasto."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "O Salmo 100 é um salmo de lamentação",
      reference: "Salmo 100"
    },
    correct_answer: { value: "false" },
    explanation: "O Salmo 100 é um salmo de ação de graças e louvor, não de lamentação."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Servi", "ao", "Senhor", "com", "alegria"],
      reference: "Salmo 100:2"
    },
    correct_answer: { order: ["Servi", "ao", "Senhor", "com", "alegria"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Portas", "Átrios", "Misericórdia", "Nós"],
      right: ["Ação de graças", "Louvor", "Dura para sempre", "Ovelhas do pasto"]
    },
    correct_answer: {
      pairs: {
        "Portas" => "Ação de graças",
        "Átrios" => "Louvor",
        "Misericórdia" => "Dura para sempre",
        "Nós" => "Ovelhas do pasto"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "Complete: 'Entrai pelas portas dele com ação de graças...'",
      options: [
        "...e em seus átrios com louvor",
        "...e em seu templo com ofertas",
        "...e diante dele com sacrifícios",
        "...e em sua presença com temor"
      ],
      reference: "Salmo 100:4"
    },
    correct_answer: { value: "...e em seus átrios com louvor" }
  }
])

puts "  Salmos expandido: +2 lições"

# ============================================
# PROVÉRBIOS - 2 novas lições
# ============================================

proverbios = Track.find_by(slug: "proverbios")
unit_sabedoria = proverbios.units.find_by(name: "Sabedoria")

puts "  Criando: A Mulher Virtuosa..."
lesson_mulher = unit_sabedoria.lessons.create!(
  name: "A Mulher Virtuosa",
  description: "O elogio à mulher sábia - Provérbios 31:10-31",
  position: 1,
  xp_reward: 15
)

lesson_mulher.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O valor da mulher virtuosa supera o de quê?",
      options: ["Rubis", "Ouro", "Prata", "Diamantes"]
    },
    correct_answer: { value: "Rubis" },
    explanation: "O seu valor muito excede o de rubis (Provérbios 31:10)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que a mulher virtuosa não come?",
      options: ["O pão da preguiça", "Comida estragada", "Alimentos impuros", "Carne de porco"]
    },
    correct_answer: { value: "O pão da preguiça" },
    explanation: "Não come o pão da preguiça (Provérbios 31:27)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Segundo Provérbios 31, o que é enganoso?",
      options: ["A beleza", "A riqueza", "O poder", "A fama"]
    },
    correct_answer: { value: "A beleza" },
    explanation: "Enganosa é a graça, e vã a formosura (Provérbios 31:30)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "A mulher que teme ao ___ essa será louvada",
      word_bank: ["Senhor", "marido", "rei", "povo"],
      reference: "Provérbios 31:30"
    },
    correct_answer: { value: "Senhor" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Abre a boca com ___",
      word_bank: ["sabedoria", "alegria", "cuidado", "autoridade"],
      reference: "Provérbios 31:26"
    },
    correct_answer: { value: "sabedoria" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Os filhos da mulher virtuosa levantam-se e a chamam bem-aventurada",
      reference: "Provérbios 31:28"
    },
    correct_answer: { value: "true" }
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "A mulher virtuosa é preguiçosa e dorme até tarde",
      reference: "Provérbios 31:15"
    },
    correct_answer: { value: "false" },
    explanation: "Ela se levanta ainda de noite e dá de comer à sua casa (Provérbios 31:15)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Mulher", "virtuosa", "quem", "a", "achará"],
      reference: "Provérbios 31:10"
    },
    correct_answer: { order: ["Mulher", "virtuosa", "quem", "a", "achará"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Valor", "Boca", "Beleza", "Temor ao Senhor"],
      right: ["Excede rubis", "Abre com sabedoria", "É enganosa", "Merece louvor"]
    },
    correct_answer: {
      pairs: {
        "Valor" => "Excede rubis",
        "Boca" => "Abre com sabedoria",
        "Beleza" => "É enganosa",
        "Temor ao Senhor" => "Merece louvor"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "Complete: 'Enganosa é a graça, e vã a formosura...'",
      options: [
        "...mas a mulher que teme ao Senhor, essa será louvada",
        "...mas a mulher sábia terá riquezas",
        "...mas a mulher trabalhadora será honrada",
        "...mas a mulher humilde será exaltada"
      ],
      reference: "Provérbios 31:30"
    },
    correct_answer: { value: "...mas a mulher que teme ao Senhor, essa será louvada" }
  }
])

puts "  Criando: Confiança no Senhor..."
lesson_confianca = unit_sabedoria.lessons.create!(
  name: "Confiança no Senhor",
  description: "Confiar em Deus de todo coração - Provérbios 3:5-6",
  position: 2,
  xp_reward: 15
)

lesson_confianca.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Em quem devemos confiar de todo o coração?",
      options: ["No Senhor", "Em nós mesmos", "Nos amigos", "No dinheiro"]
    },
    correct_answer: { value: "No Senhor" },
    explanation: "Confia no Senhor de todo o teu coração (Provérbios 3:5)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Em que não devemos nos estribar?",
      options: ["No próprio entendimento", "Na força física", "Na riqueza", "Na beleza"]
    },
    correct_answer: { value: "No próprio entendimento" },
    explanation: "E não te estribes no teu próprio entendimento (Provérbios 3:5)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que Deus fará se O reconhecermos em todos os nossos caminhos?",
      options: ["Endireitará as nossas veredas", "Nos dará riquezas", "Nos tornará famosos", "Nos livrará de todo mal"]
    },
    correct_answer: { value: "Endireitará as nossas veredas" },
    explanation: "Reconhece-o em todos os teus caminhos, e ele endireitará as tuas veredas (Provérbios 3:6)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Confia no Senhor de todo o teu ___",
      word_bank: ["coração", "ser", "espírito", "corpo"],
      reference: "Provérbios 3:5"
    },
    correct_answer: { value: "coração" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Reconhece-o em todos os teus ___",
      word_bank: ["caminhos", "planos", "sonhos", "desejos"],
      reference: "Provérbios 3:6"
    },
    correct_answer: { value: "caminhos" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Provérbios 3:5 ensina que devemos confiar em nossa própria sabedoria",
      reference: "Provérbios 3:5"
    },
    correct_answer: { value: "false" },
    explanation: "O versículo ensina o oposto: não devemos nos estribar no nosso próprio entendimento."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Devemos reconhecer a Deus em todos os nossos caminhos, não apenas nos difíceis",
      reference: "Provérbios 3:6"
    },
    correct_answer: { value: "true" },
    explanation: "O texto diz 'em todos os teus caminhos', sem exceção."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Confia", "no", "Senhor", "de", "todo", "o", "teu", "coração"],
      reference: "Provérbios 3:5"
    },
    correct_answer: { order: ["Confia", "no", "Senhor", "de", "todo", "o", "teu", "coração"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Confiança", "Não se estribar", "Reconhecer a Deus", "Deus endireitará"],
      right: ["No Senhor", "No próprio entendimento", "Em todos os caminhos", "As veredas"]
    },
    correct_answer: {
      pairs: {
        "Confiança" => "No Senhor",
        "Não se estribar" => "No próprio entendimento",
        "Reconhecer a Deus" => "Em todos os caminhos",
        "Deus endireitará" => "As veredas"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "Complete: 'Reconhece-o em todos os teus caminhos...'",
      options: [
        "...e ele endireitará as tuas veredas",
        "...e ele te dará paz",
        "...e ele te abençoará",
        "...e ele responderá tuas orações"
      ],
      reference: "Provérbios 3:6"
    },
    correct_answer: { value: "...e ele endireitará as tuas veredas" }
  }
])

puts "  Provérbios expandido: +2 lições"

# ============================================
# NOVO TESTAMENTO - Expansão (4 novas unidades)
# ============================================

puts "\n=== Criando Novas Unidades do Novo Testamento ==="

# Unidade 4: Parábolas de Jesus
puts "  Criando nova unidade: Parábolas de Jesus..."
unit_parabolas = nt.units.create!(
  name: "Parábolas de Jesus",
  description: "As histórias que Jesus contava para ensinar",
  icon: "📖",
  position: 3
)

# Lição 1: O Bom Samaritano
puts "    Criando: O Bom Samaritano..."
lesson_samaritano = unit_parabolas.lessons.create!(
  name: "O Bom Samaritano",
  description: "A parábola sobre amar o próximo - Lucas 10:25-37",
  position: 0,
  xp_reward: 15
)

lesson_samaritano.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quem fez a pergunta 'Quem é o meu próximo?' a Jesus?",
      options: ["Um doutor da lei", "Um fariseu", "Um discípulo", "Um saduceu"]
    },
    correct_answer: { value: "Um doutor da lei" },
    explanation: "Um doutor da lei se levantou para tentar Jesus, perguntando o que deveria fazer para herdar a vida eterna (Lucas 10:25)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Por onde o homem que foi assaltado estava viajando?",
      options: ["De Jerusalém para Jericó", "De Jericó para Jerusalém", "De Nazaré para Cafarnaum", "De Belém para Jerusalém"]
    },
    correct_answer: { value: "De Jerusalém para Jericó" },
    explanation: "Um homem descia de Jerusalém para Jericó quando caiu nas mãos de salteadores (Lucas 10:30)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quem passou primeiro pelo homem ferido sem ajudá-lo?",
      options: ["Um sacerdote", "Um levita", "Um samaritano", "Um fariseu"]
    },
    correct_answer: { value: "Um sacerdote" },
    explanation: "Um sacerdote passou pelo mesmo caminho e, vendo-o, passou de largo (Lucas 10:31)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "O samaritano, vendo-o, moveu-se de ___",
      word_bank: ["compaixão", "medo", "curiosidade", "raiva"],
      reference: "Lucas 10:33"
    },
    correct_answer: { value: "compaixão" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Vai, e faz tu da mesma ___",
      word_bank: ["maneira", "forma", "ação", "vontade"],
      reference: "Lucas 10:37"
    },
    correct_answer: { value: "maneira" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O levita parou para ajudar o homem ferido",
      reference: "Lucas 10:32"
    },
    correct_answer: { value: "false" },
    explanation: "O levita também passou de largo, assim como o sacerdote."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "O samaritano pagou a hospedaria para cuidar do homem ferido",
      reference: "Lucas 10:35"
    },
    correct_answer: { value: "true" },
    explanation: "O samaritano deu dois denários ao hospedeiro e prometeu pagar qualquer despesa adicional."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Amarás", "o", "teu", "próximo", "como", "a", "ti", "mesmo"],
      reference: "Lucas 10:27"
    },
    correct_answer: { order: ["Amarás", "o", "teu", "próximo", "como", "a", "ti", "mesmo"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Sacerdote", "Levita", "Samaritano", "Hospedeiro"],
      right: ["Passou de largo primeiro", "Também não ajudou", "Teve compaixão", "Cuidou do ferido"]
    },
    correct_answer: {
      pairs: {
        "Sacerdote" => "Passou de largo primeiro",
        "Levita" => "Também não ajudou",
        "Samaritano" => "Teve compaixão",
        "Hospedeiro" => "Cuidou do ferido"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "O Bom Samaritano",
      events: [
        "Um homem é assaltado na estrada",
        "Um sacerdote passa e não ajuda",
        "Um levita passa e não ajuda",
        "Um samaritano vê e tem compaixão",
        "O samaritano cuida das feridas",
        "O samaritano leva o homem à hospedaria"
      ]
    },
    correct_answer: { order: [
      "Um homem é assaltado na estrada",
      "Um sacerdote passa e não ajuda",
      "Um levita passa e não ajuda",
      "Um samaritano vê e tem compaixão",
      "O samaritano cuida das feridas",
      "O samaritano leva o homem à hospedaria"
    ] }
  }
])

# Lição 2: O Filho Pródigo
puts "    Criando: O Filho Pródigo..."
lesson_prodigo = unit_parabolas.lessons.create!(
  name: "O Filho Pródigo",
  description: "A parábola do pai amoroso - Lucas 15:11-32",
  position: 1,
  xp_reward: 15
)

lesson_prodigo.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que o filho mais novo pediu ao pai?",
      options: ["Sua parte da herança", "Permissão para viajar", "Dinheiro emprestado", "Uma casa própria"]
    },
    correct_answer: { value: "Sua parte da herança" },
    explanation: "O filho mais novo pediu ao pai a parte dos bens que lhe pertencia (Lucas 15:12)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que o filho pródigo fez com sua herança?",
      options: ["Desperdiçou tudo", "Investiu sabiamente", "Guardou em segurança", "Dividiu com os pobres"]
    },
    correct_answer: { value: "Desperdiçou tudo" },
    explanation: "O filho desperdiçou todos os seus bens vivendo dissolutamente (Lucas 15:13)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Que trabalho o filho pródigo conseguiu quando ficou sem dinheiro?",
      options: ["Cuidar de porcos", "Trabalhar no campo", "Servir em uma casa", "Pescar no lago"]
    },
    correct_answer: { value: "Cuidar de porcos" },
    explanation: "Ele foi trabalhar para um cidadão que o mandou para seus campos para apascentar porcos (Lucas 15:15)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Pai, pequei contra o céu e perante ___",
      word_bank: ["ti", "todos", "Deus", "mim"],
      reference: "Lucas 15:21"
    },
    correct_answer: { value: "ti" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Este meu filho estava morto e ___",
      word_bank: ["reviveu", "voltou", "acordou", "apareceu"],
      reference: "Lucas 15:24"
    },
    correct_answer: { value: "reviveu" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O pai correu ao encontro do filho quando o viu voltando",
      reference: "Lucas 15:20"
    },
    correct_answer: { value: "true" },
    explanation: "Vendo-o ainda de longe, o pai encheu-se de compaixão e correu ao seu encontro."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "O irmão mais velho ficou feliz com a volta do irmão",
      reference: "Lucas 15:28"
    },
    correct_answer: { value: "false" },
    explanation: "O filho mais velho se indignou e não queria entrar na festa."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Estava", "morto", "e", "reviveu", "estava", "perdido", "e", "foi", "achado"],
      reference: "Lucas 15:24"
    },
    correct_answer: { order: ["Estava", "morto", "e", "reviveu", "estava", "perdido", "e", "foi", "achado"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Filho pródigo", "Pai", "Irmão mais velho", "Porcos"],
      right: ["Desperdiçou a herança", "Correu ao encontro", "Ficou irado", "Trabalho humilhante"]
    },
    correct_answer: {
      pairs: {
        "Filho pródigo" => "Desperdiçou a herança",
        "Pai" => "Correu ao encontro",
        "Irmão mais velho" => "Ficou irado",
        "Porcos" => "Trabalho humilhante"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "O Filho Pródigo",
      events: [
        "O filho pede sua herança",
        "O filho vai para uma terra distante",
        "O filho desperdiça tudo",
        "O filho passa fome e cuida de porcos",
        "O filho decide voltar para casa",
        "O pai o recebe com festa"
      ]
    },
    correct_answer: { order: [
      "O filho pede sua herança",
      "O filho vai para uma terra distante",
      "O filho desperdiça tudo",
      "O filho passa fome e cuida de porcos",
      "O filho decide voltar para casa",
      "O pai o recebe com festa"
    ] }
  }
])

# Lição 3: O Semeador
puts "    Criando: O Semeador..."
lesson_semeador = unit_parabolas.lessons.create!(
  name: "O Semeador",
  description: "A parábola das sementes - Mateus 13:1-23",
  position: 2,
  xp_reward: 15
)

lesson_semeador.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quantos tipos de solo são mencionados na parábola do semeador?",
      options: ["Quatro", "Três", "Cinco", "Dois"]
    },
    correct_answer: { value: "Quatro" },
    explanation: "Jesus menciona quatro tipos: beira do caminho, solo pedregoso, entre espinhos e boa terra (Mateus 13:4-8)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que aconteceu com a semente que caiu à beira do caminho?",
      options: ["As aves comeram", "O sol queimou", "Os espinhos sufocaram", "Produziu fruto"]
    },
    correct_answer: { value: "As aves comeram" },
    explanation: "Quando semeava, uma parte da semente caiu à beira do caminho, e vieram as aves e a comeram (Mateus 13:4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "A semente representa o quê, segundo Jesus?",
      options: ["A palavra do Reino", "O amor de Deus", "As bênçãos", "Os milagres"]
    },
    correct_answer: { value: "A palavra do Reino" },
    explanation: "A semente que caiu na boa terra representa quem ouve e compreende a palavra do Reino (Mateus 13:23)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "A semente que caiu em boa terra produziu a ___, a sessenta e a trinta por um",
      word_bank: ["cem", "mil", "dez", "cinquenta"],
      reference: "Mateus 13:8"
    },
    correct_answer: { value: "cem" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Quem tem ouvidos para ouvir, ___",
      word_bank: ["ouça", "entenda", "aprenda", "creia"],
      reference: "Mateus 13:9"
    },
    correct_answer: { value: "ouça" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "A semente que caiu entre espinhos produziu muito fruto",
      reference: "Mateus 13:7"
    },
    correct_answer: { value: "false" },
    explanation: "Os espinhos cresceram e sufocaram a semente."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "O solo pedregoso representa quem recebe a palavra com alegria, mas não tem raiz",
      reference: "Mateus 13:20-21"
    },
    correct_answer: { value: "true" },
    explanation: "A pessoa recebe a palavra com alegria, mas quando surge tribulação, logo se escandaliza."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Saiu", "o", "semeador", "a", "semear"],
      reference: "Mateus 13:3"
    },
    correct_answer: { order: ["Saiu", "o", "semeador", "a", "semear"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Beira do caminho", "Solo pedregoso", "Entre espinhos", "Boa terra"],
      right: ["Aves comem", "Sol queima", "Sufocado", "Produz fruto"]
    },
    correct_answer: {
      pairs: {
        "Beira do caminho" => "Aves comem",
        "Solo pedregoso" => "Sol queima",
        "Entre espinhos" => "Sufocado",
        "Boa terra" => "Produz fruto"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "O que representa o solo pedregoso na parábola?",
      options: [
        "Quem ouve mas não tem raiz em si mesmo",
        "Quem não entende a palavra",
        "Quem é sufocado pelas riquezas",
        "Quem produz fruto abundante"
      ],
      reference: "Mateus 13:20-21"
    },
    correct_answer: { value: "Quem ouve mas não tem raiz em si mesmo" }
  }
])

# Lição 4: A Ovelha Perdida
puts "    Criando: A Ovelha Perdida..."
lesson_ovelha = unit_parabolas.lessons.create!(
  name: "A Ovelha Perdida",
  description: "O pastor que busca a ovelha perdida - Lucas 15:1-7",
  position: 3,
  xp_reward: 15
)

lesson_ovelha.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quantas ovelhas o pastor tinha?",
      options: ["Cem", "Cinquenta", "Doze", "Mil"]
    },
    correct_answer: { value: "Cem" },
    explanation: "Jesus disse: 'Qual de vós que, tendo cem ovelhas e perdendo uma delas...' (Lucas 15:4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que o pastor fez quando encontrou a ovelha perdida?",
      options: ["Colocou-a nos ombros com alegria", "Puxou-a pelo pescoço", "Mandou-a voltar sozinha", "Castigou-a"]
    },
    correct_answer: { value: "Colocou-a nos ombros com alegria" },
    explanation: "Achando-a, põe-na sobre os ombros, cheio de júbilo (Lucas 15:5)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Por que Jesus contou essa parábola?",
      options: ["Porque fariseus criticavam que ele recebia pecadores", "Para ensinar sobre ovelhas", "Para entreter a multidão", "Para responder sobre impostos"]
    },
    correct_answer: { value: "Porque fariseus criticavam que ele recebia pecadores" },
    explanation: "Fariseus e escribas murmuravam: 'Este recebe pecadores e come com eles' (Lucas 15:2)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Há maior ___ no céu por um pecador que se arrepende",
      word_bank: ["alegria", "festa", "glória", "louvor"],
      reference: "Lucas 15:7"
    },
    correct_answer: { value: "alegria" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "O pastor deixa as noventa e nove no ___ e vai em busca da perdida",
      word_bank: ["deserto", "campo", "curral", "monte"],
      reference: "Lucas 15:4"
    },
    correct_answer: { value: "deserto" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O pastor convidou amigos e vizinhos para se alegrarem com ele",
      reference: "Lucas 15:6"
    },
    correct_answer: { value: "true" },
    explanation: "Ele reuniu os amigos e vizinhos dizendo: 'Alegrai-vos comigo, porque achei a minha ovelha perdida.'"
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Jesus disse que não há alegria no céu quando um pecador se arrepende",
      reference: "Lucas 15:7"
    },
    correct_answer: { value: "false" },
    explanation: "Jesus disse que há mais alegria no céu por um pecador que se arrepende."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Alegrai-vos", "comigo", "porque", "achei", "a", "minha", "ovelha", "perdida"],
      reference: "Lucas 15:6"
    },
    correct_answer: { order: ["Alegrai-vos", "comigo", "porque", "achei", "a", "minha", "ovelha", "perdida"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Pastor", "Ovelha perdida", "99 ovelhas", "Céu"],
      right: ["Busca até encontrar", "Representa o pecador", "Deixadas no deserto", "Alegria pelo arrependimento"]
    },
    correct_answer: {
      pairs: {
        "Pastor" => "Busca até encontrar",
        "Ovelha perdida" => "Representa o pecador",
        "99 ovelhas" => "Deixadas no deserto",
        "Céu" => "Alegria pelo arrependimento"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "O que causa mais alegria no céu?",
      options: [
        "Um pecador que se arrepende",
        "Noventa e nove justos",
        "Muitas ofertas no templo",
        "Grandes milagres"
      ],
      reference: "Lucas 15:7"
    },
    correct_answer: { value: "Um pecador que se arrepende" }
  }
])

# Lição 5: Os Talentos
puts "    Criando: Os Talentos..."
lesson_talentos = unit_parabolas.lessons.create!(
  name: "Os Talentos",
  description: "A parábola dos servos fiéis - Mateus 25:14-30",
  position: 4,
  xp_reward: 15
)

lesson_talentos.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quantos talentos o senhor deu ao primeiro servo?",
      options: ["Cinco", "Dez", "Três", "Um"]
    },
    correct_answer: { value: "Cinco" },
    explanation: "A um deu cinco talentos, a outro dois, e a outro um (Mateus 25:15)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que fez o servo que recebeu um talento?",
      options: ["Enterrou na terra", "Investiu", "Gastou tudo", "Devolveu ao senhor"]
    },
    correct_answer: { value: "Enterrou na terra" },
    explanation: "O que recebera um foi, cavou na terra e escondeu o dinheiro do seu senhor (Mateus 25:18)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Como o senhor chamou os servos que multiplicaram os talentos?",
      options: ["Servo bom e fiel", "Servo inteligente", "Servo rico", "Servo trabalhador"]
    },
    correct_answer: { value: "Servo bom e fiel" },
    explanation: "O senhor disse: 'Muito bem, servo bom e fiel!' (Mateus 25:21)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Sobre o pouco foste fiel, sobre o ___ te colocarei",
      word_bank: ["muito", "resto", "reino", "tesouro"],
      reference: "Mateus 25:21"
    },
    correct_answer: { value: "muito" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "A todo o que tem, dar-se-lhe-á, e terá em ___",
      word_bank: ["abundância", "dobro", "excesso", "multiplicação"],
      reference: "Mateus 25:29"
    },
    correct_answer: { value: "abundância" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O servo que recebeu dois talentos ganhou mais dois",
      reference: "Mateus 25:17"
    },
    correct_answer: { value: "true" },
    explanation: "Da mesma sorte, o que recebera dois ganhou também outros dois."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "O senhor elogiou o servo que enterrou o talento",
      reference: "Mateus 25:26"
    },
    correct_answer: { value: "false" },
    explanation: "O senhor o chamou de 'servo mau e negligente'."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Muito", "bem", "servo", "bom", "e", "fiel"],
      reference: "Mateus 25:21"
    },
    correct_answer: { order: ["Muito", "bem", "servo", "bom", "e", "fiel"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["5 talentos", "2 talentos", "1 talento", "Servo negligente"],
      right: ["Ganhou mais 5", "Ganhou mais 2", "Enterrou na terra", "Chamado de mau"]
    },
    correct_answer: {
      pairs: {
        "5 talentos" => "Ganhou mais 5",
        "2 talentos" => "Ganhou mais 2",
        "1 talento" => "Enterrou na terra",
        "Servo negligente" => "Chamado de mau"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "Os Talentos",
      events: [
        "O senhor viaja e entrega talentos aos servos",
        "Dois servos multiplicam seus talentos",
        "Um servo enterra seu talento",
        "O senhor retorna e pede contas",
        "Os servos fiéis são recompensados",
        "O servo negligente é punido"
      ]
    },
    correct_answer: { order: [
      "O senhor viaja e entrega talentos aos servos",
      "Dois servos multiplicam seus talentos",
      "Um servo enterra seu talento",
      "O senhor retorna e pede contas",
      "Os servos fiéis são recompensados",
      "O servo negligente é punido"
    ] }
  }
])

# Unidade 5: Milagres de Jesus
puts "  Criando nova unidade: Milagres de Jesus..."
unit_milagres = nt.units.create!(
  name: "Milagres de Jesus",
  description: "Os sinais e maravilhas de Cristo",
  icon: "✨",
  position: 4
)

# Lição 1: A Multiplicação dos Pães
puts "    Criando: A Multiplicação dos Pães..."
lesson_paes = unit_milagres.lessons.create!(
  name: "A Multiplicação dos Pães",
  description: "Jesus alimenta cinco mil - João 6:1-14",
  position: 0,
  xp_reward: 15
)

lesson_paes.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quantas pessoas Jesus alimentou com pães e peixes?",
      options: ["Cerca de cinco mil homens", "Cem pessoas", "Doze apóstolos", "Três mil pessoas"]
    },
    correct_answer: { value: "Cerca de cinco mil homens" },
    explanation: "Havia cerca de cinco mil homens, sem contar mulheres e crianças (João 6:10)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Quem tinha os pães e os peixes?",
      options: ["Um menino", "Pedro", "Um comerciante", "André"]
    },
    correct_answer: { value: "Um menino" },
    explanation: "André disse: 'Está aqui um menino que tem cinco pães de cevada e dois peixinhos' (João 6:9)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quantos cestos de sobras foram recolhidos?",
      options: ["Doze", "Cinco", "Sete", "Três"]
    },
    correct_answer: { value: "Doze" },
    explanation: "Recolheram e encheram doze cestos de pedaços dos cinco pães de cevada (João 6:13)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Jesus tomou os pães e, havendo dado ___, distribuiu-os",
      word_bank: ["graças", "ordens", "exemplo", "pedaços"],
      reference: "João 6:11"
    },
    correct_answer: { value: "graças" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Recolhei os pedaços que sobraram, para que nada se ___",
      word_bank: ["perca", "estrague", "acabe", "guarde"],
      reference: "João 6:12"
    },
    correct_answer: { value: "perca" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Havia muita erva no lugar onde as pessoas se assentaram",
      reference: "João 6:10"
    },
    correct_answer: { value: "true" },
    explanation: "Havia muita erva naquele lugar."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Após o milagre, o povo quis fazer Jesus rei à força",
      reference: "João 6:15"
    },
    correct_answer: { value: "true" },
    explanation: "Sabendo Jesus que viriam arrebatá-lo para o fazerem rei, tornou a retirar-se para o monte."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Recolhei", "os", "pedaços", "que", "sobraram"],
      reference: "João 6:12"
    },
    correct_answer: { order: ["Recolhei", "os", "pedaços", "que", "sobraram"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["5 pães", "2 peixes", "5000 homens", "12 cestos"],
      right: ["De cevada", "Pequenos", "Alimentados", "De sobras"]
    },
    correct_answer: {
      pairs: {
        "5 pães" => "De cevada",
        "2 peixes" => "Pequenos",
        "5000 homens" => "Alimentados",
        "12 cestos" => "De sobras"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "A Multiplicação dos Pães",
      events: [
        "Grande multidão segue Jesus",
        "Jesus pergunta onde comprar pão",
        "André menciona o menino com pães e peixes",
        "Jesus manda as pessoas se assentarem",
        "Jesus dá graças e distribui o alimento",
        "Doze cestos de sobras são recolhidos"
      ]
    },
    correct_answer: { order: [
      "Grande multidão segue Jesus",
      "Jesus pergunta onde comprar pão",
      "André menciona o menino com pães e peixes",
      "Jesus manda as pessoas se assentarem",
      "Jesus dá graças e distribui o alimento",
      "Doze cestos de sobras são recolhidos"
    ] }
  }
])

# Lição 2: Jesus Acalma a Tempestade
puts "    Criando: Jesus Acalma a Tempestade..."
lesson_tempestade = unit_milagres.lessons.create!(
  name: "Jesus Acalma a Tempestade",
  description: "O poder sobre a natureza - Marcos 4:35-41",
  position: 1,
  xp_reward: 15
)

lesson_tempestade.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que Jesus estava fazendo quando a tempestade começou?",
      options: ["Dormindo", "Orando", "Pescando", "Ensinando"]
    },
    correct_answer: { value: "Dormindo" },
    explanation: "Jesus estava na popa, dormindo sobre um travesseiro (Marcos 4:38)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que Jesus disse ao mar?",
      options: ["Cala-te, aquieta-te", "Para, tempestade", "Acalma-te, mar", "Silêncio, ondas"]
    },
    correct_answer: { value: "Cala-te, aquieta-te" },
    explanation: "Jesus repreendeu o vento e disse ao mar: 'Cala-te, aquieta-te!' (Marcos 4:39)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Como ficou o mar depois que Jesus falou?",
      options: ["Grande bonança", "Pequenas ondas", "Chuva leve", "Ventos fracos"]
    },
    correct_answer: { value: "Grande bonança" },
    explanation: "O vento se aquietou, e houve grande bonança (Marcos 4:39)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Por que sois assim ___? Ainda não tendes fé?",
      word_bank: ["tímidos", "fracos", "medrosos", "covardes"],
      reference: "Marcos 4:40"
    },
    correct_answer: { value: "tímidos" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Quem é este que até o vento e o mar lhe ___?",
      word_bank: ["obedecem", "temem", "respeitam", "servem"],
      reference: "Marcos 4:41"
    },
    correct_answer: { value: "obedecem" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Os discípulos acordaram Jesus porque tinham medo de morrer",
      reference: "Marcos 4:38"
    },
    correct_answer: { value: "true" },
    explanation: "Os discípulos disseram: 'Mestre, não te importa que pereçamos?'"
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "A tempestade demorou horas para se acalmar",
      reference: "Marcos 4:39"
    },
    correct_answer: { value: "false" },
    explanation: "Imediatamente após Jesus falar, o vento cessou e houve grande bonança."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Cala-te", "aquieta-te"],
      reference: "Marcos 4:39"
    },
    correct_answer: { order: ["Cala-te", "aquieta-te"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Jesus", "Discípulos", "Vento e mar", "Barco"],
      right: ["Dormia na popa", "Tinham medo", "Obedeceram", "Enchendo de água"]
    },
    correct_answer: {
      pairs: {
        "Jesus" => "Dormia na popa",
        "Discípulos" => "Tinham medo",
        "Vento e mar" => "Obedeceram",
        "Barco" => "Enchendo de água"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "O que Jesus perguntou aos discípulos após acalmar a tempestade?",
      options: [
        "Por que sois assim tímidos? Ainda não tendes fé?",
        "Por que me acordaram?",
        "Vocês não sabem nadar?",
        "Onde está vossa coragem?"
      ],
      reference: "Marcos 4:40"
    },
    correct_answer: { value: "Por que sois assim tímidos? Ainda não tendes fé?" }
  }
])

# Lição 3: A Ressurreição de Lázaro
puts "    Criando: A Ressurreição de Lázaro..."
lesson_lazaro = unit_milagres.lessons.create!(
  name: "A Ressurreição de Lázaro",
  description: "Jesus ressuscita seu amigo - João 11:1-44",
  position: 2,
  xp_reward: 15
)

lesson_lazaro.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quantos dias Lázaro estava morto quando Jesus chegou?",
      options: ["Quatro dias", "Três dias", "Uma semana", "Um dia"]
    },
    correct_answer: { value: "Quatro dias" },
    explanation: "Quando Jesus chegou, encontrou Lázaro já sepultado havia quatro dias (João 11:17)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Quem eram as irmãs de Lázaro?",
      options: ["Marta e Maria", "Maria e Salomé", "Marta e Joana", "Ana e Maria"]
    },
    correct_answer: { value: "Marta e Maria" },
    explanation: "Lázaro morava em Betânia com suas irmãs Marta e Maria (João 11:1)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Qual é o versículo mais curto da Bíblia, encontrado nesta história?",
      options: ["Jesus chorou", "Lázaro morreu", "Elas creram", "Vem e vê"]
    },
    correct_answer: { value: "Jesus chorou" },
    explanation: "Jesus chorou (João 11:35) é o versículo mais curto da Bíblia."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Eu sou a ressurreição e a ___",
      word_bank: ["vida", "verdade", "luz", "caminho"],
      reference: "João 11:25"
    },
    correct_answer: { value: "vida" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Lázaro, ___ para fora!",
      word_bank: ["vem", "sai", "levanta", "aparece"],
      reference: "João 11:43"
    },
    correct_answer: { value: "vem" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Marta disse que Lázaro ressuscitaria no último dia",
      reference: "João 11:24"
    },
    correct_answer: { value: "true" },
    explanation: "Marta respondeu: 'Eu sei que há de ressuscitar na ressurreição do último dia.'"
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Jesus chegou antes de Lázaro morrer",
      reference: "João 11:17"
    },
    correct_answer: { value: "false" },
    explanation: "Jesus demorou propositalmente e chegou quatro dias após a morte de Lázaro."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Eu", "sou", "a", "ressurreição", "e", "a", "vida"],
      reference: "João 11:25"
    },
    correct_answer: { order: ["Eu", "sou", "a", "ressurreição", "e", "a", "vida"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Lázaro", "Marta", "Maria", "Jesus"],
      right: ["Morto há 4 dias", "Foi ao encontro de Jesus", "Ficou em casa chorando", "Chorou junto ao túmulo"]
    },
    correct_answer: {
      pairs: {
        "Lázaro" => "Morto há 4 dias",
        "Marta" => "Foi ao encontro de Jesus",
        "Maria" => "Ficou em casa chorando",
        "Jesus" => "Chorou junto ao túmulo"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "A Ressurreição de Lázaro",
      events: [
        "Lázaro adoece",
        "As irmãs mandam avisar Jesus",
        "Jesus espera dois dias",
        "Jesus chega e Lázaro já morreu há 4 dias",
        "Jesus chora junto ao túmulo",
        "Jesus ordena: 'Lázaro, vem para fora!'"
      ]
    },
    correct_answer: { order: [
      "Lázaro adoece",
      "As irmãs mandam avisar Jesus",
      "Jesus espera dois dias",
      "Jesus chega e Lázaro já morreu há 4 dias",
      "Jesus chora junto ao túmulo",
      "Jesus ordena: 'Lázaro, vem para fora!'"
    ] }
  }
])

# Lição 4: Jesus Anda sobre as Águas
puts "    Criando: Jesus Anda sobre as Águas..."
lesson_aguas = unit_milagres.lessons.create!(
  name: "Jesus Anda sobre as Águas",
  description: "Pedro também caminha - Mateus 14:22-33",
  position: 3,
  xp_reward: 15
)

lesson_aguas.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Em que período do dia Jesus foi ao encontro dos discípulos andando sobre o mar?",
      options: ["Na quarta vigília da noite", "Ao meio-dia", "De manhã cedo", "No pôr do sol"]
    },
    correct_answer: { value: "Na quarta vigília da noite" },
    explanation: "Na quarta vigília da noite, foi Jesus ter com eles, andando sobre o mar (Mateus 14:25)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que os discípulos pensaram que Jesus era?",
      options: ["Um fantasma", "Um pescador", "Um anjo", "Um ladrão"]
    },
    correct_answer: { value: "Um fantasma" },
    explanation: "Os discípulos ficaram perturbados, dizendo: 'É um fantasma!' (Mateus 14:26)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Por que Pedro começou a afundar?",
      options: ["Porque teve medo", "Porque era pesado", "Porque as ondas eram grandes", "Porque não sabia nadar"]
    },
    correct_answer: { value: "Porque teve medo" },
    explanation: "Pedro, vendo o vento forte, teve medo e começou a afundar (Mateus 14:30)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Tende bom ânimo! Sou eu. Não ___!",
      word_bank: ["temais", "fujais", "duvidem", "orem"],
      reference: "Mateus 14:27"
    },
    correct_answer: { value: "temais" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Homem de pouca fé, por que ___?",
      word_bank: ["duvidaste", "temeste", "gritaste", "afundaste"],
      reference: "Mateus 14:31"
    },
    correct_answer: { value: "duvidaste" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Pedro conseguiu andar sobre as águas por um tempo",
      reference: "Mateus 14:29"
    },
    correct_answer: { value: "true" },
    explanation: "Pedro andou sobre as águas indo ao encontro de Jesus, antes de começar a afundar."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "O vento parou quando Jesus e Pedro entraram no barco",
      reference: "Mateus 14:32"
    },
    correct_answer: { value: "true" },
    explanation: "Subindo eles para o barco, o vento cessou."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Senhor", "salva-me"],
      reference: "Mateus 14:30"
    },
    correct_answer: { order: ["Senhor", "salva-me"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Jesus", "Pedro", "Discípulos", "Vento"],
      right: ["Andou sobre as águas", "Começou a afundar", "Pensaram ser fantasma", "Cessou no barco"]
    },
    correct_answer: {
      pairs: {
        "Jesus" => "Andou sobre as águas",
        "Pedro" => "Começou a afundar",
        "Discípulos" => "Pensaram ser fantasma",
        "Vento" => "Cessou no barco"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "O que os discípulos declararam depois que o vento parou?",
      options: [
        "Verdadeiramente és Filho de Deus",
        "Tu és o Messias prometido",
        "Grande é o Senhor",
        "Nunca vimos algo assim"
      ],
      reference: "Mateus 14:33"
    },
    correct_answer: { value: "Verdadeiramente és Filho de Deus" }
  }
])

# Lição 5: A Cura do Cego de Nascença
puts "    Criando: A Cura do Cego de Nascença..."
lesson_cego = unit_milagres.lessons.create!(
  name: "A Cura do Cego de Nascença",
  description: "Jesus dá vista ao cego - João 9:1-12",
  position: 4,
  xp_reward: 15
)

lesson_cego.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que Jesus usou para curar os olhos do cego?",
      options: ["Lodo feito com saliva", "Água do poço", "Azeite ungido", "Apenas palavras"]
    },
    correct_answer: { value: "Lodo feito com saliva" },
    explanation: "Jesus cuspiu na terra, fez lodo com a saliva e untou com o lodo os olhos do cego (João 9:6)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Onde Jesus mandou o cego lavar-se?",
      options: ["No tanque de Siloé", "No rio Jordão", "No mar da Galileia", "No templo"]
    },
    correct_answer: { value: "No tanque de Siloé" },
    explanation: "Jesus disse: 'Vai, lava-te no tanque de Siloé' (João 9:7)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que significa 'Siloé'?",
      options: ["Enviado", "Curado", "Abençoado", "Limpo"]
    },
    correct_answer: { value: "Enviado" },
    explanation: "Siloé significa 'Enviado' (João 9:7)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Enquanto estou no mundo, sou a ___ do mundo",
      word_bank: ["luz", "vida", "esperança", "salvação"],
      reference: "João 9:5"
    },
    correct_answer: { value: "luz" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Uma coisa sei: eu era cego e agora ___",
      word_bank: ["vejo", "creio", "louvo", "sigo"],
      reference: "João 9:25"
    },
    correct_answer: { value: "vejo" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O homem era cego desde o nascimento",
      reference: "João 9:1"
    },
    correct_answer: { value: "true" },
    explanation: "Jesus viu um homem cego de nascença."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Jesus disse que o homem era cego por causa dos pecados de seus pais",
      reference: "João 9:3"
    },
    correct_answer: { value: "false" },
    explanation: "Jesus disse que não foi por pecado dele nem de seus pais, mas para que se manifestassem as obras de Deus."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Eu", "era", "cego", "e", "agora", "vejo"],
      reference: "João 9:25"
    },
    correct_answer: { order: ["Eu", "era", "cego", "e", "agora", "vejo"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Lodo", "Siloé", "Cegueira", "Jesus"],
      right: ["Feito com saliva", "Significa Enviado", "Desde o nascimento", "Luz do mundo"]
    },
    correct_answer: {
      pairs: {
        "Lodo" => "Feito com saliva",
        "Siloé" => "Significa Enviado",
        "Cegueira" => "Desde o nascimento",
        "Jesus" => "Luz do mundo"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "A Cura do Cego de Nascença",
      events: [
        "Jesus vê o cego de nascença",
        "Discípulos perguntam quem pecou",
        "Jesus faz lodo com saliva",
        "Jesus unta os olhos do cego",
        "O cego vai ao tanque de Siloé",
        "O homem volta vendo"
      ]
    },
    correct_answer: { order: [
      "Jesus vê o cego de nascença",
      "Discípulos perguntam quem pecou",
      "Jesus faz lodo com saliva",
      "Jesus unta os olhos do cego",
      "O cego vai ao tanque de Siloé",
      "O homem volta vendo"
    ] }
  }
])

# Unidade 6: A Paixão de Cristo
puts "  Criando nova unidade: A Paixão de Cristo..."
unit_paixao = nt.units.create!(
  name: "A Paixão de Cristo",
  description: "Os últimos dias de Jesus na terra",
  icon: "✝️",
  position: 5
)

# Lição 1: A Entrada Triunfal
puts "    Criando: A Entrada Triunfal..."
lesson_entrada = unit_paixao.lessons.create!(
  name: "A Entrada Triunfal",
  description: "Jesus entra em Jerusalém - Mateus 21:1-11",
  position: 0,
  xp_reward: 15
)

lesson_entrada.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Em que animal Jesus entrou em Jerusalém?",
      options: ["Um jumento", "Um cavalo", "Um camelo", "Uma mula"]
    },
    correct_answer: { value: "Um jumento" },
    explanation: "Jesus montou num jumento, cumprindo a profecia de Zacarias (Mateus 21:7)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que o povo estendia no caminho de Jesus?",
      options: ["Vestes e ramos", "Tapetes vermelhos", "Flores", "Palhas"]
    },
    correct_answer: { value: "Vestes e ramos" },
    explanation: "A multidão estendia as suas vestes pelo caminho, e outros cortavam ramos de árvores (Mateus 21:8)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que o povo gritava?",
      options: ["Hosana ao Filho de Davi", "Viva o Rei", "Glória a Deus", "Salve o Messias"]
    },
    correct_answer: { value: "Hosana ao Filho de Davi" },
    explanation: "A multidão clamava: 'Hosana ao Filho de Davi! Bendito o que vem em nome do Senhor!' (Mateus 21:9)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Bendito o que vem em nome do ___",
      word_bank: ["Senhor", "Pai", "Altíssimo", "Rei"],
      reference: "Mateus 21:9"
    },
    correct_answer: { value: "Senhor" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Eis que o teu Rei aí te vem, ___ e montado em um jumento",
      word_bank: ["manso", "forte", "glorioso", "santo"],
      reference: "Mateus 21:5"
    },
    correct_answer: { value: "manso" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "A entrada de Jesus em Jerusalém cumpriu uma profecia do Antigo Testamento",
      reference: "Mateus 21:4-5"
    },
    correct_answer: { value: "true" },
    explanation: "Isso aconteceu para que se cumprisse o que foi dito pelo profeta Zacarias."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "A cidade de Jerusalém ficou indiferente à chegada de Jesus",
      reference: "Mateus 21:10"
    },
    correct_answer: { value: "false" },
    explanation: "Toda a cidade se alvoroçou perguntando: 'Quem é este?'"
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Hosana", "ao", "Filho", "de", "Davi"],
      reference: "Mateus 21:9"
    },
    correct_answer: { order: ["Hosana", "ao", "Filho", "de", "Davi"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Jumento", "Vestes", "Ramos", "Hosana"],
      right: ["Jesus montou", "Estendidas no chão", "Cortados das árvores", "Grito da multidão"]
    },
    correct_answer: {
      pairs: {
        "Jumento" => "Jesus montou",
        "Vestes" => "Estendidas no chão",
        "Ramos" => "Cortados das árvores",
        "Hosana" => "Grito da multidão"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "O que o povo respondia quando perguntavam 'Quem é este?'",
      options: [
        "Este é o profeta Jesus, de Nazaré da Galileia",
        "Este é o Messias prometido",
        "Este é o Filho de Deus",
        "Este é o Rei de Israel"
      ],
      reference: "Mateus 21:11"
    },
    correct_answer: { value: "Este é o profeta Jesus, de Nazaré da Galileia" }
  }
])

# Lição 2: A Última Ceia
puts "    Criando: A Última Ceia..."
lesson_ceia = unit_paixao.lessons.create!(
  name: "A Última Ceia",
  description: "Jesus institui a Santa Ceia - Mateus 26:17-30",
  position: 1,
  xp_reward: 15
)

lesson_ceia.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Em que festa judaica aconteceu a última ceia?",
      options: ["Páscoa", "Pentecostes", "Tabernáculos", "Purim"]
    },
    correct_answer: { value: "Páscoa" },
    explanation: "No primeiro dia da festa dos pães asmos, os discípulos prepararam a Páscoa (Mateus 26:17)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que Jesus disse que o pão representava?",
      options: ["Seu corpo", "A aliança", "O maná", "A vida"]
    },
    correct_answer: { value: "Seu corpo" },
    explanation: "Jesus tomou o pão e disse: 'Isto é o meu corpo' (Mateus 26:26)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que Jesus disse que o vinho representava?",
      options: ["Seu sangue da aliança", "A alegria do Reino", "A bênção de Deus", "O amor divino"]
    },
    correct_answer: { value: "Seu sangue da aliança" },
    explanation: "Jesus disse: 'Isto é o meu sangue, o sangue da aliança' (Mateus 26:28)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Isto é o meu sangue, derramado por muitos para ___ de pecados",
      word_bank: ["remissão", "perdão", "limpeza", "purificação"],
      reference: "Mateus 26:28"
    },
    correct_answer: { value: "remissão" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Em verdade vos digo que um de vós me ___",
      word_bank: ["trairá", "negará", "abandonará", "entregará"],
      reference: "Mateus 26:21"
    },
    correct_answer: { value: "trairá" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Jesus sabia que seria traído por um dos discípulos",
      reference: "Mateus 26:21"
    },
    correct_answer: { value: "true" },
    explanation: "Jesus disse: 'Em verdade vos digo que um de vós me trairá.'"
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Após a ceia, Jesus e os discípulos foram dormir",
      reference: "Mateus 26:30"
    },
    correct_answer: { value: "false" },
    explanation: "Tendo cantado um hino, saíram para o Monte das Oliveiras."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Fazei", "isto", "em", "memória", "de", "mim"],
      reference: "Lucas 22:19"
    },
    correct_answer: { order: ["Fazei", "isto", "em", "memória", "de", "mim"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Pão", "Vinho", "Judas", "Hino"],
      right: ["Corpo de Cristo", "Sangue da aliança", "O traidor", "Cantaram após a ceia"]
    },
    correct_answer: {
      pairs: {
        "Pão" => "Corpo de Cristo",
        "Vinho" => "Sangue da aliança",
        "Judas" => "O traidor",
        "Hino" => "Cantaram após a ceia"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "A Última Ceia",
      events: [
        "Discípulos preparam a Páscoa",
        "Jesus revela que será traído",
        "Jesus parte o pão e distribui",
        "Jesus abençoa o cálice de vinho",
        "Cantam um hino",
        "Vão para o Monte das Oliveiras"
      ]
    },
    correct_answer: { order: [
      "Discípulos preparam a Páscoa",
      "Jesus revela que será traído",
      "Jesus parte o pão e distribui",
      "Jesus abençoa o cálice de vinho",
      "Cantam um hino",
      "Vão para o Monte das Oliveiras"
    ] }
  }
])

# Lição 3: O Getsêmani
puts "    Criando: O Getsêmani..."
lesson_getsemani = unit_paixao.lessons.create!(
  name: "O Getsêmani",
  description: "Jesus ora no jardim - Mateus 26:36-46",
  position: 2,
  xp_reward: 15
)

lesson_getsemani.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quantas vezes Jesus orou no Getsêmani?",
      options: ["Três vezes", "Uma vez", "Sete vezes", "Duas vezes"]
    },
    correct_answer: { value: "Três vezes" },
    explanation: "Jesus orou três vezes usando as mesmas palavras (Mateus 26:44)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Quais discípulos Jesus levou mais perto para orar?",
      options: ["Pedro, Tiago e João", "Pedro, André e Filipe", "João, Judas e Tomé", "Tiago, João e Mateus"]
    },
    correct_answer: { value: "Pedro, Tiago e João" },
    explanation: "Jesus tomou consigo Pedro e os dois filhos de Zebedeu (Tiago e João) - Mateus 26:37."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que os discípulos fizeram enquanto Jesus orava?",
      options: ["Dormiram", "Oraram também", "Vigiaram", "Conversaram"]
    },
    correct_answer: { value: "Dormiram" },
    explanation: "Jesus encontrou os discípulos dormindo (Mateus 26:40)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Pai, se possível, passa de mim este ___",
      word_bank: ["cálice", "momento", "sofrimento", "destino"],
      reference: "Mateus 26:39"
    },
    correct_answer: { value: "cálice" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "O espírito está pronto, mas a ___ é fraca",
      word_bank: ["carne", "mente", "vontade", "força"],
      reference: "Mateus 26:41"
    },
    correct_answer: { value: "carne" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Jesus pediu que a vontade do Pai fosse feita, não a sua própria",
      reference: "Mateus 26:39"
    },
    correct_answer: { value: "true" },
    explanation: "Jesus disse: 'Todavia, não seja como eu quero, mas como tu queres.'"
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Jesus ficou alegre e confiante no Getsêmani",
      reference: "Mateus 26:37-38"
    },
    correct_answer: { value: "false" },
    explanation: "Jesus começou a entristecer-se e angustiar-se, dizendo que sua alma estava triste até a morte."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Não", "seja", "como", "eu", "quero", "mas", "como", "tu", "queres"],
      reference: "Mateus 26:39"
    },
    correct_answer: { order: ["Não", "seja", "como", "eu", "quero", "mas", "como", "tu", "queres"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Getsêmani", "Cálice", "Discípulos", "Jesus"],
      right: ["Jardim da oração", "Sofrimento a vir", "Dormindo", "Angustiado até a morte"]
    },
    correct_answer: {
      pairs: {
        "Getsêmani" => "Jardim da oração",
        "Cálice" => "Sofrimento a vir",
        "Discípulos" => "Dormindo",
        "Jesus" => "Angustiado até a morte"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "O que Jesus pediu aos discípulos?",
      options: [
        "Vigiai e orai para não cairdes em tentação",
        "Orem por mim nesta hora",
        "Fiquem alertas contra os inimigos",
        "Descansem enquanto eu oro"
      ],
      reference: "Mateus 26:41"
    },
    correct_answer: { value: "Vigiai e orai para não cairdes em tentação" }
  }
])

# Lição 4: A Crucificação
puts "    Criando: A Crucificação..."
lesson_crucificacao = unit_paixao.lessons.create!(
  name: "A Crucificação",
  description: "Jesus morre na cruz - Mateus 27:32-56",
  position: 3,
  xp_reward: 15
)

lesson_crucificacao.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quem foi obrigado a carregar a cruz de Jesus?",
      options: ["Simão de Cirene", "Pedro", "João", "José de Arimateia"]
    },
    correct_answer: { value: "Simão de Cirene" },
    explanation: "Os soldados obrigaram um homem chamado Simão, de Cirene, a carregar a cruz (Mateus 27:32)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que significa 'Gólgota'?",
      options: ["Lugar da Caveira", "Monte Santo", "Terra Sagrada", "Colina da Morte"]
    },
    correct_answer: { value: "Lugar da Caveira" },
    explanation: "Gólgota significa 'Lugar da Caveira' (Mateus 27:33)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que aconteceu no momento da morte de Jesus?",
      options: ["O véu do templo se rasgou", "Choveu muito forte", "Um terremoto destruiu a cidade", "O sol explodiu"]
    },
    correct_answer: { value: "O véu do templo se rasgou" },
    explanation: "O véu do templo se rasgou em duas partes, de alto a baixo (Mateus 27:51)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Eli, Eli, lamá sabactâni? (Deus meu, Deus meu, por que me ___?)",
      word_bank: ["desamparaste", "abandonaste", "esqueceste", "deixaste"],
      reference: "Mateus 27:46"
    },
    correct_answer: { value: "desamparaste" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Verdadeiramente este era ___ de Deus",
      word_bank: ["Filho", "servo", "enviado", "profeta"],
      reference: "Mateus 27:54"
    },
    correct_answer: { value: "Filho" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Houve trevas sobre toda a terra das 12h às 15h",
      reference: "Mateus 27:45"
    },
    correct_answer: { value: "true" },
    explanation: "Desde a hora sexta (12h) até a hora nona (15h) houve trevas sobre toda a terra."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Jesus foi crucificado sozinho, sem ninguém ao seu lado",
      reference: "Mateus 27:38"
    },
    correct_answer: { value: "false" },
    explanation: "Dois ladrões foram crucificados com ele, um à direita e outro à esquerda."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Pai", "perdoa-lhes", "porque", "não", "sabem", "o", "que", "fazem"],
      reference: "Lucas 23:34"
    },
    correct_answer: { order: ["Pai", "perdoa-lhes", "porque", "não", "sabem", "o", "que", "fazem"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Simão de Cirene", "Gólgota", "Véu do templo", "Centurião"],
      right: ["Carregou a cruz", "Lugar da Caveira", "Rasgou-se ao meio", "Declarou Jesus Filho de Deus"]
    },
    correct_answer: {
      pairs: {
        "Simão de Cirene" => "Carregou a cruz",
        "Gólgota" => "Lugar da Caveira",
        "Véu do templo" => "Rasgou-se ao meio",
        "Centurião" => "Declarou Jesus Filho de Deus"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "A Crucificação",
      events: [
        "Simão de Cirene carrega a cruz",
        "Jesus é crucificado no Gólgota",
        "Trevas cobrem a terra por 3 horas",
        "Jesus clama: 'Deus meu, por que me desamparaste?'",
        "Jesus morre e o véu do templo se rasga",
        "O centurião declara: 'Este era Filho de Deus'"
      ]
    },
    correct_answer: { order: [
      "Simão de Cirene carrega a cruz",
      "Jesus é crucificado no Gólgota",
      "Trevas cobrem a terra por 3 horas",
      "Jesus clama: 'Deus meu, por que me desamparaste?'",
      "Jesus morre e o véu do templo se rasga",
      "O centurião declara: 'Este era Filho de Deus'"
    ] }
  }
])

# Lição 5: A Ressurreição
puts "    Criando: A Ressurreição..."
lesson_ressurreicao = unit_paixao.lessons.create!(
  name: "A Ressurreição",
  description: "Jesus vence a morte - Mateus 28:1-10",
  position: 4,
  xp_reward: 15
)

lesson_ressurreicao.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quem foi ao túmulo de Jesus no primeiro dia da semana?",
      options: ["Maria Madalena e a outra Maria", "Pedro e João", "Os doze apóstolos", "José de Arimateia"]
    },
    correct_answer: { value: "Maria Madalena e a outra Maria" },
    explanation: "No primeiro dia da semana, Maria Madalena e a outra Maria foram ver o sepulcro (Mateus 28:1)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que aconteceu quando as mulheres chegaram ao túmulo?",
      options: ["Um anjo removeu a pedra", "A pedra já estava removida", "Pedro abriu o túmulo", "Os guardas abriram"]
    },
    correct_answer: { value: "Um anjo removeu a pedra" },
    explanation: "Houve um grande terremoto e um anjo do Senhor desceu do céu e removeu a pedra (Mateus 28:2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que o anjo disse às mulheres?",
      options: ["Ele não está aqui, ressuscitou", "Esperem aqui, ele virá", "Voltem para casa", "Chamem os guardas"]
    },
    correct_answer: { value: "Ele não está aqui, ressuscitou" },
    explanation: "O anjo disse: 'Não temais; sei que buscais Jesus, o crucificado. Ele não está aqui; ressuscitou' (Mateus 28:5-6)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Não temais! Ide dizer aos meus ___ que vão para a Galileia",
      word_bank: ["irmãos", "discípulos", "apóstolos", "amigos"],
      reference: "Mateus 28:10"
    },
    correct_answer: { value: "irmãos" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Vinde, vede o lugar onde o Senhor ___",
      word_bank: ["jazia", "dormia", "estava", "ficou"],
      reference: "Mateus 28:6"
    },
    correct_answer: { value: "jazia" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Os guardas ficaram como mortos de medo ao ver o anjo",
      reference: "Mateus 28:4"
    },
    correct_answer: { value: "true" },
    explanation: "Os guardas tremeram de medo e ficaram como mortos."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Jesus apareceu às mulheres no caminho",
      reference: "Mateus 28:9"
    },
    correct_answer: { value: "true" },
    explanation: "Eis que Jesus veio ao encontro delas e disse: 'Salve!'"
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Ele", "não", "está", "aqui", "ressuscitou"],
      reference: "Mateus 28:6"
    },
    correct_answer: { order: ["Ele", "não", "está", "aqui", "ressuscitou"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Anjo", "Pedra", "Guardas", "Mulheres"],
      right: ["Aparência de relâmpago", "Removida do túmulo", "Ficaram como mortos", "Foram avisar os discípulos"]
    },
    correct_answer: {
      pairs: {
        "Anjo" => "Aparência de relâmpago",
        "Pedra" => "Removida do túmulo",
        "Guardas" => "Ficaram como mortos",
        "Mulheres" => "Foram avisar os discípulos"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "A Ressurreição",
      events: [
        "As mulheres vão ao túmulo",
        "Um anjo remove a pedra",
        "O anjo anuncia: 'Ele ressuscitou!'",
        "As mulheres veem o túmulo vazio",
        "Jesus aparece às mulheres no caminho",
        "As mulheres vão contar aos discípulos"
      ]
    },
    correct_answer: { order: [
      "As mulheres vão ao túmulo",
      "Um anjo remove a pedra",
      "O anjo anuncia: 'Ele ressuscitou!'",
      "As mulheres veem o túmulo vazio",
      "Jesus aparece às mulheres no caminho",
      "As mulheres vão contar aos discípulos"
    ] }
  }
])

# Unidade 7: A Igreja Primitiva
puts "  Criando nova unidade: A Igreja Primitiva..."
unit_igreja = nt.units.create!(
  name: "A Igreja Primitiva",
  description: "O início da igreja cristã",
  icon: "🕊️",
  position: 6
)

# Lição 1: O Pentecostes
puts "    Criando: O Pentecostes..."
lesson_pentecostes = unit_igreja.lessons.create!(
  name: "O Pentecostes",
  description: "A descida do Espírito Santo - Atos 2:1-13",
  position: 0,
  xp_reward: 15
)

lesson_pentecostes.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que apareceu sobre os discípulos no Pentecostes?",
      options: ["Línguas de fogo", "Uma pomba", "Uma nuvem", "Uma luz brilhante"]
    },
    correct_answer: { value: "Línguas de fogo" },
    explanation: "Apareceram línguas repartidas, como que de fogo, e pousou uma sobre cada um deles (Atos 2:3)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que os discípulos começaram a fazer quando foram cheios do Espírito Santo?",
      options: ["Falar em outras línguas", "Cantar hinos", "Profetizar", "Curar enfermos"]
    },
    correct_answer: { value: "Falar em outras línguas" },
    explanation: "Todos ficaram cheios do Espírito Santo e começaram a falar noutras línguas (Atos 2:4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Que som veio do céu antes do Espírito Santo descer?",
      options: ["Como de um vento impetuoso", "Como de um trovão", "Como de uma trombeta", "Como de muitas águas"]
    },
    correct_answer: { value: "Como de um vento impetuoso" },
    explanation: "De repente veio do céu um som, como de um vento veemente e impetuoso (Atos 2:2)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Todos ficaram cheios do Espírito ___",
      word_bank: ["Santo", "de Deus", "divino", "celestial"],
      reference: "Atos 2:4"
    },
    correct_answer: { value: "Santo" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Estavam todos reunidos no mesmo ___",
      word_bank: ["lugar", "espírito", "propósito", "dia"],
      reference: "Atos 2:1"
    },
    correct_answer: { value: "lugar" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Pessoas de várias nações ouviram os discípulos falando em suas próprias línguas",
      reference: "Atos 2:6"
    },
    correct_answer: { value: "true" },
    explanation: "Cada um os ouvia falar na sua própria língua."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Algumas pessoas pensaram que os discípulos estavam embriagados",
      reference: "Atos 2:13"
    },
    correct_answer: { value: "true" },
    explanation: "Outros, porém, zombando, diziam: 'Estão cheios de mosto (vinho novo).'"
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Todos", "ficaram", "cheios", "do", "Espírito", "Santo"],
      reference: "Atos 2:4"
    },
    correct_answer: { order: ["Todos", "ficaram", "cheios", "do", "Espírito", "Santo"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Vento", "Línguas de fogo", "Outras línguas", "Multidão"],
      right: ["Som impetuoso", "Sobre cada um", "Falaram milagrosamente", "Ficou admirada"]
    },
    correct_answer: {
      pairs: {
        "Vento" => "Som impetuoso",
        "Línguas de fogo" => "Sobre cada um",
        "Outras línguas" => "Falaram milagrosamente",
        "Multidão" => "Ficou admirada"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "O Pentecostes",
      events: [
        "Discípulos reunidos no mesmo lugar",
        "Som como de vento impetuoso",
        "Línguas de fogo aparecem",
        "Todos ficam cheios do Espírito Santo",
        "Começam a falar em outras línguas",
        "Multidão se reúne admirada"
      ]
    },
    correct_answer: { order: [
      "Discípulos reunidos no mesmo lugar",
      "Som como de vento impetuoso",
      "Línguas de fogo aparecem",
      "Todos ficam cheios do Espírito Santo",
      "Começam a falar em outras línguas",
      "Multidão se reúne admirada"
    ] }
  }
])

# Lição 2: Pedro e João no Templo
puts "    Criando: Pedro e João no Templo..."
lesson_templo = unit_igreja.lessons.create!(
  name: "Pedro e João no Templo",
  description: "A cura do coxo - Atos 3:1-10",
  position: 1,
  xp_reward: 15
)

lesson_templo.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Onde o coxo ficava pedindo esmolas?",
      options: ["Na porta Formosa do templo", "Na entrada da cidade", "No mercado", "Na sinagoga"]
    },
    correct_answer: { value: "Na porta Formosa do templo" },
    explanation: "O homem era posto diariamente à porta do templo chamada Formosa (Atos 3:2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que Pedro disse que não tinha?",
      options: ["Prata e ouro", "Pão e água", "Roupas e sapatos", "Casa e terras"]
    },
    correct_answer: { value: "Prata e ouro" },
    explanation: "Pedro disse: 'Não tenho prata nem ouro, mas o que tenho, isso te dou' (Atos 3:6)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Em nome de quem Pedro curou o coxo?",
      options: ["Jesus Cristo, o Nazareno", "Deus Pai", "O Espírito Santo", "O Deus de Israel"]
    },
    correct_answer: { value: "Jesus Cristo, o Nazareno" },
    explanation: "Pedro disse: 'Em nome de Jesus Cristo, o Nazareno, levanta-te e anda' (Atos 3:6)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "O que tenho, isso te dou: Em nome de Jesus Cristo, levanta-te e ___",
      word_bank: ["anda", "caminha", "corre", "pula"],
      reference: "Atos 3:6"
    },
    correct_answer: { value: "anda" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "O coxo entrou no templo andando, saltando e ___ a Deus",
      word_bank: ["louvando", "agradecendo", "bendizendo", "glorificando"],
      reference: "Atos 3:8"
    },
    correct_answer: { value: "louvando" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O homem era coxo desde o nascimento",
      reference: "Atos 3:2"
    },
    correct_answer: { value: "true" },
    explanation: "Era trazido um homem coxo de nascença."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Pedro deu dinheiro ao coxo antes de curá-lo",
      reference: "Atos 3:6"
    },
    correct_answer: { value: "false" },
    explanation: "Pedro disse que não tinha prata nem ouro, mas deu-lhe cura em nome de Jesus."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Em", "nome", "de", "Jesus", "Cristo", "levanta-te", "e", "anda"],
      reference: "Atos 3:6"
    },
    correct_answer: { order: ["Em", "nome", "de", "Jesus", "Cristo", "levanta-te", "e", "anda"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Porta Formosa", "Pedro", "Coxo curado", "Nome de Jesus"],
      right: ["Entrada do templo", "Não tinha prata nem ouro", "Saltou e louvou a Deus", "Poder para curar"]
    },
    correct_answer: {
      pairs: {
        "Porta Formosa" => "Entrada do templo",
        "Pedro" => "Não tinha prata nem ouro",
        "Coxo curado" => "Saltou e louvou a Deus",
        "Nome de Jesus" => "Poder para curar"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "A Cura do Coxo",
      events: [
        "Pedro e João vão ao templo",
        "O coxo pede esmola",
        "Pedro diz que não tem prata nem ouro",
        "Pedro ordena: 'Em nome de Jesus, anda!'",
        "O homem é curado imediatamente",
        "O coxo entra no templo saltando e louvando"
      ]
    },
    correct_answer: { order: [
      "Pedro e João vão ao templo",
      "O coxo pede esmola",
      "Pedro diz que não tem prata nem ouro",
      "Pedro ordena: 'Em nome de Jesus, anda!'",
      "O homem é curado imediatamente",
      "O coxo entra no templo saltando e louvando"
    ] }
  }
])

# Lição 3: A Conversão de Paulo
puts "    Criando: A Conversão de Paulo..."
lesson_paulo = unit_igreja.lessons.create!(
  name: "A Conversão de Paulo",
  description: "Saulo encontra Jesus - Atos 9:1-19",
  position: 2,
  xp_reward: 15
)

lesson_paulo.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Para onde Saulo estava indo quando Jesus apareceu a ele?",
      options: ["Damasco", "Jerusalém", "Roma", "Antioquia"]
    },
    correct_answer: { value: "Damasco" },
    explanation: "Saulo ia a caminho de Damasco para prender cristãos (Atos 9:2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que aconteceu com Saulo quando viu a luz do céu?",
      options: ["Ficou cego", "Ficou surdo", "Desmaiou", "Correu"]
    },
    correct_answer: { value: "Ficou cego" },
    explanation: "Saulo ficou cego e teve que ser guiado pela mão até Damasco (Atos 9:8)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quem Deus enviou para curar a cegueira de Saulo?",
      options: ["Ananias", "Pedro", "Barnabé", "Filipe"]
    },
    correct_answer: { value: "Ananias" },
    explanation: "O Senhor mandou Ananias ir até Saulo e impor as mãos sobre ele (Atos 9:10-12)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Saulo, Saulo, por que me ___?",
      word_bank: ["persegues", "odeias", "rejeitas", "ignoras"],
      reference: "Atos 9:4"
    },
    correct_answer: { value: "persegues" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Este é para mim um ___ escolhido para levar meu nome",
      word_bank: ["vaso", "servo", "homem", "apóstolo"],
      reference: "Atos 9:15"
    },
    correct_answer: { value: "vaso" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Saulo ficou três dias sem comer nem beber",
      reference: "Atos 9:9"
    },
    correct_answer: { value: "true" },
    explanation: "Por três dias esteve sem ver, e não comeu nem bebeu."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Antes da conversão, Saulo ajudava os cristãos",
      reference: "Atos 9:1"
    },
    correct_answer: { value: "false" },
    explanation: "Saulo perseguia a igreja e buscava prender os cristãos."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Saulo", "Saulo", "por", "que", "me", "persegues"],
      reference: "Atos 9:4"
    },
    correct_answer: { order: ["Saulo", "Saulo", "por", "que", "me", "persegues"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Saulo", "Luz do céu", "Ananias", "Três dias"],
      right: ["Perseguidor da igreja", "Derrubou Saulo", "Curou a cegueira", "Sem comer nem beber"]
    },
    correct_answer: {
      pairs: {
        "Saulo" => "Perseguidor da igreja",
        "Luz do céu" => "Derrubou Saulo",
        "Ananias" => "Curou a cegueira",
        "Três dias" => "Sem comer nem beber"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "A Conversão de Saulo",
      events: [
        "Saulo vai a Damasco para prender cristãos",
        "Uma luz do céu brilha ao redor dele",
        "Jesus pergunta: 'Por que me persegues?'",
        "Saulo fica cego por três dias",
        "Ananias vai até Saulo e ora por ele",
        "Saulo recupera a visão e é batizado"
      ]
    },
    correct_answer: { order: [
      "Saulo vai a Damasco para prender cristãos",
      "Uma luz do céu brilha ao redor dele",
      "Jesus pergunta: 'Por que me persegues?'",
      "Saulo fica cego por três dias",
      "Ananias vai até Saulo e ora por ele",
      "Saulo recupera a visão e é batizado"
    ] }
  }
])

# Lição 4: Paulo e Silas na Prisão
puts "    Criando: Paulo e Silas na Prisão..."
lesson_prisao = unit_igreja.lessons.create!(
  name: "Paulo e Silas na Prisão",
  description: "Louvor na prisão - Atos 16:16-34",
  position: 3,
  xp_reward: 15
)

lesson_prisao.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que Paulo e Silas faziam à meia-noite na prisão?",
      options: ["Oravam e cantavam hinos", "Dormiam", "Planejavam fugir", "Choravam"]
    },
    correct_answer: { value: "Oravam e cantavam hinos" },
    explanation: "Por volta da meia-noite, Paulo e Silas oravam e cantavam hinos a Deus (Atos 16:25)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que abriu as portas da prisão?",
      options: ["Um terremoto", "Um anjo", "Os guardas", "Uma chave milagrosa"]
    },
    correct_answer: { value: "Um terremoto" },
    explanation: "De repente houve um grande terremoto que sacudiu os alicerces da prisão (Atos 16:26)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que o carcereiro perguntou a Paulo e Silas?",
      options: ["O que devo fazer para ser salvo?", "Por que não fugiram?", "Quem são vocês?", "Que terremoto foi esse?"]
    },
    correct_answer: { value: "O que devo fazer para ser salvo?" },
    explanation: "O carcereiro perguntou: 'Senhores, que devo fazer para ser salvo?' (Atos 16:30)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Crê no Senhor Jesus e serás ___, tu e a tua casa",
      word_bank: ["salvo", "curado", "liberto", "abençoado"],
      reference: "Atos 16:31"
    },
    correct_answer: { value: "salvo" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Paulo gritou: Não te faças nenhum mal, pois todos estamos ___",
      word_bank: ["aqui", "vivos", "salvos", "juntos"],
      reference: "Atos 16:28"
    },
    correct_answer: { value: "aqui" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O carcereiro e sua família foram batizados na mesma noite",
      reference: "Atos 16:33"
    },
    correct_answer: { value: "true" },
    explanation: "Naquela mesma hora da noite, o carcereiro foi batizado com toda sua família."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Paulo e Silas fugiram quando as portas se abriram",
      reference: "Atos 16:28"
    },
    correct_answer: { value: "false" },
    explanation: "Nenhum dos prisioneiros fugiu. Paulo impediu o carcereiro de se matar, dizendo que todos estavam ali."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Crê", "no", "Senhor", "Jesus", "e", "serás", "salvo"],
      reference: "Atos 16:31"
    },
    correct_answer: { order: ["Crê", "no", "Senhor", "Jesus", "e", "serás", "salvo"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Meia-noite", "Terremoto", "Carcereiro", "Batismo"],
      right: ["Oração e louvor", "Abriu as portas", "Converteu-se", "Toda a família"]
    },
    correct_answer: {
      pairs: {
        "Meia-noite" => "Oração e louvor",
        "Terremoto" => "Abriu as portas",
        "Carcereiro" => "Converteu-se",
        "Batismo" => "Toda a família"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 15,
    content: {
      title: "Paulo e Silas na Prisão",
      events: [
        "Paulo e Silas são presos em Filipos",
        "À meia-noite oram e cantam hinos",
        "Um terremoto sacode a prisão",
        "As portas se abrem e as cadeias se soltam",
        "O carcereiro pergunta como ser salvo",
        "O carcereiro e sua família são batizados"
      ]
    },
    correct_answer: { order: [
      "Paulo e Silas são presos em Filipos",
      "À meia-noite oram e cantam hinos",
      "Um terremoto sacode a prisão",
      "As portas se abrem e as cadeias se soltam",
      "O carcereiro pergunta como ser salvo",
      "O carcereiro e sua família são batizados"
    ] }
  }
])

# Lição 5: A Armadura de Deus
puts "    Criando: A Armadura de Deus..."
lesson_armadura = unit_igreja.lessons.create!(
  name: "A Armadura de Deus",
  description: "A proteção espiritual do cristão - Efésios 6:10-18",
  position: 4,
  xp_reward: 15
)

lesson_armadura.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Contra quem lutamos, segundo Efésios 6?",
      options: ["Principados e potestades", "Pessoas más", "Governos injustos", "Inimigos visíveis"]
    },
    correct_answer: { value: "Principados e potestades" },
    explanation: "Nossa luta não é contra carne e sangue, mas contra principados, potestades e hostes espirituais da maldade (Efésios 6:12)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que é o cinto da armadura de Deus?",
      options: ["A verdade", "A fé", "A salvação", "A justiça"]
    },
    correct_answer: { value: "A verdade" },
    explanation: "Cingi-vos com a verdade (Efésios 6:14)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que é a espada do Espírito?",
      options: ["A palavra de Deus", "A oração", "O louvor", "A fé"]
    },
    correct_answer: { value: "A palavra de Deus" },
    explanation: "A espada do Espírito é a palavra de Deus (Efésios 6:17)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Calçai os pés com a preparação do evangelho da ___",
      word_bank: ["paz", "salvação", "graça", "vida"],
      reference: "Efésios 6:15"
    },
    correct_answer: { value: "paz" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "O escudo da ___ pode apagar os dardos inflamados do maligno",
      word_bank: ["fé", "esperança", "verdade", "justiça"],
      reference: "Efésios 6:16"
    },
    correct_answer: { value: "fé" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O capacete representa a salvação",
      reference: "Efésios 6:17"
    },
    correct_answer: { value: "true" },
    explanation: "Tomai o capacete da salvação."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "A couraça da armadura de Deus é a fé",
      reference: "Efésios 6:14"
    },
    correct_answer: { value: "false" },
    explanation: "A couraça é a justiça (Efésios 6:14)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Revesti-vos", "de", "toda", "a", "armadura", "de", "Deus"],
      reference: "Efésios 6:11"
    },
    correct_answer: { order: ["Revesti-vos", "de", "toda", "a", "armadura", "de", "Deus"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Cinto", "Couraça", "Escudo", "Capacete"],
      right: ["Verdade", "Justiça", "Fé", "Salvação"]
    },
    correct_answer: {
      pairs: {
        "Cinto" => "Verdade",
        "Couraça" => "Justiça",
        "Escudo" => "Fé",
        "Capacete" => "Salvação"
      }
    }
  },
  {
    exercise_type: :choose_verse,
    position: 9,
    xp_value: 15,
    content: {
      question: "Por que devemos vestir toda a armadura de Deus?",
      options: [
        "Para poder resistir no dia mau",
        "Para parecer fortes",
        "Para impressionar os outros",
        "Para ganhar batalhas físicas"
      ],
      reference: "Efésios 6:13"
    },
    correct_answer: { value: "Para poder resistir no dia mau" }
  }
])

puts "  Novo Testamento expandido: +4 unidades, +20 lições, +200 exercícios"

# ============================================
# RESUMO FINAL
# ============================================

puts "\n=== Resumo das Lições Expandidas ==="
puts "  Novo Testamento: +4 lições originais (40 exercícios)"
puts "  Novo Testamento: +4 unidades novas, +20 lições (200 exercícios)"
puts "  Antigo Testamento: +2 lições (20 exercícios)"
puts "  Salmos: +2 lições (20 exercícios)"
puts "  Provérbios: +2 lições (20 exercícios)"
puts "  Total: +30 lições, +300 exercícios"
puts "\nLições expandidas criadas com sucesso!"

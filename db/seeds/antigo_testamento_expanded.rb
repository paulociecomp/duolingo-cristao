# frozen_string_literal: true

# Expanded Old Testament Seed File
# Adds 6 new units with 23 lessons and 230 exercises
#
# Distribution per lesson (10 exercises):
# - multiple_choice: 3x (10 XP each)
# - fill_blank: 2x (10 XP each)
# - true_false: 2x (10 XP each)
# - order_words: 1x (15 XP)
# - connect_pairs: 1x (15 XP)
# - sequence_story: 1x (20 XP)

puts "\n=== Criando Expansão do Antigo Testamento ==="

at = Track.find_by(slug: "antigo-testamento")

# ============================================
# UNIDADE 2: OS PATRIARCAS (icon: 👨‍👩‍👦)
# Cobrindo Gênesis 6-27
# ============================================

puts "Criando Unidade: Os Patriarcas..."
unit_patriarcas = at.units.create!(
  name: "Os Patriarcas",
  description: "De Noé a Jacó - a história dos pais da fé",
  icon: "👨‍👩‍👦",
  position: 1
)

# LIÇÃO 1: Noé e o Dilúvio (Gênesis 6-9)
puts "  Criando: Noé e o Dilúvio..."
lesson_noe = unit_patriarcas.lessons.create!(
  name: "Noé e o Dilúvio",
  description: "Deus salva Noé e sua família através da arca - Gênesis 6-9",
  position: 0,
  xp_reward: 15
)

lesson_noe.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Por que Deus decidiu enviar o dilúvio sobre a terra?",
      options: ["Por causa da maldade dos homens", "Para criar novos oceanos", "Por causa de uma seca", "Para punir os animais"]
    },
    correct_answer: { value: "Por causa da maldade dos homens" },
    explanation: "A Bíblia diz que 'viu o Senhor que a maldade do homem se multiplicara sobre a terra' (Gênesis 6:5)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Quantos dias e noites choveu durante o dilúvio?",
      options: ["40 dias e 40 noites", "7 dias e 7 noites", "100 dias e 100 noites", "30 dias e 30 noites"]
    },
    correct_answer: { value: "40 dias e 40 noites" },
    explanation: "Houve chuva sobre a terra quarenta dias e quarenta noites (Gênesis 7:12)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Qual ave Noé soltou primeiro para ver se as águas tinham baixado?",
      options: ["Corvo", "Pomba", "Águia", "Andorinha"]
    },
    correct_answer: { value: "Corvo" },
    explanation: "Noé soltou primeiro um corvo, que ficou voando até secar as águas (Gênesis 8:7)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Noé era homem ___ e íntegro entre os seus contemporâneos",
      word_bank: ["justo", "rico", "forte", "sábio"],
      reference: "Gênesis 6:9"
    },
    correct_answer: { value: "justo" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "A pomba voltou com uma folha de ___ no bico",
      word_bank: ["oliveira", "figueira", "videira", "palmeira"],
      reference: "Gênesis 8:11"
    },
    correct_answer: { value: "oliveira" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Noé tinha três filhos: Sem, Cam e Jafé",
      reference: "Gênesis 6:10"
    },
    correct_answer: { value: "true" },
    explanation: "Noé gerou três filhos: Sem, Cam e Jafé, que entraram na arca com suas esposas."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Noé levou apenas dois animais de cada espécie para a arca",
      reference: "Gênesis 7:2-3"
    },
    correct_answer: { value: "false" },
    explanation: "Dos animais limpos, Noé levou sete casais; dos imundos, apenas um casal (Gênesis 7:2-3)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["o", "meu", "arco", "nas", "nuvens", "Porei"],
      reference: "Gênesis 9:13"
    },
    correct_answer: { order: ["Porei", "o", "meu", "arco", "nas", "nuvens"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Corvo", "Pomba", "Arco-íris", "Arca"],
      right: ["Primeira ave solta", "Trouxe folha de oliveira", "Sinal da aliança", "Salvação de Noé"]
    },
    correct_answer: {
      pairs: {
        "Corvo" => "Primeira ave solta",
        "Pomba" => "Trouxe folha de oliveira",
        "Arco-íris" => "Sinal da aliança",
        "Arca" => "Salvação de Noé"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "A História do Dilúvio",
      events: [
        "Deus manda Noé construir a arca",
        "Noé entra na arca com sua família e os animais",
        "Chove 40 dias e 40 noites",
        "Noé solta o corvo e depois a pomba",
        "A pomba volta com uma folha de oliveira",
        "Deus faz aliança com Noé através do arco-íris"
      ]
    },
    correct_answer: { order: [
      "Deus manda Noé construir a arca",
      "Noé entra na arca com sua família e os animais",
      "Chove 40 dias e 40 noites",
      "Noé solta o corvo e depois a pomba",
      "A pomba volta com uma folha de oliveira",
      "Deus faz aliança com Noé através do arco-íris"
    ] }
  }
])

# LIÇÃO 2: A Torre de Babel (Gênesis 11)
puts "  Criando: A Torre de Babel..."
lesson_babel = unit_patriarcas.lessons.create!(
  name: "A Torre de Babel",
  description: "A confusão das línguas e a dispersão dos povos - Gênesis 11",
  position: 1,
  xp_reward: 15
)

lesson_babel.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Por que os homens queriam construir uma torre que chegasse até o céu?",
      options: ["Para ficarem famosos e não se espalharem", "Para escapar de outro dilúvio", "Para adorar a Deus", "Para ver as estrelas"]
    },
    correct_answer: { value: "Para ficarem famosos e não se espalharem" },
    explanation: "Disseram: 'Façamo-nos um nome, para que não sejamos espalhados sobre a face de toda a terra' (Gênesis 11:4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que Deus fez para impedir a construção da torre?",
      options: ["Confundiu as línguas dos homens", "Destruiu a torre com fogo", "Enviou outro dilúvio", "Derrubou com um terremoto"]
    },
    correct_answer: { value: "Confundiu as línguas dos homens" },
    explanation: "O Senhor confundiu a linguagem de toda a terra (Gênesis 11:7-9)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Do que eram feitos os tijolos usados na construção da torre?",
      options: ["Tijolos queimados com betume", "Pedras do rio", "Madeira de cedro", "Barro cru"]
    },
    correct_answer: { value: "Tijolos queimados com betume" },
    explanation: "Usaram tijolos em vez de pedras, e betume em vez de argamassa (Gênesis 11:3)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Em toda a terra havia apenas uma ___ e uma só maneira de falar",
      word_bank: ["linguagem", "nação", "religião", "cidade"],
      reference: "Gênesis 11:1"
    },
    correct_answer: { value: "linguagem" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Por isso o seu nome foi chamado ___, porque ali confundiu o Senhor a linguagem",
      word_bank: ["Babel", "Sinear", "Ur", "Nínive"],
      reference: "Gênesis 11:9"
    },
    correct_answer: { value: "Babel" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "A torre foi construída na terra de Sinear",
      reference: "Gênesis 11:2"
    },
    correct_answer: { value: "true" },
    explanation: "Os homens encontraram uma planície na terra de Sinear e ali habitaram (Gênesis 11:2)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Deus desceu do céu para ver a cidade e a torre que os homens edificavam",
      reference: "Gênesis 11:5"
    },
    correct_answer: { value: "true" },
    explanation: "O texto diz que o Senhor desceu para ver a cidade e a torre (Gênesis 11:5)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["construamos", "uma", "torre", "cujo", "tope", "chegue", "ao", "céu"],
      reference: "Gênesis 11:4"
    },
    correct_answer: { order: ["construamos", "uma", "torre", "cujo", "tope", "chegue", "ao", "céu"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Babel", "Sinear", "Betume", "Línguas"],
      right: ["Confusão", "Planície da torre", "Argamassa usada", "Foram confundidas"]
    },
    correct_answer: {
      pairs: {
        "Babel" => "Confusão",
        "Sinear" => "Planície da torre",
        "Betume" => "Argamassa usada",
        "Línguas" => "Foram confundidas"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "A Torre de Babel",
      events: [
        "Todos falavam uma só língua",
        "Os homens decidem construir uma torre até o céu",
        "Deus desce para ver a construção",
        "Deus confunde as línguas",
        "Os homens param de construir",
        "Os povos se espalham pela terra"
      ]
    },
    correct_answer: { order: [
      "Todos falavam uma só língua",
      "Os homens decidem construir uma torre até o céu",
      "Deus desce para ver a construção",
      "Deus confunde as línguas",
      "Os homens param de construir",
      "Os povos se espalham pela terra"
    ] }
  }
])

# LIÇÃO 3: Abraão: O Chamado (Gênesis 12-13)
puts "  Criando: Abraão: O Chamado..."
lesson_abraao_chamado = unit_patriarcas.lessons.create!(
  name: "Abraão: O Chamado",
  description: "Deus chama Abrão para uma nova terra - Gênesis 12-13",
  position: 2,
  xp_reward: 15
)

lesson_abraao_chamado.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "De qual cidade Deus chamou Abrão para sair?",
      options: ["Ur dos caldeus", "Jerusalém", "Belém", "Nínive"]
    },
    correct_answer: { value: "Ur dos caldeus" },
    explanation: "Abrão saiu de Ur dos caldeus para ir à terra de Canaã (Gênesis 11:31)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que Deus prometeu fazer de Abrão?",
      options: ["Uma grande nação", "Um grande profeta", "Um grande rei", "Um grande sacerdote"]
    },
    correct_answer: { value: "Uma grande nação" },
    explanation: "Deus disse: 'De ti farei uma grande nação, e te abençoarei' (Gênesis 12:2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quem foi com Abrão quando ele saiu de Harã?",
      options: ["Sua esposa Sarai e seu sobrinho Ló", "Seus pais", "Seus irmãos", "Apenas seus servos"]
    },
    correct_answer: { value: "Sua esposa Sarai e seu sobrinho Ló" },
    explanation: "Abrão levou Sarai, sua mulher, e Ló, filho de seu irmão (Gênesis 12:5)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Sai da tua terra, da tua parentela e da casa de teu ___",
      word_bank: ["pai", "irmão", "avô", "filho"],
      reference: "Gênesis 12:1"
    },
    correct_answer: { value: "pai" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Em ti serão ___ todas as famílias da terra",
      word_bank: ["benditas", "julgadas", "reunidas", "conhecidas"],
      reference: "Gênesis 12:3"
    },
    correct_answer: { value: "benditas" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Abrão tinha 75 anos quando saiu de Harã",
      reference: "Gênesis 12:4"
    },
    correct_answer: { value: "true" },
    explanation: "Tinha Abrão setenta e cinco anos quando saiu de Harã (Gênesis 12:4)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Abrão e Ló se separaram porque seus rebanhos eram muito grandes",
      reference: "Gênesis 13:6"
    },
    correct_answer: { value: "true" },
    explanation: "A terra não podia sustentá-los juntos, pois eram muitos os seus bens (Gênesis 13:6)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["De", "ti", "farei", "uma", "grande", "nação"],
      reference: "Gênesis 12:2"
    },
    correct_answer: { order: ["De", "ti", "farei", "uma", "grande", "nação"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Abrão", "Sarai", "Ló", "Canaã"],
      right: ["Pai de muitas nações", "Esposa de Abrão", "Sobrinho de Abrão", "Terra prometida"]
    },
    correct_answer: {
      pairs: {
        "Abrão" => "Pai de muitas nações",
        "Sarai" => "Esposa de Abrão",
        "Ló" => "Sobrinho de Abrão",
        "Canaã" => "Terra prometida"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "O Chamado de Abrão",
      events: [
        "Deus chama Abrão em Ur dos caldeus",
        "Abrão parte com Sarai e Ló",
        "Abrão chega à terra de Canaã",
        "Abrão constrói um altar ao Senhor",
        "Há contenda entre os pastores de Abrão e Ló",
        "Abrão e Ló se separam"
      ]
    },
    correct_answer: { order: [
      "Deus chama Abrão em Ur dos caldeus",
      "Abrão parte com Sarai e Ló",
      "Abrão chega à terra de Canaã",
      "Abrão constrói um altar ao Senhor",
      "Há contenda entre os pastores de Abrão e Ló",
      "Abrão e Ló se separam"
    ] }
  }
])

# LIÇÃO 4: Abraão e Isaque (Gênesis 22)
puts "  Criando: Abraão e Isaque..."
lesson_abraao_isaque = unit_patriarcas.lessons.create!(
  name: "Abraão e Isaque",
  description: "A prova de fé de Abraão no monte Moriá - Gênesis 22",
  position: 3,
  xp_reward: 15
)

lesson_abraao_isaque.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que Deus pediu que Abraão oferecesse em sacrifício?",
      options: ["Seu filho Isaque", "Um cordeiro", "Um boi", "Suas riquezas"]
    },
    correct_answer: { value: "Seu filho Isaque" },
    explanation: "Deus disse: 'Toma teu filho, teu único filho, Isaque, a quem amas' (Gênesis 22:2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Em qual monte Abraão deveria oferecer Isaque?",
      options: ["Monte Moriá", "Monte Sinai", "Monte Carmelo", "Monte das Oliveiras"]
    },
    correct_answer: { value: "Monte Moriá" },
    explanation: "Deus ordenou que fosse à terra de Moriá (Gênesis 22:2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que Abraão encontrou para sacrificar no lugar de Isaque?",
      options: ["Um carneiro preso pelos chifres", "Uma ovelha", "Um bode", "Um cordeiro"]
    },
    correct_answer: { value: "Um carneiro preso pelos chifres" },
    explanation: "Abraão viu um carneiro preso pelos chifres entre os arbustos (Gênesis 22:13)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Deus ___ o cordeiro para o holocausto, meu filho",
      word_bank: ["proverá", "enviará", "mostrará", "dará"],
      reference: "Gênesis 22:8"
    },
    correct_answer: { value: "proverá" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Abraão pôs o nome daquele lugar: O Senhor ___",
      word_bank: ["Proverá", "Salvará", "Abençoará", "Guardará"],
      reference: "Gênesis 22:14"
    },
    correct_answer: { value: "Proverá" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Isaque perguntou ao pai onde estava o cordeiro para o holocausto",
      reference: "Gênesis 22:7"
    },
    correct_answer: { value: "true" },
    explanation: "Isaque disse: 'Eis o fogo e a lenha, mas onde está o cordeiro?' (Gênesis 22:7)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Abraão desobedeceu a Deus e não quis oferecer Isaque",
      reference: "Gênesis 22:10"
    },
    correct_answer: { value: "false" },
    explanation: "Abraão obedeceu completamente, até que o anjo o impediu (Gênesis 22:10-12)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Não", "estendas", "a", "mão", "sobre", "o", "rapaz"],
      reference: "Gênesis 22:12"
    },
    correct_answer: { order: ["Não", "estendas", "a", "mão", "sobre", "o", "rapaz"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Abraão", "Isaque", "Carneiro", "Moriá"],
      right: ["Pai da fé", "Filho da promessa", "Substituto no sacrifício", "Local do altar"]
    },
    correct_answer: {
      pairs: {
        "Abraão" => "Pai da fé",
        "Isaque" => "Filho da promessa",
        "Carneiro" => "Substituto no sacrifício",
        "Moriá" => "Local do altar"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "O Sacrifício de Isaque",
      events: [
        "Deus pede que Abraão ofereça Isaque",
        "Abraão parte com Isaque para o monte Moriá",
        "Isaque pergunta onde está o cordeiro",
        "Abraão amarra Isaque sobre o altar",
        "O anjo do Senhor impede Abraão",
        "Abraão encontra um carneiro para o sacrifício"
      ]
    },
    correct_answer: { order: [
      "Deus pede que Abraão ofereça Isaque",
      "Abraão parte com Isaque para o monte Moriá",
      "Isaque pergunta onde está o cordeiro",
      "Abraão amarra Isaque sobre o altar",
      "O anjo do Senhor impede Abraão",
      "Abraão encontra um carneiro para o sacrifício"
    ] }
  }
])

# LIÇÃO 5: Jacó e Esaú (Gênesis 25-27)
puts "  Criando: Jacó e Esaú..."
lesson_jaco_esau = unit_patriarcas.lessons.create!(
  name: "Jacó e Esaú",
  description: "Os irmãos gêmeos e a disputa pela bênção - Gênesis 25-27",
  position: 4,
  xp_reward: 15
)

lesson_jaco_esau.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quem nasceu primeiro: Jacó ou Esaú?",
      options: ["Esaú", "Jacó", "Nasceram ao mesmo tempo", "A Bíblia não diz"]
    },
    correct_answer: { value: "Esaú" },
    explanation: "Esaú nasceu primeiro, e Jacó nasceu segurando o calcanhar de Esaú (Gênesis 25:25-26)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Por que Esaú vendeu seu direito de primogenitura a Jacó?",
      options: ["Por um prato de lentilhas", "Por ouro e prata", "Por terras", "Por rebanhos"]
    },
    correct_answer: { value: "Por um prato de lentilhas" },
    explanation: "Esaú estava faminto e trocou seu direito por um guisado de lentilhas (Gênesis 25:29-34)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quem ajudou Jacó a enganar Isaque para receber a bênção?",
      options: ["Sua mãe Rebeca", "Seu irmão Esaú", "Seu avô Abraão", "Seu tio Labão"]
    },
    correct_answer: { value: "Sua mãe Rebeca" },
    explanation: "Rebeca instruiu Jacó a se disfarçar de Esaú (Gênesis 27:5-17)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "O mais velho servirá ao mais ___",
      word_bank: ["moço", "velho", "forte", "sábio"],
      reference: "Gênesis 25:23"
    },
    correct_answer: { value: "moço" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Esaú era homem do campo, ___, mas Jacó era homem pacato",
      word_bank: ["caçador", "pastor", "guerreiro", "agricultor"],
      reference: "Gênesis 25:27"
    },
    correct_answer: { value: "caçador" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Isaque amava mais a Esaú, enquanto Rebeca amava mais a Jacó",
      reference: "Gênesis 25:28"
    },
    correct_answer: { value: "true" },
    explanation: "Isaque amava a Esaú porque gostava de caça, mas Rebeca amava a Jacó (Gênesis 25:28)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Jacó usou peles de cabrito para parecer peludo como Esaú",
      reference: "Gênesis 27:16"
    },
    correct_answer: { value: "true" },
    explanation: "Rebeca cobriu as mãos e o pescoço de Jacó com peles de cabrito (Gênesis 27:16)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["A", "voz", "é", "de", "Jacó", "mas", "as", "mãos", "de", "Esaú"],
      reference: "Gênesis 27:22"
    },
    correct_answer: { order: ["A", "voz", "é", "de", "Jacó", "mas", "as", "mãos", "de", "Esaú"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Esaú", "Jacó", "Isaque", "Rebeca"],
      right: ["Vendeu a primogenitura", "Recebeu a bênção", "Pai cego", "Planejou o engano"]
    },
    correct_answer: {
      pairs: {
        "Esaú" => "Vendeu a primogenitura",
        "Jacó" => "Recebeu a bênção",
        "Isaque" => "Pai cego",
        "Rebeca" => "Planejou o engano"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "Jacó e Esaú",
      events: [
        "Nascem os gêmeos Esaú e Jacó",
        "Esaú vende sua primogenitura por lentilhas",
        "Rebeca planeja enganar Isaque",
        "Jacó se disfarça de Esaú",
        "Jacó recebe a bênção de Isaque",
        "Esaú descobre e quer matar Jacó"
      ]
    },
    correct_answer: { order: [
      "Nascem os gêmeos Esaú e Jacó",
      "Esaú vende sua primogenitura por lentilhas",
      "Rebeca planeja enganar Isaque",
      "Jacó se disfarça de Esaú",
      "Jacó recebe a bênção de Isaque",
      "Esaú descobre e quer matar Jacó"
    ] }
  }
])

puts "  Unidade 'Os Patriarcas' criada: #{unit_patriarcas.lessons.count} lições"

# ============================================
# UNIDADE 3: JOSÉ DO EGITO (icon: 🏛️)
# Cobrindo Gênesis 37-50
# ============================================

puts "Criando Unidade: José do Egito..."
unit_jose = at.units.create!(
  name: "José do Egito",
  description: "A incrível história de José, de escravo a governador",
  icon: "🏛️",
  position: 2
)

# LIÇÃO 1: José e os Sonhos (Gênesis 37)
puts "  Criando: José e os Sonhos..."
lesson_jose_sonhos = unit_jose.lessons.create!(
  name: "José e os Sonhos",
  description: "José é vendido pelos irmãos por causa dos sonhos - Gênesis 37",
  position: 0,
  xp_reward: 15
)

lesson_jose_sonhos.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que o pai de José lhe deu que causou inveja nos irmãos?",
      options: ["Uma túnica colorida", "Um rebanho de ovelhas", "Uma espada", "Um anel de ouro"]
    },
    correct_answer: { value: "Uma túnica colorida" },
    explanation: "Israel amava mais a José e fez-lhe uma túnica de várias cores (Gênesis 37:3)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "No sonho de José, o que os feixes dos irmãos fizeram?",
      options: ["Se inclinaram diante do feixe de José", "Queimaram o feixe de José", "Fugiram do feixe de José", "Cercaram o feixe de José"]
    },
    correct_answer: { value: "Se inclinaram diante do feixe de José" },
    explanation: "Os feixes dos irmãos se inclinaram ao feixe de José (Gênesis 37:7)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Por quanto os irmãos venderam José aos mercadores?",
      options: ["Vinte moedas de prata", "Trinta moedas de ouro", "Dez moedas de prata", "Cinquenta moedas de ouro"]
    },
    correct_answer: { value: "Vinte moedas de prata" },
    explanation: "Venderam José por vinte siclos de prata aos ismaelitas (Gênesis 37:28)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "O sol, a lua e ___ estrelas se inclinavam perante José",
      word_bank: ["onze", "doze", "sete", "três"],
      reference: "Gênesis 37:9"
    },
    correct_answer: { value: "onze" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Os irmãos lançaram José numa ___ vazia",
      word_bank: ["cisterna", "caverna", "tenda", "cova"],
      reference: "Gênesis 37:24"
    },
    correct_answer: { value: "cisterna" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Rúben queria salvar José e devolvê-lo ao pai",
      reference: "Gênesis 37:22"
    },
    correct_answer: { value: "true" },
    explanation: "Rúben planejava resgatar José da cisterna e devolvê-lo a Jacó (Gênesis 37:22)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Os irmãos molharam a túnica de José em sangue de bode",
      reference: "Gênesis 37:31"
    },
    correct_answer: { value: "true" },
    explanation: "Mataram um bode e molharam a túnica no sangue para enganar o pai (Gênesis 37:31)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Eis", "que", "vem", "o", "sonhador"],
      reference: "Gênesis 37:19"
    },
    correct_answer: { order: ["Eis", "que", "vem", "o", "sonhador"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Túnica colorida", "Cisterna", "Ismaelitas", "Sangue de bode"],
      right: ["Presente de Jacó", "Onde José foi lançado", "Compraram José", "Enganou Jacó"]
    },
    correct_answer: {
      pairs: {
        "Túnica colorida" => "Presente de Jacó",
        "Cisterna" => "Onde José foi lançado",
        "Ismaelitas" => "Compraram José",
        "Sangue de bode" => "Enganou Jacó"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "José Vendido pelos Irmãos",
      events: [
        "Jacó dá a José uma túnica colorida",
        "José conta seus sonhos aos irmãos",
        "Os irmãos planejam matar José",
        "José é lançado numa cisterna",
        "José é vendido aos ismaelitas",
        "Os irmãos enganam Jacó com a túnica ensanguentada"
      ]
    },
    correct_answer: { order: [
      "Jacó dá a José uma túnica colorida",
      "José conta seus sonhos aos irmãos",
      "Os irmãos planejam matar José",
      "José é lançado numa cisterna",
      "José é vendido aos ismaelitas",
      "Os irmãos enganam Jacó com a túnica ensanguentada"
    ] }
  }
])

# LIÇÃO 2: José na Prisão (Gênesis 39-40)
puts "  Criando: José na Prisão..."
lesson_jose_prisao = unit_jose.lessons.create!(
  name: "José na Prisão",
  description: "José é falsamente acusado e interpreta sonhos na prisão - Gênesis 39-40",
  position: 1,
  xp_reward: 15
)

lesson_jose_prisao.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Para quem José foi vendido no Egito?",
      options: ["Potifar, oficial de Faraó", "O próprio Faraó", "Um comerciante rico", "Um sacerdote egípcio"]
    },
    correct_answer: { value: "Potifar, oficial de Faraó" },
    explanation: "Potifar, oficial de Faraó e capitão da guarda, comprou José (Gênesis 39:1)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Por que José foi lançado na prisão?",
      options: ["Acusação falsa da mulher de Potifar", "Por roubo", "Por desobedecer Potifar", "Por fugir da casa"]
    },
    correct_answer: { value: "Acusação falsa da mulher de Potifar" },
    explanation: "A mulher de Potifar mentiu, acusando José de tentar seduzi-la (Gênesis 39:14-20)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quais dois funcionários de Faraó tiveram sonhos na prisão?",
      options: ["O copeiro e o padeiro", "O cozinheiro e o mordomo", "O guarda e o escriba", "O músico e o dançarino"]
    },
    correct_answer: { value: "O copeiro e o padeiro" },
    explanation: "O copeiro-mor e o padeiro-mor de Faraó tiveram sonhos na prisão (Gênesis 40:1-5)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "O Senhor era com José, e tudo que ele fazia, o Senhor ___",
      word_bank: ["prosperava", "abençoava", "guardava", "multiplicava"],
      reference: "Gênesis 39:23"
    },
    correct_answer: { value: "prosperava" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Porventura não pertencem a ___ as interpretações dos sonhos?",
      word_bank: ["Deus", "Faraó", "mim", "vocês"],
      reference: "Gênesis 40:8"
    },
    correct_answer: { value: "Deus" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O sonho do copeiro significava que ele seria restaurado ao cargo",
      reference: "Gênesis 40:13"
    },
    correct_answer: { value: "true" },
    explanation: "José interpretou que em três dias o copeiro voltaria ao seu cargo (Gênesis 40:13)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "O copeiro se lembrou imediatamente de José quando saiu da prisão",
      reference: "Gênesis 40:23"
    },
    correct_answer: { value: "false" },
    explanation: "O copeiro-mor não se lembrou de José e o esqueceu (Gênesis 40:23)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Como", "pecaria", "eu", "contra", "Deus"],
      reference: "Gênesis 39:9"
    },
    correct_answer: { order: ["Como", "pecaria", "eu", "contra", "Deus"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Potifar", "Mulher de Potifar", "Copeiro", "Padeiro"],
      right: ["Comprou José", "Acusou falsamente", "Foi restaurado", "Foi executado"]
    },
    correct_answer: {
      pairs: {
        "Potifar" => "Comprou José",
        "Mulher de Potifar" => "Acusou falsamente",
        "Copeiro" => "Foi restaurado",
        "Padeiro" => "Foi executado"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "José na Casa de Potifar e na Prisão",
      events: [
        "José é vendido a Potifar",
        "José prospera na casa de Potifar",
        "A mulher de Potifar tenta seduzir José",
        "José é falsamente acusado e preso",
        "José interpreta os sonhos do copeiro e do padeiro",
        "O copeiro é restaurado mas esquece de José"
      ]
    },
    correct_answer: { order: [
      "José é vendido a Potifar",
      "José prospera na casa de Potifar",
      "A mulher de Potifar tenta seduzir José",
      "José é falsamente acusado e preso",
      "José interpreta os sonhos do copeiro e do padeiro",
      "O copeiro é restaurado mas esquece de José"
    ] }
  }
])

# LIÇÃO 3: José Governador (Gênesis 41-45)
puts "  Criando: José Governador..."
lesson_jose_governador = unit_jose.lessons.create!(
  name: "José Governador",
  description: "José interpreta os sonhos de Faraó e se torna governador - Gênesis 41-45",
  position: 2,
  xp_reward: 15
)

lesson_jose_governador.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que significavam os sonhos de Faraó sobre as vacas e as espigas?",
      options: ["Sete anos de fartura e sete de fome", "Uma guerra que viria", "A morte de um filho", "Uma praga no Egito"]
    },
    correct_answer: { value: "Sete anos de fartura e sete de fome" },
    explanation: "José interpretou que viriam sete anos de fartura seguidos de sete anos de fome (Gênesis 41:29-30)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Que posição Faraó deu a José?",
      options: ["Governador de todo o Egito", "General do exército", "Sumo sacerdote", "Conselheiro real"]
    },
    correct_answer: { value: "Governador de todo o Egito" },
    explanation: "Faraó colocou José sobre toda a terra do Egito (Gênesis 41:41)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Por que os irmãos de José foram ao Egito?",
      options: ["Comprar alimento por causa da fome", "Visitar José", "Fugir de uma guerra", "Buscar trabalho"]
    },
    correct_answer: { value: "Comprar alimento por causa da fome" },
    explanation: "A fome atingiu Canaã e os irmãos desceram ao Egito para comprar cereais (Gênesis 42:3)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Vós intentastes o mal contra mim, porém Deus o tornou em ___",
      word_bank: ["bem", "justiça", "paz", "vitória"],
      reference: "Gênesis 50:20"
    },
    correct_answer: { value: "bem" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Faraó tirou o ___ da sua mão e o pôs na mão de José",
      word_bank: ["anel", "cetro", "manto", "colar"],
      reference: "Gênesis 41:42"
    },
    correct_answer: { value: "anel" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "José se revelou aos irmãos dizendo: Eu sou José, vosso irmão",
      reference: "Gênesis 45:4"
    },
    correct_answer: { value: "true" },
    explanation: "José disse aos irmãos: 'Eu sou José, vosso irmão, a quem vendestes para o Egito' (Gênesis 45:4)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "José se vingou de seus irmãos quando os reconheceu",
      reference: "Gênesis 45:5"
    },
    correct_answer: { value: "false" },
    explanation: "José perdoou seus irmãos e disse que Deus o enviou adiante para preservar a família (Gênesis 45:5-7)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Eu", "sou", "José", "vive", "ainda", "meu", "pai"],
      reference: "Gênesis 45:3"
    },
    correct_answer: { order: ["Eu", "sou", "José", "vive", "ainda", "meu", "pai"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Vacas gordas", "Vacas magras", "Anel de Faraó", "Benjamim"],
      right: ["Anos de fartura", "Anos de fome", "Autoridade de José", "Irmão mais novo de José"]
    },
    correct_answer: {
      pairs: {
        "Vacas gordas" => "Anos de fartura",
        "Vacas magras" => "Anos de fome",
        "Anel de Faraó" => "Autoridade de José",
        "Benjamim" => "Irmão mais novo de José"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "José se Torna Governador",
      events: [
        "Faraó tem sonhos que ninguém consegue interpretar",
        "O copeiro se lembra de José",
        "José interpreta os sonhos de Faraó",
        "José é feito governador do Egito",
        "Os irmãos de José vêm comprar alimento",
        "José se revela aos irmãos e os perdoa"
      ]
    },
    correct_answer: { order: [
      "Faraó tem sonhos que ninguém consegue interpretar",
      "O copeiro se lembra de José",
      "José interpreta os sonhos de Faraó",
      "José é feito governador do Egito",
      "Os irmãos de José vêm comprar alimento",
      "José se revela aos irmãos e os perdoa"
    ] }
  }
])

puts "  Unidade 'José do Egito' criada: #{unit_jose.lessons.count} lições"

# ============================================
# UNIDADE 4: MOISÉS E O ÊXODO (icon: 🌊)
# Cobrindo Êxodo 1-20
# ============================================

puts "Criando Unidade: Moisés e o Êxodo..."
unit_moises = at.units.create!(
  name: "Moisés e o Êxodo",
  description: "A libertação do povo de Israel da escravidão no Egito",
  icon: "🌊",
  position: 3
)

# LIÇÃO 1: O Nascimento de Moisés (Êxodo 1-2)
puts "  Criando: O Nascimento de Moisés..."
lesson_moises_nasc = unit_moises.lessons.create!(
  name: "O Nascimento de Moisés",
  description: "Moisés é salvo das águas e criado no palácio - Êxodo 1-2",
  position: 0,
  xp_reward: 15
)

lesson_moises_nasc.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Por que Faraó ordenou matar os meninos hebreus?",
      options: ["Temia que os hebreus se tornassem numerosos demais", "Para punir os hebreus", "Por causa de uma profecia", "Para agradar aos deuses"]
    },
    correct_answer: { value: "Temia que os hebreus se tornassem numerosos demais" },
    explanation: "Faraó temia que os hebreus se multiplicassem e se aliassem aos inimigos (Êxodo 1:9-10)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Onde a mãe de Moisés o colocou para salvá-lo?",
      options: ["Num cesto no rio Nilo", "Numa caverna", "Na casa de parentes", "No templo"]
    },
    correct_answer: { value: "Num cesto no rio Nilo" },
    explanation: "Sua mãe o colocou num cesto de junco e pôs entre os juncos à beira do rio (Êxodo 2:3)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quem encontrou Moisés no rio e o adotou?",
      options: ["A filha de Faraó", "Uma escrava egípcia", "A esposa de Faraó", "Uma sacerdotisa"]
    },
    correct_answer: { value: "A filha de Faraó" },
    explanation: "A filha de Faraó desceu para se banhar e encontrou o cesto com o menino (Êxodo 2:5-6)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "E chamou-lhe ___, porque das águas o tirei",
      word_bank: ["Moisés", "Israel", "Arão", "Levi"],
      reference: "Êxodo 2:10"
    },
    correct_answer: { value: "Moisés" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "A irmã de Moisés que o vigiava no rio era ___",
      word_bank: ["Miriã", "Raquel", "Lia", "Rute"],
      reference: "Êxodo 2:4"
    },
    correct_answer: { value: "Miriã" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "A própria mãe de Moisés foi chamada para amamentá-lo",
      reference: "Êxodo 2:7-9"
    },
    correct_answer: { value: "true" },
    explanation: "Miriã sugeriu chamar uma ama hebréia, e trouxe a própria mãe de Moisés (Êxodo 2:7-9)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Moisés fugiu do Egito depois de matar um egípcio que batia num hebreu",
      reference: "Êxodo 2:11-15"
    },
    correct_answer: { value: "true" },
    explanation: "Moisés matou um egípcio que agredia um hebreu e fugiu para Midiã (Êxodo 2:11-15)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Das", "águas", "o", "tirei"],
      reference: "Êxodo 2:10"
    },
    correct_answer: { order: ["Das", "águas", "o", "tirei"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Cesto de junco", "Filha de Faraó", "Miriã", "Midiã"],
      right: ["Salvou Moisés", "Adotou Moisés", "Irmã de Moisés", "Refúgio de Moisés"]
    },
    correct_answer: {
      pairs: {
        "Cesto de junco" => "Salvou Moisés",
        "Filha de Faraó" => "Adotou Moisés",
        "Miriã" => "Irmã de Moisés",
        "Midiã" => "Refúgio de Moisés"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "O Nascimento de Moisés",
      events: [
        "Faraó ordena matar os meninos hebreus",
        "A mãe de Moisés o esconde por três meses",
        "Moisés é colocado num cesto no rio Nilo",
        "A filha de Faraó encontra e adota Moisés",
        "Moisés cresce no palácio de Faraó",
        "Moisés foge para Midiã"
      ]
    },
    correct_answer: { order: [
      "Faraó ordena matar os meninos hebreus",
      "A mãe de Moisés o esconde por três meses",
      "Moisés é colocado num cesto no rio Nilo",
      "A filha de Faraó encontra e adota Moisés",
      "Moisés cresce no palácio de Faraó",
      "Moisés foge para Midiã"
    ] }
  }
])

# LIÇÃO 2: A Sarça Ardente (Êxodo 3-4)
puts "  Criando: A Sarça Ardente..."
lesson_sarca = unit_moises.lessons.create!(
  name: "A Sarça Ardente",
  description: "Deus chama Moisés para libertar seu povo - Êxodo 3-4",
  position: 1,
  xp_reward: 15
)

lesson_sarca.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que Moisés estava fazendo quando viu a sarça ardente?",
      options: ["Apascentando ovelhas", "Orando no templo", "Trabalhando no campo", "Pescando no rio"]
    },
    correct_answer: { value: "Apascentando ovelhas" },
    explanation: "Moisés apascentava o rebanho de Jetro, seu sogro, quando viu a sarça (Êxodo 3:1-2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que havia de especial na sarça ardente?",
      options: ["Ardia mas não se consumia", "Falava com voz humana", "Brilhava como ouro", "Mudava de cor"]
    },
    correct_answer: { value: "Ardia mas não se consumia" },
    explanation: "A sarça ardia em fogo, porém não se consumia (Êxodo 3:2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Qual foi o nome que Deus revelou a Moisés?",
      options: ["EU SOU O QUE SOU", "O Todo-Poderoso", "O Deus de Abraão", "O Senhor dos Exércitos"]
    },
    correct_answer: { value: "EU SOU O QUE SOU" },
    explanation: "Deus disse: 'EU SOU O QUE SOU' e assim dirás: EU SOU me enviou (Êxodo 3:14)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Tira as sandálias dos pés, porque o lugar em que estás é terra ___",
      word_bank: ["santa", "sagrada", "abençoada", "prometida"],
      reference: "Êxodo 3:5"
    },
    correct_answer: { value: "santa" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Quem ajudaria Moisés a falar? Seu irmão ___",
      word_bank: ["Arão", "Calebe", "Josué", "Levi"],
      reference: "Êxodo 4:14"
    },
    correct_answer: { value: "Arão" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Moisés aceitou imediatamente a missão de libertar Israel",
      reference: "Êxodo 4:10-13"
    },
    correct_answer: { value: "false" },
    explanation: "Moisés apresentou várias desculpas e pediu que Deus enviasse outra pessoa (Êxodo 4:10-13)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "A sarça ardente estava no monte Horebe, também chamado monte de Deus",
      reference: "Êxodo 3:1"
    },
    correct_answer: { value: "true" },
    explanation: "Moisés levou o rebanho até o monte de Deus, Horebe (Êxodo 3:1)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["EU", "SOU", "O", "QUE", "SOU"],
      reference: "Êxodo 3:14"
    },
    correct_answer: { order: ["EU", "SOU", "O", "QUE", "SOU"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Sarça ardente", "Horebe", "Arão", "Cajado"],
      right: ["Não se consumia", "Monte de Deus", "Porta-voz de Moisés", "Virou serpente"]
    },
    correct_answer: {
      pairs: {
        "Sarça ardente" => "Não se consumia",
        "Horebe" => "Monte de Deus",
        "Arão" => "Porta-voz de Moisés",
        "Cajado" => "Virou serpente"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "O Chamado de Moisés",
      events: [
        "Moisés vê a sarça que arde sem se consumir",
        "Deus chama Moisés da sarça",
        "Moisés tira as sandálias em terra santa",
        "Deus revela seu nome: EU SOU",
        "Moisés apresenta desculpas",
        "Deus designa Arão como porta-voz"
      ]
    },
    correct_answer: { order: [
      "Moisés vê a sarça que arde sem se consumir",
      "Deus chama Moisés da sarça",
      "Moisés tira as sandálias em terra santa",
      "Deus revela seu nome: EU SOU",
      "Moisés apresenta desculpas",
      "Deus designa Arão como porta-voz"
    ] }
  }
])

# LIÇÃO 3: As Dez Pragas (Êxodo 7-12)
puts "  Criando: As Dez Pragas..."
lesson_pragas = unit_moises.lessons.create!(
  name: "As Dez Pragas",
  description: "Deus envia pragas sobre o Egito - Êxodo 7-12",
  position: 2,
  xp_reward: 15
)

lesson_pragas.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Qual foi a primeira praga enviada sobre o Egito?",
      options: ["Água transformada em sangue", "Rãs", "Piolhos", "Moscas"]
    },
    correct_answer: { value: "Água transformada em sangue" },
    explanation: "A primeira praga foi a transformação das águas do Nilo em sangue (Êxodo 7:20)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Qual foi a última e mais terrível praga?",
      options: ["Morte dos primogênitos", "Trevas", "Gafanhotos", "Saraiva"]
    },
    correct_answer: { value: "Morte dos primogênitos" },
    explanation: "A décima praga foi a morte de todos os primogênitos do Egito (Êxodo 12:29)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que os israelitas deviam passar nas portas para serem protegidos?",
      options: ["Sangue de cordeiro", "Água do Nilo", "Óleo de oliva", "Farinha de trigo"]
    },
    correct_answer: { value: "Sangue de cordeiro" },
    explanation: "O sangue do cordeiro nas ombreiras fez o anjo da morte passar por cima (Êxodo 12:7,13)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Deixa ir o meu ___, para que me sirva",
      word_bank: ["povo", "filho", "servo", "irmão"],
      reference: "Êxodo 7:16"
    },
    correct_answer: { value: "povo" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "E houve trevas espessas em toda a terra do Egito por ___ dias",
      word_bank: ["três", "sete", "quarenta", "dez"],
      reference: "Êxodo 10:22"
    },
    correct_answer: { value: "três" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "A terra de Gósen, onde moravam os hebreus, foi atingida por todas as pragas",
      reference: "Êxodo 8:22"
    },
    correct_answer: { value: "false" },
    explanation: "Deus separou a terra de Gósen, onde estavam os israelitas, das pragas (Êxodo 8:22)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Faraó endureceu seu coração e não deixou o povo ir",
      reference: "Êxodo 8:32"
    },
    correct_answer: { value: "true" },
    explanation: "Repetidamente Faraó endureceu seu coração e não deixou o povo partir (Êxodo 8:32)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Deixa", "ir", "o", "meu", "povo"],
      reference: "Êxodo 5:1"
    },
    correct_answer: { order: ["Deixa", "ir", "o", "meu", "povo"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["1ª Praga", "2ª Praga", "9ª Praga", "10ª Praga"],
      right: ["Água em sangue", "Rãs", "Trevas", "Morte dos primogênitos"]
    },
    correct_answer: {
      pairs: {
        "1ª Praga" => "Água em sangue",
        "2ª Praga" => "Rãs",
        "9ª Praga" => "Trevas",
        "10ª Praga" => "Morte dos primogênitos"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "As Pragas do Egito",
      events: [
        "Moisés pede a Faraó que deixe o povo ir",
        "Faraó recusa e seu coração se endurece",
        "Deus envia as pragas sobre o Egito",
        "Os israelitas são protegidos em Gósen",
        "A última praga: morte dos primogênitos",
        "Faraó finalmente deixa Israel partir"
      ]
    },
    correct_answer: { order: [
      "Moisés pede a Faraó que deixe o povo ir",
      "Faraó recusa e seu coração se endurece",
      "Deus envia as pragas sobre o Egito",
      "Os israelitas são protegidos em Gósen",
      "A última praga: morte dos primogênitos",
      "Faraó finalmente deixa Israel partir"
    ] }
  }
])

# LIÇÃO 4: A Travessia do Mar (Êxodo 14)
puts "  Criando: A Travessia do Mar..."
lesson_mar = unit_moises.lessons.create!(
  name: "A Travessia do Mar",
  description: "Deus abre o Mar Vermelho para Israel passar - Êxodo 14",
  position: 3,
  xp_reward: 15
)

lesson_mar.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que aconteceu quando Moisés estendeu a mão sobre o mar?",
      options: ["As águas se dividiram", "O mar secou completamente", "Uma ponte apareceu", "Barcos surgiram"]
    },
    correct_answer: { value: "As águas se dividiram" },
    explanation: "O Senhor fez retirar o mar com um forte vento oriental e dividiu as águas (Êxodo 14:21)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que aconteceu com o exército egípcio no mar?",
      options: ["Foi coberto pelas águas e morreu", "Conseguiu atravessar também", "Desistiu e voltou", "Foi derrotado pelos israelitas"]
    },
    correct_answer: { value: "Foi coberto pelas águas e morreu" },
    explanation: "As águas voltaram e cobriram os carros e cavaleiros de Faraó (Êxodo 14:28)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que guiava os israelitas durante a jornada?",
      options: ["Coluna de nuvem de dia e coluna de fogo de noite", "Uma estrela brilhante", "Anjos visíveis", "O som de trombetas"]
    },
    correct_answer: { value: "Coluna de nuvem de dia e coluna de fogo de noite" },
    explanation: "O Senhor ia adiante deles, numa coluna de nuvem de dia e de fogo de noite (Êxodo 13:21)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Os filhos de Israel passaram pelo meio do mar em ___ terra",
      word_bank: ["seco", "molhada", "santa", "firme"],
      reference: "Êxodo 14:22"
    },
    correct_answer: { value: "seco" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "O Senhor pelejará por vós, e vós vos ___",
      word_bank: ["calareis", "alegrareis", "assentareis", "escondereis"],
      reference: "Êxodo 14:14"
    },
    correct_answer: { value: "calareis" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O povo teve medo quando viu o exército de Faraó se aproximando",
      reference: "Êxodo 14:10"
    },
    correct_answer: { value: "true" },
    explanation: "Os israelitas temeram muito e clamaram ao Senhor (Êxodo 14:10)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "As águas formaram muros à direita e à esquerda dos israelitas",
      reference: "Êxodo 14:22"
    },
    correct_answer: { value: "true" },
    explanation: "As águas eram como muros à direita e à esquerda (Êxodo 14:22)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["O", "Senhor", "pelejará", "por", "vós"],
      reference: "Êxodo 14:14"
    },
    correct_answer: { order: ["O", "Senhor", "pelejará", "por", "vós"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Coluna de nuvem", "Coluna de fogo", "Cajado de Moisés", "Mar Vermelho"],
      right: ["Guiava de dia", "Guiava de noite", "Dividiu as águas", "Engoliu os egípcios"]
    },
    correct_answer: {
      pairs: {
        "Coluna de nuvem" => "Guiava de dia",
        "Coluna de fogo" => "Guiava de noite",
        "Cajado de Moisés" => "Dividiu as águas",
        "Mar Vermelho" => "Engoliu os egípcios"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "A Travessia do Mar Vermelho",
      events: [
        "Faraó se arrepende e persegue os israelitas",
        "O povo de Israel fica encurralado diante do mar",
        "Moisés estende o cajado sobre o mar",
        "As águas se dividem formando muros",
        "Israel atravessa em terra seca",
        "As águas voltam e afogam os egípcios"
      ]
    },
    correct_answer: { order: [
      "Faraó se arrepende e persegue os israelitas",
      "O povo de Israel fica encurralado diante do mar",
      "Moisés estende o cajado sobre o mar",
      "As águas se dividem formando muros",
      "Israel atravessa em terra seca",
      "As águas voltam e afogam os egípcios"
    ] }
  }
])

# LIÇÃO 5: Os Dez Mandamentos (Êxodo 20)
puts "  Criando: Os Dez Mandamentos..."
lesson_mandamentos = unit_moises.lessons.create!(
  name: "Os Dez Mandamentos",
  description: "Deus entrega a Lei a Moisés no monte Sinai - Êxodo 20",
  position: 4,
  xp_reward: 15
)

lesson_mandamentos.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Em qual monte Moisés recebeu os Dez Mandamentos?",
      options: ["Monte Sinai", "Monte Horebe", "Monte Carmelo", "Monte das Oliveiras"]
    },
    correct_answer: { value: "Monte Sinai" },
    explanation: "Deus deu os mandamentos a Moisés no monte Sinai (Êxodo 19:20)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Em que foram escritos os Dez Mandamentos?",
      options: ["Duas tábuas de pedra", "Um rolo de pergaminho", "Tábuas de madeira", "Placas de ouro"]
    },
    correct_answer: { value: "Duas tábuas de pedra" },
    explanation: "Os mandamentos foram escritos em duas tábuas de pedra pelo dedo de Deus (Êxodo 31:18)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Qual é o primeiro mandamento?",
      options: ["Não terás outros deuses diante de mim", "Não matarás", "Honra teu pai e tua mãe", "Não furtarás"]
    },
    correct_answer: { value: "Não terás outros deuses diante de mim" },
    explanation: "O primeiro mandamento estabelece a exclusividade do culto a Deus (Êxodo 20:3)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Honra a teu pai e a tua ___, para que se prolonguem os teus dias",
      word_bank: ["mãe", "irmã", "esposa", "avó"],
      reference: "Êxodo 20:12"
    },
    correct_answer: { value: "mãe" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Lembra-te do dia de ___ para o santificar",
      word_bank: ["sábado", "festa", "sacrifício", "oração"],
      reference: "Êxodo 20:8"
    },
    correct_answer: { value: "sábado" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O monte Sinai estava coberto de fumaça e o povo tremia de medo",
      reference: "Êxodo 19:18; 20:18"
    },
    correct_answer: { value: "true" },
    explanation: "O monte fumegava e todo o povo tremia com trovões e relâmpagos (Êxodo 19:18; 20:18)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "O mandamento 'Não matarás' é o primeiro dos dez mandamentos",
      reference: "Êxodo 20:13"
    },
    correct_answer: { value: "false" },
    explanation: "'Não matarás' é o sexto mandamento. O primeiro é 'Não terás outros deuses' (Êxodo 20:3,13)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Não", "terás", "outros", "deuses", "diante", "de", "mim"],
      reference: "Êxodo 20:3"
    },
    correct_answer: { order: ["Não", "terás", "outros", "deuses", "diante", "de", "mim"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["1º Mandamento", "5º Mandamento", "6º Mandamento", "8º Mandamento"],
      right: ["Não terás outros deuses", "Honra pai e mãe", "Não matarás", "Não furtarás"]
    },
    correct_answer: {
      pairs: {
        "1º Mandamento" => "Não terás outros deuses",
        "5º Mandamento" => "Honra pai e mãe",
        "6º Mandamento" => "Não matarás",
        "8º Mandamento" => "Não furtarás"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "Os Dez Mandamentos",
      events: [
        "Israel chega ao monte Sinai",
        "O povo se consagra para encontrar com Deus",
        "Deus desce sobre o monte com trovões e relâmpagos",
        "Moisés sobe ao monte",
        "Deus fala os Dez Mandamentos",
        "Moisés recebe as tábuas de pedra"
      ]
    },
    correct_answer: { order: [
      "Israel chega ao monte Sinai",
      "O povo se consagra para encontrar com Deus",
      "Deus desce sobre o monte com trovões e relâmpagos",
      "Moisés sobe ao monte",
      "Deus fala os Dez Mandamentos",
      "Moisés recebe as tábuas de pedra"
    ] }
  }
])

puts "  Unidade 'Moisés e o Êxodo' criada: #{unit_moises.lessons.count} lições"

# ============================================
# UNIDADE 5: JUÍZES E HERÓIS (icon: ⚔️)
# Cobrindo Juízes e Rute
# ============================================

puts "Criando Unidade: Juízes e Heróis..."
unit_juizes = at.units.create!(
  name: "Juízes e Heróis",
  description: "Os líderes que Deus levantou para libertar Israel",
  icon: "⚔️",
  position: 4
)

# LIÇÃO 1: Gideão (Juízes 6-7)
puts "  Criando: Gideão..."
lesson_gideao = unit_juizes.lessons.create!(
  name: "Gideão",
  description: "Deus usa um exército de 300 homens para vencer - Juízes 6-7",
  position: 0,
  xp_reward: 15
)

lesson_gideao.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que Gideão estava fazendo quando o anjo do Senhor apareceu?",
      options: ["Malhando trigo no lagar", "Pastoreando ovelhas", "Orando no templo", "Dormindo em casa"]
    },
    correct_answer: { value: "Malhando trigo no lagar" },
    explanation: "Gideão malhava trigo no lagar para escondê-lo dos midianitas (Juízes 6:11)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Quantos homens Deus escolheu para o exército de Gideão?",
      options: ["300", "3.000", "10.000", "32.000"]
    },
    correct_answer: { value: "300" },
    explanation: "Deus reduziu o exército de 32.000 para apenas 300 homens (Juízes 7:7)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Qual sinal Gideão pediu a Deus com a lã?",
      options: ["Que a lã ficasse molhada e o chão seco", "Que a lã ficasse dourada", "Que a lã desaparecesse", "Que a lã pegasse fogo"]
    },
    correct_answer: { value: "Que a lã ficasse molhada e o chão seco" },
    explanation: "Gideão pediu que o orvalho caísse só na lã, deixando o chão seco (Juízes 6:37-38)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "O Senhor está contigo, homem ___",
      word_bank: ["valoroso", "santo", "justo", "forte"],
      reference: "Juízes 6:12"
    },
    correct_answer: { value: "valoroso" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "A espada do Senhor e de ___",
      word_bank: ["Gideão", "Israel", "Deus", "Josué"],
      reference: "Juízes 7:20"
    },
    correct_answer: { value: "Gideão" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Os 300 homens de Gideão usaram tochas, cântaros e trombetas na batalha",
      reference: "Juízes 7:16"
    },
    correct_answer: { value: "true" },
    explanation: "Gideão dividiu os 300 homens e deu a cada um trombeta, cântaro vazio e tocha (Juízes 7:16)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Os midianitas foram derrotados sem que os israelitas precisassem lutar",
      reference: "Juízes 7:22"
    },
    correct_answer: { value: "true" },
    explanation: "Os midianitas entraram em confusão e se voltaram uns contra os outros (Juízes 7:22)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["A", "espada", "do", "Senhor", "e", "de", "Gideão"],
      reference: "Juízes 7:20"
    },
    correct_answer: { order: ["A", "espada", "do", "Senhor", "e", "de", "Gideão"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Lã molhada", "300 homens", "Tochas", "Midianitas"],
      right: ["Sinal de Deus", "Exército de Gideão", "Arma de guerra", "Inimigos de Israel"]
    },
    correct_answer: {
      pairs: {
        "Lã molhada" => "Sinal de Deus",
        "300 homens" => "Exército de Gideão",
        "Tochas" => "Arma de guerra",
        "Midianitas" => "Inimigos de Israel"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "A Vitória de Gideão",
      events: [
        "O anjo do Senhor chama Gideão",
        "Gideão pede sinais com a lã",
        "Deus reduz o exército para 300 homens",
        "Gideão espiona o acampamento midianita",
        "Os 300 tocam trombetas e quebram os cântaros",
        "Os midianitas são derrotados"
      ]
    },
    correct_answer: { order: [
      "O anjo do Senhor chama Gideão",
      "Gideão pede sinais com a lã",
      "Deus reduz o exército para 300 homens",
      "Gideão espiona o acampamento midianita",
      "Os 300 tocam trombetas e quebram os cântaros",
      "Os midianitas são derrotados"
    ] }
  }
])

# LIÇÃO 2: Sansão (Juízes 13-16)
puts "  Criando: Sansão..."
lesson_sansao = unit_juizes.lessons.create!(
  name: "Sansão",
  description: "O homem mais forte de Israel e sua queda - Juízes 13-16",
  position: 1,
  xp_reward: 15
)

lesson_sansao.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Qual era o segredo da força de Sansão?",
      options: ["Seus cabelos nunca cortados", "Sua alimentação especial", "Exercícios diários", "Uma armadura mágica"]
    },
    correct_answer: { value: "Seus cabelos nunca cortados" },
    explanation: "Sansão era nazireu e seu cabelo nunca havia sido cortado (Juízes 16:17)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Quem descobriu o segredo de Sansão e o traiu?",
      options: ["Dalila", "Sua mãe", "Sua esposa timnita", "O sumo sacerdote"]
    },
    correct_answer: { value: "Dalila" },
    explanation: "Dalila insistiu até Sansão revelar seu segredo e o entregou aos filisteus (Juízes 16:18)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que Sansão matou com a queixada de um jumento?",
      options: ["Mil filisteus", "Um leão", "Cem soldados", "Um gigante"]
    },
    correct_answer: { value: "Mil filisteus" },
    explanation: "Com uma queixada de jumento, Sansão matou mil homens (Juízes 15:15)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Sansão era ___ desde o ventre de sua mãe",
      word_bank: ["nazireu", "profeta", "sacerdote", "rei"],
      reference: "Juízes 13:5"
    },
    correct_answer: { value: "nazireu" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Os filisteus furaram os ___ de Sansão depois de capturá-lo",
      word_bank: ["olhos", "ouvidos", "pés", "braços"],
      reference: "Juízes 16:21"
    },
    correct_answer: { value: "olhos" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Sansão matou um leão com as próprias mãos",
      reference: "Juízes 14:6"
    },
    correct_answer: { value: "true" },
    explanation: "O Espírito do Senhor veio sobre Sansão e ele despedaçou o leão (Juízes 14:6)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Sansão morreu sozinho, sem levar nenhum filisteu consigo",
      reference: "Juízes 16:30"
    },
    correct_answer: { value: "false" },
    explanation: "Na sua morte, Sansão matou mais filisteus do que em toda sua vida (Juízes 16:30)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Morra", "eu", "com", "os", "filisteus"],
      reference: "Juízes 16:30"
    },
    correct_answer: { order: ["Morra", "eu", "com", "os", "filisteus"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Cabelos", "Dalila", "Queixada", "Colunas do templo"],
      right: ["Segredo da força", "Traidora", "Arma contra filisteus", "Morte de Sansão"]
    },
    correct_answer: {
      pairs: {
        "Cabelos" => "Segredo da força",
        "Dalila" => "Traidora",
        "Queixada" => "Arma contra filisteus",
        "Colunas do templo" => "Morte de Sansão"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "A História de Sansão",
      events: [
        "Um anjo anuncia o nascimento de Sansão",
        "Sansão mata um leão com as mãos",
        "Sansão mata mil filisteus com uma queixada",
        "Dalila descobre o segredo de Sansão",
        "Sansão é capturado e cegado",
        "Sansão derruba o templo sobre os filisteus"
      ]
    },
    correct_answer: { order: [
      "Um anjo anuncia o nascimento de Sansão",
      "Sansão mata um leão com as mãos",
      "Sansão mata mil filisteus com uma queixada",
      "Dalila descobre o segredo de Sansão",
      "Sansão é capturado e cegado",
      "Sansão derruba o templo sobre os filisteus"
    ] }
  }
])

# LIÇÃO 3: Rute (Rute 1-4)
puts "  Criando: Rute..."
lesson_rute = unit_juizes.lessons.create!(
  name: "Rute",
  description: "A história de lealdade e redenção - Rute 1-4",
  position: 2,
  xp_reward: 15
)

lesson_rute.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "De onde Rute era originária?",
      options: ["Moabe", "Egito", "Filistia", "Edom"]
    },
    correct_answer: { value: "Moabe" },
    explanation: "Rute era moabita, do país de Moabe (Rute 1:4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Quem era a sogra de Rute?",
      options: ["Noemi", "Raquel", "Sara", "Rebeca"]
    },
    correct_answer: { value: "Noemi" },
    explanation: "Noemi era sogra de Rute e voltou a Belém com ela (Rute 1:22)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Com quem Rute se casou em Belém?",
      options: ["Boaz", "Elimeleque", "Obede", "Jessé"]
    },
    correct_answer: { value: "Boaz" },
    explanation: "Boaz era parente de Elimeleque e se casou com Rute (Rute 4:13)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "O teu povo é o meu povo, e o teu ___ é o meu Deus",
      word_bank: ["Deus", "rei", "país", "lar"],
      reference: "Rute 1:16"
    },
    correct_answer: { value: "Deus" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Rute respigava nos campos de ___ atrás dos segadores",
      word_bank: ["cevada", "trigo", "milho", "uva"],
      reference: "Rute 2:17"
    },
    correct_answer: { value: "cevada" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Rute foi bisavó do rei Davi",
      reference: "Rute 4:21-22"
    },
    correct_answer: { value: "true" },
    explanation: "Rute e Boaz tiveram Obede, que gerou Jessé, que gerou Davi (Rute 4:21-22)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Orfa, a outra nora de Noemi, também foi a Belém",
      reference: "Rute 1:14"
    },
    correct_answer: { value: "false" },
    explanation: "Orfa beijou Noemi e voltou para Moabe, mas Rute permaneceu com ela (Rute 1:14)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Aonde", "tu", "fores", "irei", "eu"],
      reference: "Rute 1:16"
    },
    correct_answer: { order: ["Aonde", "tu", "fores", "irei", "eu"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Noemi", "Rute", "Boaz", "Obede"],
      right: ["Sogra", "Moabita fiel", "Remidor", "Filho de Rute"]
    },
    correct_answer: {
      pairs: {
        "Noemi" => "Sogra",
        "Rute" => "Moabita fiel",
        "Boaz" => "Remidor",
        "Obede" => "Filho de Rute"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "A História de Rute",
      events: [
        "Noemi perde o marido e os filhos em Moabe",
        "Rute decide acompanhar Noemi a Belém",
        "Rute respiga nos campos de Boaz",
        "Boaz demonstra bondade a Rute",
        "Boaz se casa com Rute como remidor",
        "Nasce Obede, avô do rei Davi"
      ]
    },
    correct_answer: { order: [
      "Noemi perde o marido e os filhos em Moabe",
      "Rute decide acompanhar Noemi a Belém",
      "Rute respiga nos campos de Boaz",
      "Boaz demonstra bondade a Rute",
      "Boaz se casa com Rute como remidor",
      "Nasce Obede, avô do rei Davi"
    ] }
  }
])

puts "  Unidade 'Juízes e Heróis' criada: #{unit_juizes.lessons.count} lições"

# ============================================
# UNIDADE 6: REIS DE ISRAEL (icon: 👑)
# Cobrindo 1 e 2 Samuel, 1 Reis
# ============================================

puts "Criando Unidade: Reis de Israel..."
unit_reis = at.units.create!(
  name: "Reis de Israel",
  description: "De Samuel a Salomão - a era dos reis",
  icon: "👑",
  position: 5
)

# LIÇÃO 1: Samuel: O Profeta (1 Samuel 1-3)
puts "  Criando: Samuel: O Profeta..."
lesson_samuel = unit_reis.lessons.create!(
  name: "Samuel: O Profeta",
  description: "O menino dedicado a Deus que se tornou profeta - 1 Samuel 1-3",
  position: 0,
  xp_reward: 15
)

lesson_samuel.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Como se chamava a mãe de Samuel?",
      options: ["Ana", "Sara", "Rebeca", "Raquel"]
    },
    correct_answer: { value: "Ana" },
    explanation: "Ana era estéril e orou ao Senhor por um filho, prometendo dedicá-lo (1 Samuel 1:11)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que Ana prometeu fazer com Samuel?",
      options: ["Dedicá-lo ao Senhor todos os dias de sua vida", "Fazê-lo rei", "Enviá-lo ao Egito", "Torná-lo guerreiro"]
    },
    correct_answer: { value: "Dedicá-lo ao Senhor todos os dias de sua vida" },
    explanation: "Ana prometeu dar Samuel ao Senhor por todos os dias de sua vida (1 Samuel 1:11)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Com quem Samuel viveu no templo?",
      options: ["O sacerdote Eli", "O profeta Natã", "O rei Saul", "O sacerdote Zadoque"]
    },
    correct_answer: { value: "O sacerdote Eli" },
    explanation: "Samuel ministrava perante o Senhor na presença de Eli (1 Samuel 2:11)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Fala, Senhor, porque o teu servo ___",
      word_bank: ["ouve", "espera", "obedece", "adora"],
      reference: "1 Samuel 3:9"
    },
    correct_answer: { value: "ouve" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Samuel crescia e o Senhor era com ele, e nenhuma de suas palavras deixou cair em ___",
      word_bank: ["terra", "vão", "esquecimento", "dúvida"],
      reference: "1 Samuel 3:19"
    },
    correct_answer: { value: "terra" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Samuel pensou que Eli o estava chamando quando Deus falou com ele",
      reference: "1 Samuel 3:4-6"
    },
    correct_answer: { value: "true" },
    explanation: "Samuel pensou três vezes que Eli o chamava, até Eli perceber que era o Senhor (1 Samuel 3:4-8)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Os filhos de Eli eram homens justos e tementes a Deus",
      reference: "1 Samuel 2:12"
    },
    correct_answer: { value: "false" },
    explanation: "Os filhos de Eli eram filhos de Belial e não conheciam o Senhor (1 Samuel 2:12)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["Fala", "Senhor", "porque", "o", "teu", "servo", "ouve"],
      reference: "1 Samuel 3:9"
    },
    correct_answer: { order: ["Fala", "Senhor", "porque", "o", "teu", "servo", "ouve"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Ana", "Samuel", "Eli", "Hofni e Fineias"],
      right: ["Mãe que orou", "Profeta de Deus", "Sacerdote idoso", "Filhos perversos"]
    },
    correct_answer: {
      pairs: {
        "Ana" => "Mãe que orou",
        "Samuel" => "Profeta de Deus",
        "Eli" => "Sacerdote idoso",
        "Hofni e Fineias" => "Filhos perversos"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "O Chamado de Samuel",
      events: [
        "Ana ora por um filho em Siló",
        "Samuel nasce e é dedicado ao Senhor",
        "Samuel serve no templo com Eli",
        "Deus chama Samuel durante a noite",
        "Eli ensina Samuel a responder ao Senhor",
        "Samuel se torna profeta em todo Israel"
      ]
    },
    correct_answer: { order: [
      "Ana ora por um filho em Siló",
      "Samuel nasce e é dedicado ao Senhor",
      "Samuel serve no templo com Eli",
      "Deus chama Samuel durante a noite",
      "Eli ensina Samuel a responder ao Senhor",
      "Samuel se torna profeta em todo Israel"
    ] }
  }
])

# LIÇÃO 2: Davi e Golias (1 Samuel 17)
puts "  Criando: Davi e Golias..."
lesson_davi_golias = unit_reis.lessons.create!(
  name: "Davi e Golias",
  description: "O jovem pastor enfrenta o gigante filisteu - 1 Samuel 17",
  position: 1,
  xp_reward: 15
)

lesson_davi_golias.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Qual era a altura aproximada de Golias?",
      options: ["Quase 3 metros", "2 metros", "4 metros", "1,5 metros"]
    },
    correct_answer: { value: "Quase 3 metros" },
    explanation: "Golias tinha seis côvados e um palmo de altura, cerca de 2,9 metros (1 Samuel 17:4)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que Davi usou para derrotar Golias?",
      options: ["Uma funda e uma pedra", "Uma espada", "Uma lança", "Um arco e flecha"]
    },
    correct_answer: { value: "Uma funda e uma pedra" },
    explanation: "Davi tomou uma pedra e a atirou com a funda, acertando Golias na testa (1 Samuel 17:49)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quantas pedras Davi escolheu no ribeiro?",
      options: ["Cinco", "Três", "Sete", "Uma"]
    },
    correct_answer: { value: "Cinco" },
    explanation: "Davi escolheu cinco pedras lisas do ribeiro (1 Samuel 17:40)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Tu vens a mim com espada, e com lança, e com escudo; porém eu venho a ti em nome do ___ dos Exércitos",
      word_bank: ["Senhor", "Deus", "Rei", "Pai"],
      reference: "1 Samuel 17:45"
    },
    correct_answer: { value: "Senhor" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Davi era filho de Jessé, de ___",
      word_bank: ["Belém", "Jerusalém", "Hebrom", "Siló"],
      reference: "1 Samuel 17:58"
    },
    correct_answer: { value: "Belém" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Davi vestiu a armadura de Saul para enfrentar Golias",
      reference: "1 Samuel 17:38-39"
    },
    correct_answer: { value: "false" },
    explanation: "Davi experimentou a armadura de Saul mas a tirou, pois não estava acostumado (1 Samuel 17:39)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Davi tinha experiência em matar leão e urso antes de enfrentar Golias",
      reference: "1 Samuel 17:34-36"
    },
    correct_answer: { value: "true" },
    explanation: "Davi contou a Saul que havia matado um leão e um urso para proteger as ovelhas (1 Samuel 17:34-36)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["A", "batalha", "é", "do", "Senhor"],
      reference: "1 Samuel 17:47"
    },
    correct_answer: { order: ["A", "batalha", "é", "do", "Senhor"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Davi", "Golias", "Funda", "Cinco pedras"],
      right: ["Pastor de ovelhas", "Gigante filisteu", "Arma de Davi", "Do ribeiro"]
    },
    correct_answer: {
      pairs: {
        "Davi" => "Pastor de ovelhas",
        "Golias" => "Gigante filisteu",
        "Funda" => "Arma de Davi",
        "Cinco pedras" => "Do ribeiro"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "Davi e Golias",
      events: [
        "Golias desafia Israel por quarenta dias",
        "Davi chega ao acampamento para levar comida",
        "Davi se oferece para enfrentar Golias",
        "Davi recusa a armadura de Saul",
        "Davi escolhe cinco pedras do ribeiro",
        "Davi acerta Golias na testa com a funda"
      ]
    },
    correct_answer: { order: [
      "Golias desafia Israel por quarenta dias",
      "Davi chega ao acampamento para levar comida",
      "Davi se oferece para enfrentar Golias",
      "Davi recusa a armadura de Saul",
      "Davi escolhe cinco pedras do ribeiro",
      "Davi acerta Golias na testa com a funda"
    ] }
  }
])

# LIÇÃO 3: O Reinado de Davi (2 Samuel)
puts "  Criando: O Reinado de Davi..."
lesson_reinado_davi = unit_reis.lessons.create!(
  name: "O Reinado de Davi",
  description: "Davi se torna rei de Israel - 2 Samuel",
  position: 2,
  xp_reward: 15
)

lesson_reinado_davi.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Qual cidade Davi conquistou para ser a capital de Israel?",
      options: ["Jerusalém", "Hebrom", "Belém", "Samaria"]
    },
    correct_answer: { value: "Jerusalém" },
    explanation: "Davi tomou a fortaleza de Sião, que é a cidade de Davi (Jerusalém) (2 Samuel 5:7)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que Davi trouxe para Jerusalém com grande celebração?",
      options: ["A arca da aliança", "O tabernáculo", "As tábuas da lei", "O candelabro"]
    },
    correct_answer: { value: "A arca da aliança" },
    explanation: "Davi levou a arca de Deus para Jerusalém com alegria (2 Samuel 6:12-15)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quem era o melhor amigo de Davi?",
      options: ["Jônatas", "Abner", "Joabe", "Absalão"]
    },
    correct_answer: { value: "Jônatas" },
    explanation: "A alma de Jônatas se ligou com a de Davi, e Jônatas o amou como a si mesmo (1 Samuel 18:1)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Davi reinou em Hebrom sobre Judá por ___ anos",
      word_bank: ["sete", "quarenta", "três", "dez"],
      reference: "2 Samuel 5:5"
    },
    correct_answer: { value: "sete" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "O profeta ___ confrontou Davi sobre seu pecado com Bate-Seba",
      word_bank: ["Natã", "Samuel", "Gade", "Elias"],
      reference: "2 Samuel 12:1"
    },
    correct_answer: { value: "Natã" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Davi dançou diante da arca quando ela entrou em Jerusalém",
      reference: "2 Samuel 6:14"
    },
    correct_answer: { value: "true" },
    explanation: "Davi dançava com todas as suas forças diante do Senhor (2 Samuel 6:14)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Deus permitiu que Davi construísse o templo em Jerusalém",
      reference: "2 Samuel 7:12-13"
    },
    correct_answer: { value: "false" },
    explanation: "Deus disse que o filho de Davi (Salomão) edificaria o templo, não Davi (2 Samuel 7:12-13)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["O", "Senhor", "é", "meu", "pastor"],
      reference: "Salmo 23:1"
    },
    correct_answer: { order: ["O", "Senhor", "é", "meu", "pastor"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Jerusalém", "Jônatas", "Natã", "Salmos"],
      right: ["Cidade de Davi", "Amigo de Davi", "Profeta que confrontou Davi", "Escritos de Davi"]
    },
    correct_answer: {
      pairs: {
        "Jerusalém" => "Cidade de Davi",
        "Jônatas" => "Amigo de Davi",
        "Natã" => "Profeta que confrontou Davi",
        "Salmos" => "Escritos de Davi"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "O Reinado de Davi",
      events: [
        "Davi é ungido rei em Hebrom",
        "Davi conquista Jerusalém",
        "Davi traz a arca para Jerusalém",
        "Deus promete uma casa eterna a Davi",
        "Davi peca com Bate-Seba",
        "Davi se arrepende após ser confrontado por Natã"
      ]
    },
    correct_answer: { order: [
      "Davi é ungido rei em Hebrom",
      "Davi conquista Jerusalém",
      "Davi traz a arca para Jerusalém",
      "Deus promete uma casa eterna a Davi",
      "Davi peca com Bate-Seba",
      "Davi se arrepende após ser confrontado por Natã"
    ] }
  }
])

# LIÇÃO 4: Salomão: Sabedoria (1 Reis 3)
puts "  Criando: Salomão: Sabedoria..."
lesson_salomao = unit_reis.lessons.create!(
  name: "Salomão: Sabedoria",
  description: "O rei mais sábio da história - 1 Reis 3",
  position: 3,
  xp_reward: 15
)

lesson_salomao.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que Salomão pediu a Deus quando Ele apareceu em sonho?",
      options: ["Sabedoria para governar", "Riquezas", "Vitória sobre inimigos", "Longa vida"]
    },
    correct_answer: { value: "Sabedoria para governar" },
    explanation: "Salomão pediu um coração entendido para julgar o povo (1 Reis 3:9)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Como Salomão resolveu a disputa das duas mulheres sobre o bebê?",
      options: ["Propôs dividir a criança ao meio", "Perguntou a testemunhas", "Fez um sorteio", "Consultou os anciãos"]
    },
    correct_answer: { value: "Propôs dividir a criança ao meio" },
    explanation: "Salomão pediu uma espada para dividir a criança, revelando a verdadeira mãe (1 Reis 3:24-27)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que Salomão construiu para Deus em Jerusalém?",
      options: ["O Templo", "Um palácio", "Uma muralha", "Uma torre"]
    },
    correct_answer: { value: "O Templo" },
    explanation: "Salomão edificou o templo do Senhor em Jerusalém (1 Reis 6:1)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Dá, pois, ao teu servo um coração ___ para julgar o teu povo",
      word_bank: ["entendido", "puro", "forte", "humilde"],
      reference: "1 Reis 3:9"
    },
    correct_answer: { value: "entendido" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "A rainha de ___ veio testar Salomão com perguntas difíceis",
      word_bank: ["Sabá", "Egito", "Tiro", "Moabe"],
      reference: "1 Reis 10:1"
    },
    correct_answer: { value: "Sabá" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Deus deu a Salomão também riquezas e honra, além da sabedoria",
      reference: "1 Reis 3:13"
    },
    correct_answer: { value: "true" },
    explanation: "Deus deu a Salomão o que ele não pediu: riquezas e honra (1 Reis 3:13)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Salomão escreveu o livro de Provérbios",
      reference: "Provérbios 1:1"
    },
    correct_answer: { value: "true" },
    explanation: "O livro de Provérbios contém a sabedoria de Salomão (Provérbios 1:1)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["O", "temor", "do", "Senhor", "é", "o", "princípio", "da", "sabedoria"],
      reference: "Provérbios 9:10"
    },
    correct_answer: { order: ["O", "temor", "do", "Senhor", "é", "o", "princípio", "da", "sabedoria"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Sabedoria", "Templo", "Rainha de Sabá", "Provérbios"],
      right: ["Pedido de Salomão", "Construção de Salomão", "Visitante ilustre", "Livro de Salomão"]
    },
    correct_answer: {
      pairs: {
        "Sabedoria" => "Pedido de Salomão",
        "Templo" => "Construção de Salomão",
        "Rainha de Sabá" => "Visitante ilustre",
        "Provérbios" => "Livro de Salomão"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "A Sabedoria de Salomão",
      events: [
        "Deus aparece a Salomão em sonho",
        "Salomão pede sabedoria",
        "Deus concede sabedoria, riquezas e honra",
        "Salomão julga o caso das duas mães",
        "Salomão constrói o Templo",
        "A rainha de Sabá visita Salomão"
      ]
    },
    correct_answer: { order: [
      "Deus aparece a Salomão em sonho",
      "Salomão pede sabedoria",
      "Deus concede sabedoria, riquezas e honra",
      "Salomão julga o caso das duas mães",
      "Salomão constrói o Templo",
      "A rainha de Sabá visita Salomão"
    ] }
  }
])

puts "  Unidade 'Reis de Israel' criada: #{unit_reis.lessons.count} lições"

# ============================================
# UNIDADE 7: OS PROFETAS (icon: 📢)
# Cobrindo os livros proféticos
# ============================================

puts "Criando Unidade: Os Profetas..."
unit_profetas = at.units.create!(
  name: "Os Profetas",
  description: "Os mensageiros de Deus que anunciaram sua vontade",
  icon: "📢",
  position: 6
)

# LIÇÃO 1: Elias no Monte Carmelo (1 Reis 18)
puts "  Criando: Elias no Monte Carmelo..."
lesson_elias = unit_profetas.lessons.create!(
  name: "Elias no Monte Carmelo",
  description: "Elias desafia os profetas de Baal - 1 Reis 18",
  position: 0,
  xp_reward: 15
)

lesson_elias.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quantos profetas de Baal Elias enfrentou no Monte Carmelo?",
      options: ["450", "100", "50", "1000"]
    },
    correct_answer: { value: "450" },
    explanation: "Elias enfrentou 450 profetas de Baal no Monte Carmelo (1 Reis 18:19)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "O que Elias mandou derramar sobre o altar antes de orar?",
      options: ["Água", "Óleo", "Vinho", "Sangue"]
    },
    correct_answer: { value: "Água" },
    explanation: "Elias mandou derramar água três vezes sobre o altar e a lenha (1 Reis 18:33-34)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "O que aconteceu quando Elias orou?",
      options: ["Fogo do céu consumiu o sacrifício", "Uma tempestade veio", "Um terremoto aconteceu", "Uma voz do céu falou"]
    },
    correct_answer: { value: "Fogo do céu consumiu o sacrifício" },
    explanation: "O fogo do Senhor caiu e consumiu o holocausto, a lenha, as pedras e a água (1 Reis 18:38)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Até quando coxeareis entre dois pensamentos? Se o Senhor é Deus, segui-o; se ___, segui-o",
      word_bank: ["Baal", "Faraó", "Moloque", "Asera"],
      reference: "1 Reis 18:21"
    },
    correct_answer: { value: "Baal" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Elias era profeta durante o reinado do rei ___",
      word_bank: ["Acabe", "Davi", "Salomão", "Josias"],
      reference: "1 Reis 18:1"
    },
    correct_answer: { value: "Acabe" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Os profetas de Baal clamaram o dia todo mas não houve resposta",
      reference: "1 Reis 18:29"
    },
    correct_answer: { value: "true" },
    explanation: "Os profetas de Baal clamaram desde a manhã até a hora da oferta, mas não houve resposta (1 Reis 18:26-29)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Depois da vitória no Carmelo, Elias anunciou o fim da seca",
      reference: "1 Reis 18:41"
    },
    correct_answer: { value: "true" },
    explanation: "Elias disse a Acabe que subisse para comer porque havia som de abundante chuva (1 Reis 18:41)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["O", "Senhor", "é", "Deus", "o", "Senhor", "é", "Deus"],
      reference: "1 Reis 18:39"
    },
    correct_answer: { order: ["O", "Senhor", "é", "Deus", "o", "Senhor", "é", "Deus"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Elias", "Baal", "Monte Carmelo", "Fogo do céu"],
      right: ["Profeta de Deus", "Falso deus", "Local do confronto", "Resposta de Deus"]
    },
    correct_answer: {
      pairs: {
        "Elias" => "Profeta de Deus",
        "Baal" => "Falso deus",
        "Monte Carmelo" => "Local do confronto",
        "Fogo do céu" => "Resposta de Deus"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "Elias no Monte Carmelo",
      events: [
        "Elias desafia os profetas de Baal",
        "Os profetas de Baal clamam sem resposta",
        "Elias prepara o altar e derrama água",
        "Elias ora ao Senhor",
        "Fogo do céu consome o sacrifício",
        "O povo proclama: O Senhor é Deus!"
      ]
    },
    correct_answer: { order: [
      "Elias desafia os profetas de Baal",
      "Os profetas de Baal clamam sem resposta",
      "Elias prepara o altar e derrama água",
      "Elias ora ao Senhor",
      "Fogo do céu consome o sacrifício",
      "O povo proclama: O Senhor é Deus!"
    ] }
  }
])

# LIÇÃO 2: Jonas e o Grande Peixe (Jonas 1-4)
puts "  Criando: Jonas e o Grande Peixe..."
lesson_jonas = unit_profetas.lessons.create!(
  name: "Jonas e o Grande Peixe",
  description: "O profeta que fugiu de Deus - Jonas 1-4",
  position: 1,
  xp_reward: 15
)

lesson_jonas.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Para qual cidade Deus enviou Jonas pregar?",
      options: ["Nínive", "Babilônia", "Damasco", "Jerusalém"]
    },
    correct_answer: { value: "Nínive" },
    explanation: "Deus ordenou a Jonas que fosse a Nínive pregar contra ela (Jonas 1:2)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Para onde Jonas fugiu em vez de ir a Nínive?",
      options: ["Társis", "Egito", "Jope", "Samaria"]
    },
    correct_answer: { value: "Társis" },
    explanation: "Jonas fugiu para Társis, na direção oposta a Nínive (Jonas 1:3)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quanto tempo Jonas ficou dentro do grande peixe?",
      options: ["Três dias e três noites", "Sete dias", "Quarenta dias", "Um dia"]
    },
    correct_answer: { value: "Três dias e três noites" },
    explanation: "Jonas esteve no ventre do peixe três dias e três noites (Jonas 1:17)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Ainda ___ dias, e Nínive será destruída",
      word_bank: ["quarenta", "sete", "três", "dez"],
      reference: "Jonas 3:4"
    },
    correct_answer: { value: "quarenta" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "A salvação vem do ___",
      word_bank: ["Senhor", "céu", "alto", "templo"],
      reference: "Jonas 2:9"
    },
    correct_answer: { value: "Senhor" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "Os ninivitas se arrependeram quando ouviram a pregação de Jonas",
      reference: "Jonas 3:5"
    },
    correct_answer: { value: "true" },
    explanation: "Os homens de Nínive creram em Deus e proclamaram um jejum (Jonas 3:5)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Jonas ficou feliz quando Deus poupou Nínive",
      reference: "Jonas 4:1"
    },
    correct_answer: { value: "false" },
    explanation: "Jonas ficou muito irado porque Deus teve compaixão de Nínive (Jonas 4:1)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["A", "salvação", "vem", "do", "Senhor"],
      reference: "Jonas 2:9"
    },
    correct_answer: { order: ["A", "salvação", "vem", "do", "Senhor"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Nínive", "Társis", "Grande peixe", "Planta"],
      right: ["Destino de Jonas", "Fuga de Jonas", "Engoliu Jonas", "Sombra para Jonas"]
    },
    correct_answer: {
      pairs: {
        "Nínive" => "Destino de Jonas",
        "Társis" => "Fuga de Jonas",
        "Grande peixe" => "Engoliu Jonas",
        "Planta" => "Sombra para Jonas"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "A História de Jonas",
      events: [
        "Deus manda Jonas ir a Nínive",
        "Jonas foge para Társis",
        "Uma tempestade atinge o navio",
        "Jonas é lançado ao mar e engolido pelo peixe",
        "Jonas ora no ventre do peixe",
        "Jonas prega em Nínive e a cidade se arrepende"
      ]
    },
    correct_answer: { order: [
      "Deus manda Jonas ir a Nínive",
      "Jonas foge para Társis",
      "Uma tempestade atinge o navio",
      "Jonas é lançado ao mar e engolido pelo peixe",
      "Jonas ora no ventre do peixe",
      "Jonas prega em Nínive e a cidade se arrepende"
    ] }
  }
])

# LIÇÃO 3: Daniel na Cova dos Leões (Daniel 6)
puts "  Criando: Daniel na Cova dos Leões..."
lesson_daniel = unit_profetas.lessons.create!(
  name: "Daniel na Cova dos Leões",
  description: "Daniel é protegido por Deus na cova dos leões - Daniel 6",
  position: 2,
  xp_reward: 15
)

lesson_daniel.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Por que Daniel foi lançado na cova dos leões?",
      options: ["Porque continuou orando a Deus", "Porque desobedeceu ao rei", "Porque roubou ouro", "Porque fugiu do palácio"]
    },
    correct_answer: { value: "Porque continuou orando a Deus" },
    explanation: "Daniel continuou orando três vezes ao dia, mesmo após o decreto proibindo (Daniel 6:10)."
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Quantas vezes por dia Daniel orava?",
      options: ["Três vezes", "Uma vez", "Sete vezes", "Duas vezes"]
    },
    correct_answer: { value: "Três vezes" },
    explanation: "Daniel se ajoelhava três vezes por dia para orar (Daniel 6:10)."
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Quem era o rei quando Daniel foi lançado aos leões?",
      options: ["Dario", "Nabucodonosor", "Ciro", "Belsazar"]
    },
    correct_answer: { value: "Dario" },
    explanation: "O rei Dario assinou o decreto e depois se entristeceu ao saber que Daniel seria punido (Daniel 6:9,14)."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "O meu Deus enviou o seu ___ e fechou a boca dos leões",
      word_bank: ["anjo", "servo", "profeta", "espírito"],
      reference: "Daniel 6:22"
    },
    correct_answer: { value: "anjo" }
  },
  {
    exercise_type: :fill_blank,
    position: 4,
    xp_value: 10,
    content: {
      text: "Daniel tinha um espírito excelente e o rei pensava em colocá-lo sobre todo o ___",
      word_bank: ["reino", "exército", "templo", "tesouro"],
      reference: "Daniel 6:3"
    },
    correct_answer: { value: "reino" }
  },
  {
    exercise_type: :true_false,
    position: 5,
    xp_value: 10,
    content: {
      statement: "O rei Dario ficou feliz ao condenar Daniel",
      reference: "Daniel 6:14"
    },
    correct_answer: { value: "false" },
    explanation: "O rei ficou muito triste e tentou livrar Daniel até o pôr do sol (Daniel 6:14)."
  },
  {
    exercise_type: :true_false,
    position: 6,
    xp_value: 10,
    content: {
      statement: "Depois que Daniel foi salvo, o rei decretou que todos temessem o Deus de Daniel",
      reference: "Daniel 6:26"
    },
    correct_answer: { value: "true" },
    explanation: "Dario decretou que em todo o reino se temesse o Deus de Daniel (Daniel 6:26)."
  },
  {
    exercise_type: :order_words,
    position: 7,
    xp_value: 15,
    content: {
      words: ["O", "meu", "Deus", "enviou", "o", "seu", "anjo"],
      reference: "Daniel 6:22"
    },
    correct_answer: { order: ["O", "meu", "Deus", "enviou", "o", "seu", "anjo"] }
  },
  {
    exercise_type: :connect_pairs,
    position: 8,
    xp_value: 15,
    content: {
      left: ["Daniel", "Dario", "Leões", "Anjo de Deus"],
      right: ["Orava três vezes", "Rei da Pérsia", "Não feriram Daniel", "Fechou a boca dos leões"]
    },
    correct_answer: {
      pairs: {
        "Daniel" => "Orava três vezes",
        "Dario" => "Rei da Pérsia",
        "Leões" => "Não feriram Daniel",
        "Anjo de Deus" => "Fechou a boca dos leões"
      }
    }
  },
  {
    exercise_type: :sequence_story,
    position: 9,
    xp_value: 20,
    content: {
      title: "Daniel na Cova dos Leões",
      events: [
        "Conselheiros tramam contra Daniel",
        "O rei assina um decreto proibindo orar a outro deus",
        "Daniel continua orando três vezes ao dia",
        "Daniel é denunciado e lançado aos leões",
        "Deus envia um anjo para proteger Daniel",
        "O rei decreta que todos temam o Deus de Daniel"
      ]
    },
    correct_answer: { order: [
      "Conselheiros tramam contra Daniel",
      "O rei assina um decreto proibindo orar a outro deus",
      "Daniel continua orando três vezes ao dia",
      "Daniel é denunciado e lançado aos leões",
      "Deus envia um anjo para proteger Daniel",
      "O rei decreta que todos temam o Deus de Daniel"
    ] }
  }
])

puts "  Unidade 'Os Profetas' criada: #{unit_profetas.lessons.count} lições"

# ============================================
# RESUMO FINAL
# ============================================

puts "\n=== Resumo da Expansão do Antigo Testamento ==="
at.reload
total_units = at.units.count
total_lessons = at.units.sum { |u| u.lessons.count }
total_exercises = at.units.sum { |u| u.lessons.sum { |l| l.exercises.count } }

puts "  Unidades: #{total_units}"
puts "  Lições: #{total_lessons}"
puts "  Exercícios: #{total_exercises}"
puts "=== Expansão concluída! ==="

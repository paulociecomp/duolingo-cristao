puts "Limpando dados existentes..."
SpacedRepetitionCard.destroy_all
UserDailyMission.destroy_all
DailyMission.destroy_all
LeagueParticipant.destroy_all
LeagueSeason.destroy_all
League.destroy_all
UserBadge.destroy_all
Badge.destroy_all
UserStreak.destroy_all
UserExerciseAttempt.destroy_all
UserLessonAttempt.destroy_all
UserTrackProgress.destroy_all
Exercise.destroy_all
Lesson.destroy_all
Unit.destroy_all
Track.destroy_all

puts "Criando Ligas..."
leagues_data = [
  { name: "Bronze", slug: "bronze", tier: 1, icon: "🥉", color: "#CD7F32", min_xp_to_promote: 100 },
  { name: "Prata", slug: "prata", tier: 2, icon: "🥈", color: "#C0C0C0", min_xp_to_promote: 200 },
  { name: "Ouro", slug: "ouro", tier: 3, icon: "🥇", color: "#FFD700", min_xp_to_promote: 350 },
  { name: "Platina", slug: "platina", tier: 4, icon: "💎", color: "#E5E4E2", min_xp_to_promote: 500 },
  { name: "Diamante", slug: "diamante", tier: 5, icon: "💠", color: "#B9F2FF", min_xp_to_promote: 750 },
  { name: "Mestre", slug: "mestre", tier: 6, icon: "👑", color: "#9400D3", min_xp_to_promote: 1000 },
  { name: "Grão-Mestre", slug: "grao-mestre", tier: 7, icon: "🏆", color: "#FF4500", min_xp_to_promote: 9999 }
]

leagues_data.each { |data| League.create!(data) }
puts "  #{League.count} ligas criadas"

puts "Criando Badges..."
badges_data = [
  # Streak badges
  { name: "Primeiro Dia", slug: "streak-1", description: "Complete seu primeiro dia de estudo", icon: "🔥", category: :streak, requirement_type: "streak", requirement_value: 1, xp_reward: 10 },
  { name: "Uma Semana", slug: "streak-7", description: "7 dias consecutivos de estudo", icon: "🔥", category: :streak, requirement_type: "streak", requirement_value: 7, xp_reward: 50 },
  { name: "Um Mês", slug: "streak-30", description: "30 dias consecutivos de estudo", icon: "🔥", category: :streak, requirement_type: "streak", requirement_value: 30, xp_reward: 150 },
  { name: "100 Dias", slug: "streak-100", description: "100 dias consecutivos!", icon: "💯", category: :streak, requirement_type: "streak", requirement_value: 100, xp_reward: 500 },
  { name: "Um Ano", slug: "streak-365", description: "365 dias consecutivos!", icon: "🏆", category: :streak, requirement_type: "streak", requirement_value: 365, xp_reward: 2000 },

  # XP badges
  { name: "Iniciante", slug: "xp-100", description: "Ganhe 100 XP", icon: "⭐", category: :xp, requirement_type: "xp", requirement_value: 100, xp_reward: 10 },
  { name: "Estudante", slug: "xp-500", description: "Ganhe 500 XP", icon: "⭐", category: :xp, requirement_type: "xp", requirement_value: 500, xp_reward: 25 },
  { name: "Dedicado", slug: "xp-1000", description: "Ganhe 1000 XP", icon: "🌟", category: :xp, requirement_type: "xp", requirement_value: 1000, xp_reward: 50 },
  { name: "Mestre", slug: "xp-5000", description: "Ganhe 5000 XP", icon: "💫", category: :xp, requirement_type: "xp", requirement_value: 5000, xp_reward: 100 },
  { name: "Lenda", slug: "xp-10000", description: "Ganhe 10000 XP", icon: "🏅", category: :xp, requirement_type: "xp", requirement_value: 10000, xp_reward: 250 },

  # Lesson badges
  { name: "Primeira Lição", slug: "lessons-1", description: "Complete sua primeira lição", icon: "📖", category: :lessons, requirement_type: "lessons", requirement_value: 1, xp_reward: 10 },
  { name: "10 Lições", slug: "lessons-10", description: "Complete 10 lições", icon: "📚", category: :lessons, requirement_type: "lessons", requirement_value: 10, xp_reward: 30 },
  { name: "50 Lições", slug: "lessons-50", description: "Complete 50 lições", icon: "📚", category: :lessons, requirement_type: "lessons", requirement_value: 50, xp_reward: 100 },
  { name: "100 Lições", slug: "lessons-100", description: "Complete 100 lições", icon: "📚", category: :lessons, requirement_type: "lessons", requirement_value: 100, xp_reward: 200 },

  # Perfect badges
  { name: "Perfeição", slug: "perfect-1", description: "Complete uma lição sem erros", icon: "✨", category: :perfect, requirement_type: "perfect", requirement_value: 1, xp_reward: 15 },
  { name: "5 Perfeitas", slug: "perfect-5", description: "Complete 5 lições perfeitas", icon: "✨", category: :perfect, requirement_type: "perfect", requirement_value: 5, xp_reward: 40 },
  { name: "25 Perfeitas", slug: "perfect-25", description: "Complete 25 lições perfeitas", icon: "💎", category: :perfect, requirement_type: "perfect", requirement_value: 25, xp_reward: 150 },

  # Level badges
  { name: "Nível 5", slug: "level-5", description: "Alcance o nível 5", icon: "🎯", category: :special, requirement_type: "level", requirement_value: 5, xp_reward: 25 },
  { name: "Nível 10", slug: "level-10", description: "Alcance o nível 10", icon: "🎯", category: :special, requirement_type: "level", requirement_value: 10, xp_reward: 50 },
  { name: "Nível 25", slug: "level-25", description: "Alcance o nível 25", icon: "🎯", category: :special, requirement_type: "level", requirement_value: 25, xp_reward: 150 },
  { name: "Nível 50", slug: "level-50", description: "Alcance o nível 50", icon: "👑", category: :special, requirement_type: "level", requirement_value: 50, xp_reward: 500 }
]

badges_data.each { |data| Badge.create!(data) }
puts "  #{Badge.count} badges criados"

puts "Criando Missões Diárias..."
missions_data = [
  { name: "Ganhe 30 XP", description: "Estude e ganhe 30 pontos de experiência", mission_type: "earn_xp", target_value: 30, xp_reward: 10, gem_reward: 1, icon: "⭐" },
  { name: "Ganhe 50 XP", description: "Estude e ganhe 50 pontos de experiência", mission_type: "earn_xp", target_value: 50, xp_reward: 20, gem_reward: 2, icon: "⭐" },
  { name: "Ganhe 100 XP", description: "Estude e ganhe 100 pontos de experiência", mission_type: "earn_xp", target_value: 100, xp_reward: 35, gem_reward: 5, icon: "🌟" },
  { name: "Complete 1 Lição", description: "Complete uma lição hoje", mission_type: "complete_lessons", target_value: 1, xp_reward: 10, gem_reward: 1, icon: "📖" },
  { name: "Complete 3 Lições", description: "Complete três lições hoje", mission_type: "complete_lessons", target_value: 3, xp_reward: 25, gem_reward: 3, icon: "📚" },
  { name: "Lição Perfeita", description: "Complete uma lição sem erros", mission_type: "perfect_lessons", target_value: 1, xp_reward: 30, gem_reward: 5, icon: "✨" }
]

missions_data.each { |data| DailyMission.create!(data) }
puts "  #{DailyMission.count} missões criadas"

puts "Criando Trilhas..."
tracks_data = [
  { name: "Novo Testamento", slug: "novo-testamento", description: "Aprenda sobre a vida de Jesus e os apóstolos", icon: "📖", color: "#4F46E5", position: 0, published: true },
  { name: "Antigo Testamento", slug: "antigo-testamento", description: "Histórias e profetas do Antigo Testamento", icon: "📜", color: "#059669", position: 1, published: true },
  { name: "Salmos", slug: "salmos", description: "Os cânticos e louvores de Davi", icon: "🎵", color: "#7C3AED", position: 2, published: true },
  { name: "Provérbios", slug: "proverbios", description: "Sabedoria para a vida diária", icon: "💡", color: "#D97706", position: 3, published: true },
  { name: "Parábolas de Jesus", slug: "parabolas", description: "As histórias que Jesus contou", icon: "🌾", color: "#DC2626", position: 4, published: true },
  { name: "Milagres de Jesus", slug: "milagres", description: "Os milagres realizados por Cristo", icon: "✨", color: "#0891B2", position: 5, published: true },
  { name: "Apóstolos", slug: "apostolos", description: "A vida dos doze apóstolos", icon: "👥", color: "#4338CA", position: 6, published: true },
  { name: "Apocalipse", slug: "apocalipse", description: "As revelações do fim dos tempos", icon: "🌅", color: "#BE185D", position: 7, published: true }
]

tracks_data.each { |data| Track.create!(data) }
puts "  #{Track.count} trilhas criadas"

# Novo Testamento - Trilha Completa
puts "Criando conteúdo do Novo Testamento..."
nt = Track.find_by(slug: "novo-testamento")

# Unidade 1: Nascimento de Jesus
unit1 = nt.units.create!(name: "O Nascimento de Jesus", description: "A chegada do Messias", icon: "⭐", position: 0)

lesson1 = unit1.lessons.create!(name: "A Anunciação", description: "O anjo Gabriel visita Maria", position: 0, xp_reward: 15)
lesson1.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Qual anjo apareceu para Maria?",
      options: ["Gabriel", "Miguel", "Rafael", "Uriel"]
    },
    correct_answer: { value: "Gabriel" },
    explanation: "O anjo Gabriel foi enviado por Deus para anunciar a Maria que ela seria mãe do Salvador (Lucas 1:26-28)."
  },
  {
    exercise_type: :true_false,
    position: 1,
    xp_value: 10,
    content: {
      statement: "Maria era noiva de José quando o anjo apareceu",
      reference: "Lucas 1:27"
    },
    correct_answer: { value: "true" },
    explanation: "Maria estava prometida em casamento a José, um homem da linhagem de Davi."
  },
  {
    exercise_type: :fill_blank,
    position: 2,
    xp_value: 10,
    content: {
      text: "Ave, ___ de graça, o Senhor é contigo",
      word_bank: ["cheia", "filha", "mulher", "serva"],
      reference: "Lucas 1:28"
    },
    correct_answer: { value: "cheia" }
  },
  {
    exercise_type: :multiple_choice,
    position: 3,
    xp_value: 10,
    content: {
      question: "Como seria chamado o filho de Maria, segundo o anjo?",
      options: ["Jesus", "Emanuel", "João", "Samuel"]
    },
    correct_answer: { value: "Jesus" },
    explanation: "O anjo disse: 'Eis que conceberás e darás à luz um filho, e lhe porás o nome de Jesus' (Lucas 1:31)."
  },
  {
    exercise_type: :order_words,
    position: 4,
    xp_value: 15,
    content: {
      words: ["Eis", "aqui", "a", "serva", "do", "Senhor"],
      reference: "Lucas 1:38"
    },
    correct_answer: { order: ["Eis", "aqui", "a", "serva", "do", "Senhor"] }
  }
])

lesson2 = unit1.lessons.create!(name: "O Nascimento em Belém", description: "Jesus nasce em uma manjedoura", position: 1, xp_reward: 15)
lesson2.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Em qual cidade Jesus nasceu?",
      options: ["Belém", "Nazaré", "Jerusalém", "Cafarnaum"]
    },
    correct_answer: { value: "Belém" }
  },
  {
    exercise_type: :true_false,
    position: 1,
    xp_value: 10,
    content: {
      statement: "Jesus nasceu em um hotel luxuoso",
      reference: "Lucas 2:7"
    },
    correct_answer: { value: "false" },
    explanation: "Jesus nasceu em uma manjedoura, pois não havia lugar para eles na hospedaria."
  },
  {
    exercise_type: :fill_blank,
    position: 2,
    xp_value: 10,
    content: {
      text: "E deu à luz o seu filho ___, e envolveu-o em panos",
      word_bank: ["primogênito", "segundo", "único", "escolhido"],
      reference: "Lucas 2:7"
    },
    correct_answer: { value: "primogênito" }
  },
  {
    exercise_type: :multiple_choice,
    position: 3,
    xp_value: 10,
    content: {
      question: "Quem visitou Jesus primeiro após seu nascimento?",
      options: ["Pastores", "Reis Magos", "Sacerdotes", "Soldados"]
    },
    correct_answer: { value: "Pastores" }
  },
  {
    exercise_type: :order_words,
    position: 4,
    xp_value: 15,
    content: {
      words: ["Glória", "a", "Deus", "nas", "alturas"],
      reference: "Lucas 2:14"
    },
    correct_answer: { order: ["Glória", "a", "Deus", "nas", "alturas"] }
  }
])

lesson3 = unit1.lessons.create!(name: "Os Reis Magos", description: "Sábios do oriente visitam Jesus", position: 2, xp_reward: 15)
lesson3.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "O que guiou os reis magos até Jesus?",
      options: ["Uma estrela", "Um anjo", "Uma nuvem", "O vento"]
    },
    correct_answer: { value: "Uma estrela" }
  },
  {
    exercise_type: :true_false,
    position: 1,
    xp_value: 10,
    content: {
      statement: "Os reis magos trouxeram ouro, incenso e mirra",
      reference: "Mateus 2:11"
    },
    correct_answer: { value: "true" }
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Qual rei queria saber onde Jesus nasceu para adorá-lo?",
      options: ["Herodes", "César", "Pilatos", "Davi"]
    },
    correct_answer: { value: "Herodes" },
    explanation: "Herodes na verdade queria matar Jesus, não adorá-lo."
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "E, abrindo os seus tesouros, ofertaram-lhe ___",
      word_bank: ["dádivas", "animais", "roupas", "joias"],
      reference: "Mateus 2:11"
    },
    correct_answer: { value: "dádivas" }
  }
])

# Unidade 2: Ministério de Jesus
unit2 = nt.units.create!(name: "O Ministério de Jesus", description: "Jesus ensina e realiza milagres", icon: "✝️", position: 1)

lesson4 = unit2.lessons.create!(name: "O Batismo de Jesus", description: "João Batista batiza Jesus no Jordão", position: 0, xp_reward: 15)
lesson4.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quem batizou Jesus?",
      options: ["João Batista", "Pedro", "Tiago", "André"]
    },
    correct_answer: { value: "João Batista" }
  },
  {
    exercise_type: :true_false,
    position: 1,
    xp_value: 10,
    content: {
      statement: "Após o batismo, o Espírito Santo desceu como uma pomba",
      reference: "Mateus 3:16"
    },
    correct_answer: { value: "true" }
  },
  {
    exercise_type: :fill_blank,
    position: 2,
    xp_value: 10,
    content: {
      text: "Este é o meu Filho ___, em quem me comprazo",
      word_bank: ["amado", "único", "escolhido", "santo"],
      reference: "Mateus 3:17"
    },
    correct_answer: { value: "amado" }
  },
  {
    exercise_type: :multiple_choice,
    position: 3,
    xp_value: 10,
    content: {
      question: "Em qual rio Jesus foi batizado?",
      options: ["Jordão", "Nilo", "Eufrates", "Tigre"]
    },
    correct_answer: { value: "Jordão" }
  }
])

lesson5 = unit2.lessons.create!(name: "Os Doze Apóstolos", description: "Jesus escolhe seus discípulos", position: 1, xp_reward: 15)
lesson5.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quantos apóstolos Jesus escolheu?",
      options: ["12", "7", "10", "5"]
    },
    correct_answer: { value: "12" }
  },
  {
    exercise_type: :true_false,
    position: 1,
    xp_value: 10,
    content: {
      statement: "Pedro e André eram irmãos",
      reference: "Mateus 4:18"
    },
    correct_answer: { value: "true" }
  },
  {
    exercise_type: :multiple_choice,
    position: 2,
    xp_value: 10,
    content: {
      question: "Qual era a profissão de Pedro e André?",
      options: ["Pescadores", "Carpinteiros", "Pastores", "Agricultores"]
    },
    correct_answer: { value: "Pescadores" }
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Vinde após mim, e eu vos farei ___ de homens",
      word_bank: ["pescadores", "mestres", "líderes", "salvadores"],
      reference: "Mateus 4:19"
    },
    correct_answer: { value: "pescadores" }
  }
])

# Unidade 3: Sermão da Montanha
unit3 = nt.units.create!(name: "Sermão da Montanha", description: "Os ensinamentos de Jesus", icon: "⛰️", position: 2)

lesson6 = unit3.lessons.create!(name: "As Bem-aventuranças", description: "Bem-aventurados são...", position: 0, xp_reward: 15)
lesson6.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Quem são bem-aventurados, segundo Jesus?",
      options: ["Os pobres de espírito", "Os ricos", "Os poderosos", "Os famosos"]
    },
    correct_answer: { value: "Os pobres de espírito" }
  },
  {
    exercise_type: :order_words,
    position: 1,
    xp_value: 15,
    content: {
      words: ["Bem-aventurados", "os", "mansos", "porque", "herdarão", "a", "terra"],
      reference: "Mateus 5:5"
    },
    correct_answer: { order: ["Bem-aventurados", "os", "mansos", "porque", "herdarão", "a", "terra"] }
  },
  {
    exercise_type: :true_false,
    position: 2,
    xp_value: 10,
    content: {
      statement: "Bem-aventurados os que choram, porque serão consolados",
      reference: "Mateus 5:4"
    },
    correct_answer: { value: "true" }
  },
  {
    exercise_type: :fill_blank,
    position: 3,
    xp_value: 10,
    content: {
      text: "Bem-aventurados os pacificadores, porque serão chamados ___ de Deus",
      word_bank: ["filhos", "servos", "amigos", "anjos"],
      reference: "Mateus 5:9"
    },
    correct_answer: { value: "filhos" }
  }
])

puts "  Novo Testamento: #{nt.units.count} unidades, #{nt.lessons.count} lições, #{nt.lessons.sum { |l| l.exercises.count }} exercícios"

# Criar conteúdo básico para outras trilhas
puts "Criando conteúdo das outras trilhas..."

# Antigo Testamento
at = Track.find_by(slug: "antigo-testamento")
unit_at1 = at.units.create!(name: "A Criação", description: "No princípio Deus criou", icon: "🌍", position: 0)
lesson_at1 = unit_at1.lessons.create!(name: "Deus cria o mundo", description: "Os sete dias da criação", position: 0, xp_reward: 15)
lesson_at1.exercises.create!([
  {
    exercise_type: :multiple_choice,
    position: 0,
    xp_value: 10,
    content: {
      question: "Em quantos dias Deus criou o mundo?",
      options: ["6 dias", "7 dias", "3 dias", "40 dias"]
    },
    correct_answer: { value: "6 dias" },
    explanation: "Deus criou tudo em 6 dias e descansou no sétimo (Gênesis 2:2)."
  },
  {
    exercise_type: :true_false,
    position: 1,
    xp_value: 10,
    content: {
      statement: "A luz foi criada no primeiro dia",
      reference: "Gênesis 1:3"
    },
    correct_answer: { value: "true" }
  },
  {
    exercise_type: :order_words,
    position: 2,
    xp_value: 15,
    content: {
      words: ["No", "princípio", "Deus", "criou", "os", "céus", "e", "a", "terra"],
      reference: "Gênesis 1:1"
    },
    correct_answer: { order: ["No", "princípio", "Deus", "criou", "os", "céus", "e", "a", "terra"] }
  }
])

# Salmos
salmos = Track.find_by(slug: "salmos")
unit_salmos = salmos.units.create!(name: "Salmo 23", description: "O Senhor é meu pastor", icon: "🐑", position: 0)
lesson_salmos = unit_salmos.lessons.create!(name: "O Bom Pastor", description: "Deus cuida de nós", position: 0, xp_reward: 15)
lesson_salmos.exercises.create!([
  {
    exercise_type: :fill_blank,
    position: 0,
    xp_value: 10,
    content: {
      text: "O Senhor é meu ___, nada me faltará",
      word_bank: ["pastor", "rei", "amigo", "guia"],
      reference: "Salmo 23:1"
    },
    correct_answer: { value: "pastor" }
  },
  {
    exercise_type: :order_words,
    position: 1,
    xp_value: 15,
    content: {
      words: ["Deitar-me", "faz", "em", "verdes", "pastos"],
      reference: "Salmo 23:2"
    },
    correct_answer: { order: ["Deitar-me", "faz", "em", "verdes", "pastos"] }
  },
  {
    exercise_type: :true_false,
    position: 2,
    xp_value: 10,
    content: {
      statement: "No Salmo 23, Davi diz que não temerá mal nenhum, pois Deus está com ele",
      reference: "Salmo 23:4"
    },
    correct_answer: { value: "true" }
  }
])

# Provérbios
proverbios = Track.find_by(slug: "proverbios")
unit_prov = proverbios.units.create!(name: "Sabedoria", description: "O temor do Senhor", icon: "📚", position: 0)
lesson_prov = unit_prov.lessons.create!(name: "O Início da Sabedoria", description: "Temor do Senhor é o princípio", position: 0, xp_reward: 15)
lesson_prov.exercises.create!([
  {
    exercise_type: :fill_blank,
    position: 0,
    xp_value: 10,
    content: {
      text: "O temor do Senhor é o princípio da ___",
      word_bank: ["sabedoria", "riqueza", "fama", "força"],
      reference: "Provérbios 9:10"
    },
    correct_answer: { value: "sabedoria" }
  },
  {
    exercise_type: :multiple_choice,
    position: 1,
    xp_value: 10,
    content: {
      question: "Segundo Provérbios, o que é melhor que ouro?",
      options: ["Sabedoria", "Prata", "Terras", "Gado"]
    },
    correct_answer: { value: "Sabedoria" }
  }
])

total_exercises = Exercise.count
total_lessons = Lesson.count
total_units = Unit.count

# Load expanded lessons
load Rails.root.join("db/seeds/expanded_lessons.rb")

# Load expanded Old Testament
load Rails.root.join("db/seeds/antigo_testamento_expanded.rb")

# Load Old Testament complement (complete 5 lessons per unit)
load Rails.root.join("db/seeds/antigo_testamento_complemento.rb")

puts "\n=== Resumo Final dos Seeds ==="
puts "  Trilhas: #{Track.count}"
puts "  Unidades: #{Unit.count}"
puts "  Lições: #{Lesson.count}"
puts "  Exercícios: #{Exercise.count}"
puts "  Ligas: #{League.count}"
puts "  Badges: #{Badge.count}"
puts "  Missões: #{DailyMission.count}"
puts "\nSeeds concluídos com sucesso!"

puts "Cleaning database..."
Family.destroy_all
User.destroy_all
Story.destroy_all

puts "Creating users..."

first_user = User.create!(
  first_name: "Greg",
  last_name: "Ramos",
  email: "first@gmail.com",
  password: "azerty"
)

puts "Created #{first_user.email}!"

puts "Creating families..."

family_one = Family.create!(
  owner: first_user,
  name: "#{first_user.last_name} Family"
)

puts "Created #{family_one.name}!"

UserFamily.create!(role: 'parent', family: family_one, user: first_user)

puts "Creating kids..."

first_kid = Kid.create!(
  first_name: "Elodie",
  date_of_birth: Date.new(2018, 5, 12),
  family: family_one
)
file = URI.open("https://images.unsplash.com/photo-1554342321-0776d282ceac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80")
first_kid.photo.attach(io: file, filename: "elodie.jpg", content_type: "image/jpg")

second_kid = Kid.create!(
  first_name: "Paolo",
  date_of_birth: Date.new(2016, 10, 9),
  family: family_one
)

file = URI.open("https://images.unsplash.com/photo-1552873816-636e43209957?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&amp;auto=format&amp;fit=crop&amp;w=1631&amp;q=80")
second_kid.photo.attach(io: file, filename: "elia.jpg", content_type: "image/jpg")

puts "Created kids!"


puts "Creating stories..."

first_story = Story.create!({
  title: "une forêt enchantée",
  theme: "aventure",
  content: "Il était une fois, dans un petit village au cœur d’une forêt enchantée, vivait un jeune garçon nommé Hugo.",
  kid_id: Kid.first.id,
  prompt: "raconte-nous une histoire avec Hugo en personnage principale",
  lenght: 1,
  duration: 200
})

puts "Creating questions..."

question_teddy = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

question_date_of_birth = Question.create!(
  title: "Quel est la date de naissance de votre enfant?",
  contextual: false
)

question_dish = Question.create!(
  title: "Quel est le plat préféré de votre enfant ?",
  contextual: false
)

question_toy = Question.create!(
  title: "Quel est le jouet préféré de votre enfant ?",
  contextual: false
)

question_favorite_pet = Question.create!(
  title: "Quel animal préféré de votre enfant ?",
  contextual: false
)

question_book = Question.create!(
  title: "Quel est le livre préféré de votre enfant ?",
  contextual: false
)

question_song = Question.create!(
  title: "Quelle est la chanson préférée de votre enfant ?",
  contextual: false
)

question_pet = Question.create!(
  title: "Est-ce que votre enfant a un animal de compagnie ? De quel animal s’agit-il et quel est son nom ?",
  contextual: false
)

question_dad = Question.create!(
  title: "Comment s’appelle le papa de votre enfant ?",
  contextual: false
)

question_mum = Question.create!(
  title: "Comment s’appelle la maman de votre enfant ?",
  contextual: false
)

question_magical_place = Question.create!(
  title: "Quel genre d'endroits magiques ou fantastiques votre enfant aimerait visiter ?",
  contextual: true
)

question_values = Question.create!(
  title: "Quelles sont les valeurs importantes que vous souhaitez transmettre à travers cette histoire ?",
  contextual: true
)

question_leson = Question.create!(
  title: "Y a-t-il une leçon importante que vous voulez que votre enfant apprenne dans l'histoire ?",
  contextual: true
)

question_fears = Question.create!(
  title: "votre enfant a-t-il une peur ou une difficulté particulière à surmonter ?",
  contextual: true
)

puts "Created questions!"

puts "Creating answers..."

Answer.create!(
  content: "Rexo",
  kid: first_kid,
  question: question_teddy
)

puts "Created answers!"

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

question_one = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

puts "Created questions!"

puts "Creating answers..."

Answer.create!(
  content: "Rexo",
  kid: first_kid,
  question: question_one
)

puts "Created answers!"

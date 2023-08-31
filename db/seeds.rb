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


second_story = Story.create!({
  title: "une nouvelle histoire",
  theme: "aventure",
  content: "Il était une fois une petite fille nommée Elodie, âgée de 5 ans, qui aimait plus que tout les histoires d'aventure. Chaque soir, avant d'aller dormir, sa maman lui racontait une histoire magique qui l'emmenait dans des contrées lointaines et mystérieuses.Un soir, alors qu'il faisait déjà nuit, Elodie s'endormit en rêvant d'une nouvelle aventure. Dans son sommeil, elle se retrouva sur un magnifique bateau pirate, voguant sur une mer étincelante. À bord, elle rencontra le capitaine Barbe Rousse, un pirate au cœur tendre.Le capitaine Barbe Rousse expliqua à Elodie qu'il cherchait un trésor légendaire caché sur une île mystérieuse. Intriguée, Elodie décida de l'aider dans sa quête. Le bateau pirate les transporta jusqu'à l'île, où les attendaient de nombreux défis.Ils devaient traverser une jungle dense remplie d'animaux sauvages. Elodie, courageuse et intrépide, était accompagnée d'un perroquet parlant nommé Coco, qui les guidait à travers les lianes et les arbres majestueux. Ils durent également traverser un pont étroit au-dessus d'un précipice profond. Elodie tenait la main du capitaine, ne montrant aucune peur malgré les vertiges.Enfin, ils atteignirent une grotte sombre et mystérieuse. À l'intérieur, ils découvrirent des énigmes à résoudre pour accéder au trésor. Elodie, avec son esprit vif et sa curiosité sans limite, résolut chaque énigme avec l'aide du capitaine Barbe Rousse.Finalement, ils atteignirent la salle du trésor. Devant leurs yeux émerveillés, se trouvait un coffre en bois orné de bijoux scintillants. Le capitaine Barbe Rousse et Elodie s'embrassèrent joyeusement en signe de victoire.De retour sur le bateau pirate, ils partagèrent le trésor avec leur équipage. Chacun reçut une pièce d'or en souvenir de cette incroyable aventure. Elodie se sentait fière et heureuse d'avoir aidé le capitaine et d'avoir vécu une telle aventure.Le capitaine Barbe Rousse raccompagna Elodie jusqu'à chez elle, où sa maman l'attendait, inquiète. Elodie lui raconta tout, les dangers traversés, les énigmes résolues et le trésor découvert. Sa maman sourit, heureuse de voir briller les yeux de sa petite aventurière.De ce jour-là, Elodie savait qu'elle pouvait vivre de grandes aventures, même dans son imagination. Chaque nuit, elle s'endormait en rêvant d'une nouvelle aventure, prête à partir à la découverte de mondes merveilleux. Et c'est ainsi que Elodie devint la plus grande aventurière de son monde imaginaire."
  kid_id: Kid.second.id,
  prompt: "Agis comme un auteur pour enfants à succès. Ecris-moi une histoire moyenne sur le thème Aventure pour Elodie qui a 5 ans.",
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

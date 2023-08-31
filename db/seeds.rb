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
  name: first_user.last_name
)

puts "Created #{family_one.name}!"

UserFamily.create!(role: 'parent', family: family_one, user: first_user)

puts "Creating kids..."

first_kid = Kid.create!(
  first_name: "Élodie",
  date_of_birth: Date.new(2018, 5, 12),
  family: family_one,
  avatar_file_name: "photo1.jpg"
)

second_kid = Kid.create!(
  first_name: "Paolo",
  date_of_birth: Date.new(2016, 10, 9),
  family: family_one,
  avatar_file_name: "photo2.jpg"
)

puts "Created kids!"

puts "Creating stories"

Story.create!({
    title: "Élodie et la Forêt Enchantée",
    theme: "Conte de fée",
    content: "Il était une fois une petite fille nommée Élodie, âgée de 5 ans, qui vivait dans un petit village entouré d'une vaste forêt. Élodie était une enfant curieuse et pleine d'imagination. Elle adorait explorer la nature et se perdre dans ses pensées. Un jour, alors qu'Élodie se promenait en bordure de la forêt, elle remarqua quelque chose d'extraordinaire. Les arbres semblaient plus grands et plus verts que d'habitude, et les oiseaux chantaient une mélodie magique. Intriguée, Élodie décida de s'aventurer plus profondément dans la forêt. À mesure qu'elle avançait, les arbres s'écartaient pour laisser place à un chemin lumineux et scintillant. Élodie poussa un petit cri de joie et commença à suivre ce chemin magique. Elle se sentait comme une princesse dans un conte de fées. Bientôt, Élodie arriva à une clairière où elle découvrit un groupe d'animaux enchantés en train de danser joyeusement. Il y avait des lapins qui sautaient gracieusement, des écureuils qui faisaient des pirouettes, et même des papillons qui volaient en formant de jolis motifs. Élodie se joignit à leur danse, riant et tournant avec eux. Après un moment, les animaux enchantés s'arrêtèrent pour remercier Élodie de les avoir rejoints. Ils lui expliquèrent que cette forêt était spéciale, qu'elle ne pouvait être trouvée que par ceux qui avaient un cœur pur et une grande imagination. Élodie se sentit très spéciale. Les animaux lui dirent aussi que la forêt avait besoin de son aide. Une étrange malédiction avait été jetée sur elle, et seuls les enfants comme Élodie pouvaient la briser. Élodie accepta courageusement cette mission et promit de faire de son mieux. Elle se mit en route avec ses nouveaux amis enchantés pour résoudre les énigmes et briser la malédiction. Ils traversèrent des rivières étincelantes, escaladèrent des montagnes enchantées, et résolurent des énigmes mystérieuses. Chaque étape de leur voyage était remplie d'aventures incroyables. Finalement, Élodie découvrit la source de la malédiction, un méchant sorcier qui vivait au cœur de la forêt. Avec l'aide de ses amis enchantés, elle réussit à convaincre le sorcier de retirer la malédiction. La forêt enchantée fut libérée de son sortilège, et Élodie reçut un cadeau spécial en retour : une petite étoile magique qui brillait dans sa main. Elle était maintenant la gardienne de la forêt enchantée. Élodie revint chez elle, mais elle ne cessa jamais de visiter la forêt enchantée avec son étoile magique. Elle partagea ses histoires avec les autres enfants du village, les invitant à la rejoindre dans ses aventures magiques. Et ainsi, grâce à la pureté de son cœur et à son imagination, Élodie vécut de merveilleuses aventures dans la forêt enchantée pour le reste de ses jours, enseignant aux autres enfants que la magie peut être trouvée partout, si vous y croyez vraiment.",
    kid_id: Kid.first.id,
    lenght: 1,
    duration: 200
})


Story.create!({
  title: "une nouvelle histoire",
  theme: "aventure",
  content: "Il était une fois une petite fille nommée Elodie, âgée de 5 ans, qui aimait plus que tout les histoires d'aventure. Chaque soir, avant d'aller dormir, sa maman lui racontait une histoire magique qui l'emmenait dans des contrées lointaines et mystérieuses.Un soir, alors qu'il faisait déjà nuit, Elodie s'endormit en rêvant d'une nouvelle aventure. Dans son sommeil, elle se retrouva sur un magnifique bateau pirate, voguant sur une mer étincelante. À bord, elle rencontra le capitaine Barbe Rousse, un pirate au cœur tendre.Le capitaine Barbe Rousse expliqua à Elodie qu'il cherchait un trésor légendaire caché sur une île mystérieuse. Intriguée, Elodie décida de l'aider dans sa quête. Le bateau pirate les transporta jusqu'à l'île, où les attendaient de nombreux défis.Ils devaient traverser une jungle dense remplie d'animaux sauvages. Elodie, courageuse et intrépide, était accompagnée d'un perroquet parlant nommé Coco, qui les guidait à travers les lianes et les arbres majestueux. Ils durent également traverser un pont étroit au-dessus d'un précipice profond. Elodie tenait la main du capitaine, ne montrant aucune peur malgré les vertiges.Enfin, ils atteignirent une grotte sombre et mystérieuse. À l'intérieur, ils découvrirent des énigmes à résoudre pour accéder au trésor. Elodie, avec son esprit vif et sa curiosité sans limite, résolut chaque énigme avec l'aide du capitaine Barbe Rousse.Finalement, ils atteignirent la salle du trésor. Devant leurs yeux émerveillés, se trouvait un coffre en bois orné de bijoux scintillants. Le capitaine Barbe Rousse et Elodie s'embrassèrent joyeusement en signe de victoire.De retour sur le bateau pirate, ils partagèrent le trésor avec leur équipage. Chacun reçut une pièce d'or en souvenir de cette incroyable aventure. Elodie se sentait fière et heureuse d'avoir aidé le capitaine et d'avoir vécu une telle aventure.Le capitaine Barbe Rousse raccompagna Elodie jusqu'à chez elle, où sa maman l'attendait, inquiète. Elodie lui raconta tout, les dangers traversés, les énigmes résolues et le trésor découvert. Sa maman sourit, heureuse de voir briller les yeux de sa petite aventurière.De ce jour-là, Elodie savait qu'elle pouvait vivre de grandes aventures, même dans son imagination. Chaque nuit, elle s'endormait en rêvant d'une nouvelle aventure, prête à partir à la découverte de mondes merveilleux. Et c'est ainsi que Elodie devint la plus grande aventurière de son monde imaginaire."
  kid_id: Kid.second.id,
  prompt: "Agis comme un auteur pour enfants à succès. Ecris-moi une histoire moyenne sur le thème Aventure pour Elodie qui a 5 ans.",
  lenght: 1,
  duration: 200
})

puts "Story 1 created"

Story.create!({
    title: "Le Doudou Magique",
    theme: "Aventure",
    content: "Il était une fois une petite fille nommée Élodie, qui avait un doudou très spécial appelé Poupon. Poupon n'était pas un doudou ordinaire ; il était magique. Chaque nuit, lorsque Léa s'endormait en le serrant dans ses bras, quelque chose d'extraordinaire se produisait. Un soir, alors que Léa était profondément endormie, Poupon s'anima doucement. Il se leva de son lit et se mit à explorer la maison. Dans sa quête de découverte, il rencontra le chat de Léa, Monsieur Whiskers, qui était toujours un peu distant. Mais grâce à la magie de Poupon, Monsieur Whiskers se mit à parler et à jouer avec lui. Ensuite, Poupon se faufila dans la cuisine, où il découvrit une boîte de biscuits. Avec un coup de baguette magique, les biscuits s'envolèrent et se mirent à danser autour de Poupon. Ils avaient une fête de minuit, mangeant des biscuits et riant joyeusement. Poupon entendit ensuite des pleurs venant de la chambre de Léa. Il se précipita vers sa petite amie et, d'un câlin magique, sécha ses larmes. Léa sourit dans son sommeil et murmura : Poupon, tu es le meilleur doudou du monde. Le lendemain matin, lorsque Léa se réveilla, elle trouva des miettes de biscuits dans la cuisine, et Monsieur Whiskers était tout câlin et affectueux. Léa savait que Poupon avait encore une fois fait des merveilles pendant la nuit. Et ainsi, chaque nuit, Poupon le doudou magique continuait à apporter la magie et la joie dans la vie de Léa, lui montrant que même les choses les plus ordinaires peuvent être extraordinaires avec un peu de magie et d'amour.",
    kid_id: Kid.first.id,
    lenght: 2,
    duration: 200
})

puts "Story 2 created"

Story.create!({
    title: "Élodie et la Licorne Enchantée",
    theme: "Mystère",
    content: "Il était une fois, dans un petit village au cœur d’une forêt enchantée, vivait un jeune garçon nommé Élodie.",
    kid_id: Kid.first.id,
    lenght: 1,
    duration: 200
})

puts "Story 3 created"

puts "Creating questions..."

question_one = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

question_two = Question.create!(
  title: "Quel est la date de naissance de #{@kid.first_name}?",
  contextual: false
)

question_three = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

question_four = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

question_five = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

question_six = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

question_seven = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

question_eight = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

question_nine = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

question_ten = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

question_eleven = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)
puts "Created questions!"

puts "Creating answers..."

Answer.create!(
  content: "Rexo",
  kid: Kid.first,
  question: question_one
)

puts "Created answers!"

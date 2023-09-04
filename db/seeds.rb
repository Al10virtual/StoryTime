puts "Cleaning database..."

Family.destroy_all
User.destroy_all
Story.destroy_all

puts "Creating users..."

first_user = User.create!(
  first_name: "Guillaume",
  last_name: "Planche",
  email: "first@gmail.com",
  password: "azerty",
  admin: true
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
                title: "La Forêt Perdue",
                theme: "Conte de fée",
                content: "Il était une fois une petite fille nommée Élodie, âgée de 5 ans, qui vivait dans un petit village entouré d'une vaste forêt. Élodie était une enfant curieuse et pleine d'imagination. Elle adorait explorer la nature et se perdre dans ses pensées. Un jour, alors qu'Élodie se promenait en bordure de la forêt, elle remarqua quelque chose d'extraordinaire. Les arbres semblaient plus grands et plus verts que d'habitude, et les oiseaux chantaient une mélodie magique. Intriguée, Élodie décida de s'aventurer plus profondément dans la forêt. À mesure qu'elle avançait, les arbres s'écartaient pour laisser place à un chemin lumineux et scintillant. Élodie poussa un petit cri de joie et commença à suivre ce chemin magique. Elle se sentait comme une princesse dans un conte de fées. Bientôt, Élodie arriva à une clairière où elle découvrit un groupe d'animaux enchantés en train de danser joyeusement. Il y avait des lapins qui sautaient gracieusement, des écureuils qui faisaient des pirouettes, et même des papillons qui volaient en formant de jolis motifs. Élodie se joignit à leur danse, riant et tournant avec eux. Après un moment, les animaux enchantés s'arrêtèrent pour remercier Élodie de les avoir rejoints. Ils lui expliquèrent que cette forêt était spéciale, qu'elle ne pouvait être trouvée que par ceux qui avaient un cœur pur et une grande imagination. Élodie se sentit très spéciale. Les animaux lui dirent aussi que la forêt avait besoin de son aide. Une étrange malédiction avait été jetée sur elle, et seuls les enfants comme Élodie pouvaient la briser. Élodie accepta courageusement cette mission et promit de faire de son mieux. Elle se mit en route avec ses nouveaux amis enchantés pour résoudre les énigmes et briser la malédiction. Ils traversèrent des rivières étincelantes, escaladèrent des montagnes enchantées, et résolurent des énigmes mystérieuses. Chaque étape de leur voyage était remplie d'aventures incroyables. Finalement, Élodie découvrit la source de la malédiction, un méchant sorcier qui vivait au cœur de la forêt. Avec l'aide de ses amis enchantés, elle réussit à convaincre le sorcier de retirer la malédiction. La forêt enchantée fut libérée de son sortilège, et Élodie reçut un cadeau spécial en retour : une petite étoile magique qui brillait dans sa main. Elle était maintenant la gardienne de la forêt enchantée. Élodie revint chez elle, mais elle ne cessa jamais de visiter la forêt enchantée avec son étoile magique. Elle partagea ses histoires avec les autres enfants du village, les invitant à la rejoindre dans ses aventures magiques. Et ainsi, grâce à la pureté de son cœur et à son imagination, Élodie vécut de merveilleuses aventures dans la forêt enchantée pour le reste de ses jours, enseignant aux autres enfants que la magie peut être trouvée partout, si vous y croyez vraiment.",
                kid_id: Kid.first.id,
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
                title: "La Licorne Enchantée",
                theme: "Mystère",
                content: "Il était une fois, dans un petit village au cœur d’une forêt enchantée, vivait un jeune garçon nommé Élodie.",
                kid_id: Kid.first.id,
                lenght: 1,
                duration: 200
              })

puts "Story 3 created"

puts "Creating questions..."

Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

Question.create!(
  title: "Quel est la date de naissance de votre enfant?",
  contextual: false
)

Question.create!(
  title: "Quel est le plat préféré de votre enfant ?",
  contextual: false
)

Question.create!(
  title: "Quel est le jouet préféré de votre enfant ?",
  contextual: false
)

Question.create!(
  title: "Quel animal préféré de votre enfant ?",
  contextual: false
)

Question.create!(
  title: "Quel est le livre préféré de votre enfant ?",
  contextual: false
)

Question.create!(
  title: "Quelle est la chanson préférée de votre enfant ?",
  contextual: false
)

Question.create!(
  title: "Est-ce que votre enfant a un animal de compagnie ? De quel animal s’agit-il et quel est son nom ?",
  contextual: false
)

Question.create!(
  title: "Comment s’appelle le papa de votre enfant ?",
  contextual: false
)

Question.create!(
  title: "Comment s’appelle la maman de votre enfant ?",
  contextual: false
)

Question.create!(
  title: "Quel genre d'endroits magiques ou fantastiques votre enfant aimerait visiter ?",
  contextual: true
)

Question.create!(
  title: "Quelles sont les valeurs importantes que vous souhaitez transmettre à travers cette histoire ?",
  contextual: true
)

Question.create!(
  title: "Y a-t-il une leçon importante que vous voulez que votre enfant apprenne dans l'histoire ?",
  contextual: true
)

Question.create!(
  title: "votre enfant a-t-il une peur ou une difficulté particulière à surmonter ?",
  contextual: true
)

puts "Created questions!"

puts "Creating answers..."

Answer.create!(
  content: "Youki",
  kid: Kid.first,
  question: Question.first
)

puts "Created answers!"

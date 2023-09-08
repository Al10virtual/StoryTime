puts "Cleaning database..."

Family.destroy_all
User.destroy_all
Story.destroy_all

puts "Creating users..."

first_user = User.create!(
  first_name: "Arnaud",
  last_name: "Legaignoux",
  email: "first@gmail.com",
  password: "azerty",
  admin: true
)

puts "Created #{first_user.email}!"

puts "Creating families..."

first_family = Family.create!(
  owner: first_user,
  name: first_user.last_name
)
puts "Created #{Family.offset(0).first.name}!"

UserFamily.create!(role: 'parent', family: first_family, user: first_user)

puts "Creating kids..."

first_kid = Kid.create!(
  first_name: "Élodie",
  date_of_birth: Date.new(2018, 5, 12),
  family: first_family,
  avatar_file_name: "kid1.jpg"
)

second_kid = Kid.create!(
  first_name: "Paolo",
  date_of_birth: Date.new(2016, 10, 9),
  family: first_family,
  avatar_file_name: "kid2.jpg"
)

puts "Created kids!"

puts "Creating stories..."

story1 = Story.create!({
                title: "La Forêt Perdue",
                theme: "Conte de fée",
                content: "Il était une fois une petite fille nommée Élodie, âgée de 5 ans, qui vivait dans un petit village entouré d'une vaste forêt. Élodie était une enfant curieuse et pleine d'imagination. Elle adorait explorer la nature et se perdre dans ses pensées. Un jour, alors qu'Élodie se promenait en bordure de la forêt, elle remarqua quelque chose d'extraordinaire. Les arbres semblaient plus grands et plus verts que d'habitude, et les oiseaux chantaient une mélodie magique. Intriguée, Élodie décida de s'aventurer plus profondément dans la forêt. À mesure qu'elle avançait, les arbres s'écartaient pour laisser place à un chemin lumineux et scintillant. Élodie poussa un petit cri de joie et commença à suivre ce chemin magique. Elle se sentait comme une princesse dans un conte de fées. Bientôt, Élodie arriva à une clairière où elle découvrit un groupe d'animaux enchantés en train de danser joyeusement. Il y avait des lapins qui sautaient gracieusement, des écureuils qui faisaient des pirouettes, et même des papillons qui volaient en formant de jolis motifs. Élodie se joignit à leur danse, riant et tournant avec eux. Après un moment, les animaux enchantés s'arrêtèrent pour remercier Élodie de les avoir rejoints. Ils lui expliquèrent que cette forêt était spéciale, qu'elle ne pouvait être trouvée que par ceux qui avaient un cœur pur et une grande imagination. Élodie se sentit très spéciale. Les animaux lui dirent aussi que la forêt avait besoin de son aide. Une étrange malédiction avait été jetée sur elle, et seuls les enfants comme Élodie pouvaient la briser. Élodie accepta courageusement cette mission et promit de faire de son mieux. Elle se mit en route avec ses nouveaux amis enchantés pour résoudre les énigmes et briser la malédiction. Ils traversèrent des rivières étincelantes, escaladèrent des montagnes enchantées, et résolurent des énigmes mystérieuses. Chaque étape de leur voyage était remplie d'aventures incroyables. Finalement, Élodie découvrit la source de la malédiction, un méchant sorcier qui vivait au cœur de la forêt. Avec l'aide de ses amis enchantés, elle réussit à convaincre le sorcier de retirer la malédiction. La forêt enchantée fut libérée de son sortilège, et Élodie reçut un cadeau spécial en retour : une petite étoile magique qui brillait dans sa main. Elle était maintenant la gardienne de la forêt enchantée. Élodie revint chez elle, mais elle ne cessa jamais de visiter la forêt enchantée avec son étoile magique. Elle partagea ses histoires avec les autres enfants du village, les invitant à la rejoindre dans ses aventures magiques. Et ainsi, grâce à la pureté de son cœur et à son imagination, Élodie vécut de merveilleuses aventures dans la forêt enchantée pour le reste de ses jours, enseignant aux autres enfants que la magie peut être trouvée partout, si vous y croyez vraiment.",
                kid_id: first_kid.id,
                length: 2,
                duration: 200,
                cover_file_name: "story1.png"
              })

GenerateStoryAudioJob.perform_now(story1)

puts "Story 1 created!"

story2 = Story.create!({
                title: "La Licorne Enchantée",
                theme: "Mystère",
                content: "Élodie était une jeune fille exceptionnellement curieuse et aventurière, bien différente des autres enfants de son village. Alors que les enfants de son âge se contentaient de jouer près des maisons, Élodie préférait s'aventurer plus loin dans la forêt enchantée qui entourait leur petit hameau. Sa mère, une sage femme du village, lui avait toujours raconté des histoires sur la magie de la forêt et les créatures mystiques qui la peuplaient. Élodie adorait ces histoires et rêvait de rencontrer un jour l'une de ces créatures. Un matin, alors qu'elle errait plus profondément dans la forêt que d'habitude, Élodie découvrit un sentier secret qu'elle n'avait jamais vu auparavant. Intriguée, elle décida de le suivre. Plus elle avançait, plus la forêt semblait se transformer. Les arbres étaient plus grands, les fleurs plus brillantes, et l'air était rempli d'une aura magique. Au détour du sentier, Élodie fit une rencontre incroyable. Elle tomba nez à nez avec une licorne majestueuse. La créature était d'un blanc éclatant, avec une corne étincelante au milieu du front. La licorne s'appelait Luna et possédait une sagesse et une grâce inégalées. Elle était la gardienne de la forêt enchantée et avait senti la pureté du cœur d'Élodie. Luna expliqua à Élodie que la forêt était en danger, menacée par une obscurité grandissante qui risquait de la détruire. Elle avait besoin d'aide pour sauver la forêt et restaurer son équilibre. Élodie, bien qu'effrayée par la tâche qui l'attendait, accepta sans hésiter. Luna et Élodie formèrent une alliance extraordinaire. La jeune fille apprit les secrets de la magie de la forêt et développa une connexion profonde avec les créatures qui y vivaient. Ensemble, ils entreprirent un voyage pour combattre les forces obscures qui menaçaient la forêt enchantée, dans l'espoir de ramener la lumière et la magie dans leur monde.",
                kid_id: first_kid.id,
                length: 1,
                duration: 200,
                cover_file_name: "story2.png"
              })

GenerateStoryAudioJob.perform_now(story2)

puts "Story 2 created!"

story3 = Story.create!({
                title: "Le Doudou Magique",
                theme: "Aventure",
                content: "Il était une fois une petite fille nommée Élodie, qui avait un doudou très spécial appelé Poupon. Poupon n'était pas un doudou ordinaire ; il était magique. Chaque nuit, lorsque Léa s'endormait en le serrant dans ses bras, quelque chose d'extraordinaire se produisait. Un soir, alors que Léa était profondément endormie, Poupon s'anima doucement. Il se leva de son lit et se mit à explorer la maison. Dans sa quête de découverte, il rencontra le chat de Léa, Monsieur Whiskers, qui était toujours un peu distant. Mais grâce à la magie de Poupon, Monsieur Whiskers se mit à parler et à jouer avec lui. Ensuite, Poupon se faufila dans la cuisine, où il découvrit une boîte de biscuits. Avec un coup de baguette magique, les biscuits s'envolèrent et se mirent à danser autour de Poupon. Ils avaient une fête de minuit, mangeant des biscuits et riant joyeusement. Poupon entendit ensuite des pleurs venant de la chambre de Léa. Il se précipita vers sa petite amie et, d'un câlin magique, sécha ses larmes. Léa sourit dans son sommeil et murmura : Poupon, tu es le meilleur doudou du monde. Le lendemain matin, lorsque Léa se réveilla, elle trouva des miettes de biscuits dans la cuisine, et Monsieur Whiskers était tout câlin et affectueux. Léa savait que Poupon avait encore une fois fait des merveilles pendant la nuit. Et ainsi, chaque nuit, Poupon le doudou magique continuait à apporter la magie et la joie dans la vie de Léa, lui montrant que même les choses les plus ordinaires peuvent être extraordinaires avec un peu de magie et d'amour.",
                kid_id: first_kid.id,
                length: 0,
                duration: 200,
                cover_file_name: "story3.png"
              })

GenerateStoryAudioJob.perform_now(story3)

puts "Story 3 created!"

story4 = Story.create!({
                title: "Paolo et le Trésor de Tortuga",
                theme: "Aventure",
                content: "Il était une fois, dans un petit port paisible appelé Porto Paolo, un garçon intrépide nommé Paolo. Paolo vivait avec sa grand-mère, Maria, qui lui avait toujours raconté des histoires passionnantes de pirates et de trésors perdus. Paolo adorait ces récits et rêvait de devenir un pirate courageux lui-même. Un matin, alors que le soleil se levait sur l'horizon, un vieux grimoire poussiéreux tomba du grenier de la maison de Maria. Paolo le ramassa et commença à le feuilleter. À sa grande surprise, il trouva une carte au trésor dessinée à l'intérieur, indiquant l'emplacement de l'île mystérieuse de Tortuga d'où les pirates légendaires avaient jadis amassé d'innombrables richesses. Paolo était excité comme jamais. Il savait que c'était sa chance de vivre une véritable aventure de pirate. Il prépara rapidement son petit bateau et se dirigea vers l'océan, suivi de son fidèle perroquet, Rico, qui avait toujours rêvé de voler avec un vrai pirate. La route vers Tortuga était semée d'embûches. Paolo et Rico affrontèrent des tempêtes violentes, évitèrent de justesse des récifs acérés et firent la connaissance de marins légendaires. Finalement, ils atteignirent l'île de Tortuga. Les palmiers ondulaient au vent, et l'île semblait être un véritable paradis pour les pirates. Paolo et Rico fouillèrent l'île de fond en comble, creusant des trous et suivant les indices de la carte au trésor. Après de nombreuses aventures et épreuves, ils découvrirent enfin le trésor tant convoité. Des coffres en bois doré remplis de pièces d'or scintillantes, de perles précieuses et de bijoux étincelants. Mais Paolo savait que la vraie richesse n'était pas dans l'or, mais dans l'aventure qu'il avait vécue et dans les amis qu'il avait rencontrés en cours de route. Il décida de partager sa découverte avec les habitants de Porto Paolo pour améliorer leur vie. Le petit village de Porto Paolo fut transformé par ce trésor inattendu. Paolo et sa grand-mère Maria vécurent heureux et comblés, et le nom de Paolo devint célèbre dans toute la région en tant que courageux capitaine pirate. Paolo avait réalisé son rêve de devenir un pirate, mais il avait également découvert la vraie valeur de l'aventure, de l'amitié et du partage. Et ainsi se termine l'histoire de Paolo, le petit pirate au grand cœur, dont la légende perdura à travers les générations.",
                kid_id: second_kid.id,
                length: 0,
                duration: 200,
                cover_file_name: "story4.png"
              })

GenerateStoryAudioJob.perform_now(story4)

puts "Story 4 created!"

puts "Creating questions..."

question1 = Question.create!(
  title: "Quel est le prénom de son doudou ?",
  contextual: false
)

question2 = Question.create!(
  title: "Quel est son plat préféré ?",
  contextual: false
)

question3 = Question.create!(
  title: "Quel est son jouet préféré ?",
  contextual: false
)

question4 = Question.create!(
  title: "Quel est son animal préféré ?",
  contextual: false
)

question5 = Question.create!(
  title: "Quel est son livre préféré ?",
  contextual: false
)

question6 = Question.create!(
  title: "Quelle est sa chanson préférée ?",
  contextual: false
)

question7 = Question.create!(
  title: "A-t-il un animal de compagnie ? Si oui, comment s'appelle-t-il ?",
  contextual: false
)

question8 = Question.create!(
  title: "Comment s'appelle son papa ?",
  contextual: false
)

question9 = Question.create!(
  title: "Comment s'appelle sa maman ?",
  contextual: false
)

question10 = Question.create!(
  title: "Quelle sa couleur préférée ?",
  contextual: false
)

puts "Created question!"

puts "Creating contextual questions..."

Question.create!(
  title: "Quel genre d'endroits magiques votre enfant aimerait-il visiter aujourd'hui ?",
  contextual: true
)

Question.create!(
  title: "Quelles valeurs importantes voulez-vous transmettre à travers cette histoire ?",
  contextual: true
)

Question.create!(
  title: "Y a-t-il une leçon importante que vous voulez faire apparaître dans l'histoire ?",
  contextual: true
)

Question.create!(
  title: "Votre enfant a-t-il une peur ou une difficulté particulière à surmonter ?",
  contextual: true
)

Question.create!(
  title: "Quel est le cadeau que votre enfant aimerait recevoir pour son anniversaire ?",
  contextual: true
)

Question.create!(
  title: "De quoi votre enfant a-t-il peur ?",
  contextual: true
)

puts "Created contextual questions!"

puts "Creating answers for #{first_kid.first_name}..."

Answer.create!(
  content: "Pipou",
  kid: Kid.first,
  question: question1
)

Answer.create!(
  content: "Les pâtes au beurre",
  kid: Kid.first,
  question: question2
)

Answer.create!(
  content: "La poupée Dora",
  kid: Kid.first,
  question: question3
)

Answer.create!(
  content: "Les papillons",
  kid: Kid.first,
  question: question4
)

Answer.create!(
  content: "Le chat Croquette",
  kid: Kid.first,
  question: question7
)

Answer.create!(
  content: "Guillaume",
  kid: Kid.first,
  question: question8
)

Answer.create!(
  content: "Marie",
  kid: Kid.first,
  question: question9
)

puts "Creating answers for #{second_kid.first_name}..."

Answer.create!(
  content: "Après la pluie",
  kid: Kid.second,
  question: question5
)

Answer.create!(
  content: "Marie",
  kid: Kid.second,
  question: question9
)

Answer.create!(
  content: "Les canards",
  kid: Kid.second,
  question: question4
)

Answer.create!(
  content: "Les pizzas",
  kid: Kid.second,
  question: question2
)

Answer.create!(
  content: "Flash McQueen",
  kid: Kid.second,
  question: question3
)

puts "Created answers!"

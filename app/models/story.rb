class Story < ApplicationRecord
  THEMES = ["Aventure", "Conte de fée", "Fantaisie", "Historique", "Mystère", "Educatif"]
  belongs_to :kid
  has_one_attached :audio
  enum :lenght, {
    courte: 0,
    moyenne: 1,
    longue: 2
  }
end

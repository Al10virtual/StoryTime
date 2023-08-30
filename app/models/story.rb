class Story < ApplicationRecord
  THEMES = ["Aventure", "Conte de fée", "Fantaisie", "Historique", "Mystère", "Educatif"]
  belongs_to :kid
  has_one_attached :audio
  enum :lenght, {
    Courte: 0,
    Moyenne: 1,
    Longue: 2
  }
end

class Story < ApplicationRecord
  THEMES = ["Aventure", "Conte de fée", "Fantaisie", "Historique", "Mystère", "Educatif"]

  belongs_to :kid
  has_one_attached :audio
  has_one_attached :image
  enum :length, {
    courte: 0,
    moyenne: 1,
    longue: 2
  }

  def self.label_for_form
    durations = {
      courte: "2 min",
      moyenne: "5 min",
      longue: "10 min"
    }
    lengths.keys.map do |length|
      [durations[length.to_sym]].join(" ")
    end
  end
end

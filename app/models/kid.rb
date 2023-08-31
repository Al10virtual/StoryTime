class Kid < ApplicationRecord
  belongs_to :family
  has_one_attached :photo
  has_many :stories, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers

  def age
    today = Date.today
    age = today.year - date_of_birth.year
    age -= 1 if today < date_of_birth + age.years
    age
  end
end

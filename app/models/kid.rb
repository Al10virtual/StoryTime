class Kid < ApplicationRecord
  belongs_to :family
  has_one_attached :photo
  has_many :stories, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers
end

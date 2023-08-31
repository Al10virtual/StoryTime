class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :kids, through: :answers
end

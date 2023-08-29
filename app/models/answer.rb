class Answer < ApplicationRecord
  belongs_to :kid
  has_many :questions, dependent: :destroy
end

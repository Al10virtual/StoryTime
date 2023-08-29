class Kid < ApplicationRecord
  belongs_to :family
  has_one_attached :photo
  has_many :stories, dependent: :destroy
end

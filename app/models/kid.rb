class Kid < ApplicationRecord
  belongs_to :family
  has_many :stories, dependent: :destroy
end

class Family < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :user_families
  has_many :users, through: :user_families
  has_many :kids, dependent: :destroy
end

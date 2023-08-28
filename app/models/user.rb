class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates   :last_name,
              presence: true,
              format: { with: /\A[a-zA-Z]+\z/, message: "Only allows letters.." }
  validates   :first_name,
              presence: true,
              format: { with: /\A[a-zA-Z]+\z/, message: "Only allows letters.." }
  has_many :user_families
  has_many :families, through: :user_families
  has_many :my_families, class_name: 'Family'
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :diets,   dependent: :destroy
  has_many :weights, dependent: :destroy

  validates :name,   presence: true
  validates :email,  presence: true
  validates :height, presence: true

  validates_numericality_of :height, greater_than: 0

  validates_uniqueness_of :email
end

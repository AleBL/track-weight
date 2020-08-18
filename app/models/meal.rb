class Meal < ApplicationRecord
  belongs_to :diet

  validates :description, presence: true
  validates :eating_time, presence: true
  validates :type,        presence: true

  enum type: [:breakfast, :lunch, :dinner, :supper]
end

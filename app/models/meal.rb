class Meal < ApplicationRecord
  belongs_to :diet

  validates :description, presence: true
  validates :eating_time, presence: true
  validates :kind,        presence: true

  enum kind: [:breakfast, :lunch, :dinner, :supper]
end

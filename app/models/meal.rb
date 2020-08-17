class Meal < ApplicationRecord
  belongs_to :diet

  enum type: [:breakfast, :lunch, :dinner, :supper]
end

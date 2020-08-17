class Weight < ApplicationRecord
  belongs_to :user

  enum unity: [:kg, :lb]
end

class Diet < ApplicationRecord
  belongs_to :user
  has_many   :meals, dependent: :destroy

  belongs_to :initial_weight, class_name: 'Weight', dependent: :destroy
  belongs_to :ideal_weight,   class_name: 'Weight', dependent: :destroy

  validates :initial_date, presence: true
  validates :end_date,     presence: true

  validates_date :initial_date, on_or_before: :today
  validates_date :end_date,     on_or_after:  :initial_date
end

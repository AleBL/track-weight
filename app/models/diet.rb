class Diet < ApplicationRecord
  attr_accessor :meals_attributes

  belongs_to :user
  has_many   :meals, dependent: :destroy

  belongs_to :initial_weight, class_name: 'Weight', dependent: :destroy
  belongs_to :ideal_weight,   class_name: 'Weight', dependent: :destroy

  validates :initial_date, presence: true
  validates :end_date,     presence: true

  validates_date :initial_date, on_or_before: :today
  validates_date :end_date,     on_or_after:  :initial_date

  accepts_nested_attributes_for :ideal_weight,   reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :initial_weight, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :meals,          reject_if: :all_blank, allow_destroy: true

end

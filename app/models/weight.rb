class Weight < ApplicationRecord
  belongs_to :user

  enum unity: [:kg, :lb]

  validates :unity, presence: true
  validates :user,  presence: true
  validates :value, presence: true

  validates_date :registration_date, on_or_before: :today, allow_blank: true

  validates_numericality_of :value, greater_than: 0

  def label
    value.to_s << " " << unity
  end
end

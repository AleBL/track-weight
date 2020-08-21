class WeightQuery
  def self.weights(user)
    user.weights.where.not(registration_date: nil).order(registration_date: :asc)
  end
end
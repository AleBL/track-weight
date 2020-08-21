class DietQuery
  def self.diets(user)
    user.diets.order(created_at: :asc)
  end
end
class TableWeights
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def transform_table
    return [] if @user.nil?

    weights = ::WeightQuery.weights(@user)
    weights.map{|w| [w.registration_date, w.value, w.label]}
  end
end

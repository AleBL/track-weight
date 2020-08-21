class DietPolicy < Struct.new(:user, :diet)
  def authorized?
    user == diet.user
  end
end
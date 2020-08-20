class DietsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_authorization?, only: [:show, :edit, :update, :destroy]

  def new
    @diet = Diet.new
    @diet.meals.build

    @diet.initial_weight = Weight.new
    @diet.ideal_weight = Weight.new
  end

  def create
    @diet = current_user.diets.new(diet_params)
    @diet.initial_weight.write_attribute(:user_id, current_user.id)
    @diet.ideal_weight  .write_attribute(:user_id, current_user.id)

    if @diet.save
      flash[:notice] = "Diet was successfully created."
      redirect_to(root_path)
    else
      render :new
    end
  end

  private

  def verify_authorization?
    unless ::DietPolicy.new(current_user, @diet).authorized?
      render :file => "public/404.html", :status => :unauthorized
    end
  end

  def diet_params
    params.require(:diet)
    .permit(
      :initial_date,
      :end_date,
      :user_id,
      initial_weight_attributes: %i[value unity _destroy],
      ideal_weight_attributes: %i[value unity _destroy],
      meals_attributes: %i[eating_time description kind _destroy]
    )
  end
end

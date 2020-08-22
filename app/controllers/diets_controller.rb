class DietsController < ApplicationController
  before_action :set_diet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :verify_authorization?, only: [:show, :edit, :update, :destroy]

  def index
    @diets = ::DietQuery.diets(current_user)
  end

  def new
    @diet = Diet.new
    @diet.meals.new

    @diet.initial_weight = Weight.new
    @diet.ideal_weight = Weight.new
  end

  def create
    @diet = current_user.diets.new(diet_params)
    set_weight

    diet_params[:meals_attributes].try(:values).try(:each) do |meal_params|
      @diet.meals.new(meal_params)
    end

    if @diet.save
      flash[:notice] = "Diet was successfully created."
      redirect_to(root_path)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @diet.update(diet_params)
      flash[:notice] = "Diet was successfully updated."
      redirect_to(root_path)
    else
      render :edit
    end
  end

  def destroy
    @diet.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Diet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def verify_authorization?
    unless ::DietPolicy.new(current_user, @diet).authorized?
      render :file => "public/404.html", :status => :unauthorized
    end
  end

  def set_diet
    @diet = Diet.find(params[:id])
  end

  def set_weight
    @diet.initial_weight.write_attribute(:user_id, current_user.id) unless @diet.initial_weight.nil?
    @diet.ideal_weight  .write_attribute(:user_id, current_user.id) unless @diet.initial_weight.nil?
  end

  def diet_params
    params.require(:diet)
    .permit(
      :initial_date,
      :end_date,
      :user_id,
      initial_weight_attributes: %i[value unity id _destroy],
      ideal_weight_attributes: %i[value unity id _destroy],
      meals_attributes: %i[eating_time description kind id]
    )
  end
end

class WeightsController < ApplicationController
  def new
    @weight = Weight.new
  end

  def create
    @weight = current_user.weights.new(weight_params)

    @weight.registration_date = Date.current if @weight.registration_date.blank?

    if @weight.save
      flash[:notice] = "Weight was successfully created."
      redirect_to(root_path)
    else
      render :new
    end
  end

  private

  def weight_params
    params.require(:weight).permit(:registration_date, :value, :unity)
  end
end

class HomeController < ApplicationController
  def index
    table_weights = ::TableWeights.new(user: current_user)

    @weights = table_weights.transform_table
  end
end

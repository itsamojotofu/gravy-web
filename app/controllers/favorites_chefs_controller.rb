class FavoritesChefsController < ApplicationController
  before_action :chef_params

  def create
    FavoriteChef.create(user_id: current_user.id, chef_id: params[:id])
  end

  def destroy
    FavoriteChef.find_by(user_id: current_user.id, chef_id: params[:id]).destroy
  end

  private

  def chef_params
    @chef = Chef.find(params[:id])
  end

end

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @dishes = @user.dishes
    @chefs = @user.chefs
  end
end

class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])  
    @dishes = @chef.dishes
  end
end

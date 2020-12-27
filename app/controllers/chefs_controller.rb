# frozen_string_literal: true

class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @dishes = @chef.dishes
  end
end

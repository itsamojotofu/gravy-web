# frozen_string_literal: true

class ChefsController < ApplicationController
  before_action :set_cart
  

  def show
    @chef = Chef.find(params[:id])
    @dishes = @chef.dishes
  end

  private

  def set_cart
    @cart = current_cart
  end
end

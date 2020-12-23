# frozen_string_literal: true

class DishesController < ApplicationController
  def index; end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.valid?
      @dish.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:image, :name, :about, :genre_id, :ready_id, :price).merge(chef_id: current_chef.id)
  end
end

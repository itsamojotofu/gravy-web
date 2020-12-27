# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :authenticate_chef!, except: %i[index show]
  before_action :set_dish, only: %i[show edit update destroy]
  before_action :move_to_index, only: %i[edit destroy update]

  def index
    @dishes = Dish.all.order(created_at: 'DESC')
    @chefs = Chef.all.order(created_at: 'DESC')
  end

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

  def show; end

  private

  def dish_params
    params.require(:dish).permit(:image, :name, :about, :genre_id, :ready_id, :price).merge(chef_id: current_chef.id)
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_chef.id == @dish.chef.id
  end
end

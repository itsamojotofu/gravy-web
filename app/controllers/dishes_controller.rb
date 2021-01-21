# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :set_cart
  before_action :authenticate_chef!, except: %i[index show search]
  before_action :set_dish, only: %i[show edit update destroy]
  before_action :move_to_index, only: %i[edit destroy update]
  before_action :search_dish, only: [:search]

  def index
    @dishes = Dish.all.order(created_at: 'DESC').last(10)
    @chefs = Chef.all.order(created_at: 'DESC').last(10)
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

  def edit; end

  def update
    if @dish.update(dish_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @dish.destroy
    redirect_to root_path
  end

  def search
    @dishes = @p.result.includes(:chef)
  end

  private

  def dish_params
    params.require(:dish).permit(:image, :name, :about, :genre_id, :ready_id, :price).merge(chef_id: current_chef.id)
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def set_cart
    @cart = current_cart
  end

  def move_to_index
    redirect_to action: :index unless current_chef.id == @dish.chef.id
  end

  def search_dish
    params[:q][:genre_id_eq] = '' if !params[:q].nil? && (params[:q][:genre_id_eq] == '1')
    params[:q][:ready_id_eq] = '' if !params[:q].nil? && (params[:q][:ready_id_eq] == '1')
    @p = Dish.ransack(params[:q])  # 検索オブジェクトを生成
  end
end

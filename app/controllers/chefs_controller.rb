# frozen_string_literal: true

class ChefsController < ApplicationController
  before_action :set_cart
  before_action :move_to_index, except: %i[show search]
  before_action :search_chef, only: [:search]

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
  
  def destroy
  end

  def show
    @chef = Chef.find(params[:id])
    @dishes = @chef.dishes
  end

  def search
    @profiles = @pro.result.includes(:chef)

    @chefs = @p.result.includes(:profile)
    
    if @profiles == Profile.all
      @profiles = []
      
      @chefs.each do |chef|
        @profiles << chef.profile
      end
    end
  end

  private

  def set_cart
    @cart = current_cart
  end

  def move_to_index
    redirect_to root_path
  end

  def search_chef
    params[:q][:status_id_eq] = '' if !params[:q].nil? && (params[:q][:status_id_eq] == '1')
    params[:q][:gender_id_eq] = '' if !params[:q].nil? && (params[:q][:gender_id_eq] == '1')
    params[:q][:age_id_eq] = '' if !params[:q].nil? && (params[:q][:age_id_eq] == '1')
    params[:q][:genre_id_eq] = '' if !params[:q].nil? && (params[:q][:genre_id_eq] == '1')
    @p = Chef.ransack(params[:q])
    @pro = Profile.ransack(params[:q])
  end
end

# frozen_string_literal: true

class PrefecturesController < ApplicationController
  before_action :set_cart
  before_action :move_to_index, except: %i[show search]

  def index; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  def show
    @prefecture = Prefecture.find(params[:id])
    @chefs = @prefecture.chefs
    redirect_to root_path unless @chefs.present?
    @dishes = []

    @chefs.each do |chef|
      chef.dishes.each do |dish|
        @dishes << dish
      end
    end

    @dishes = @dishes.sort { |a, b| b.likes.size <=> a.likes.size }.last(20)
    @chefs = @chefs.sort { |a, b| b.favorite_chefs.size <=> a.favorite_chefs.size }.last(20)
  end

  def search
    address = params[:search]
    if address.match(/.*[都道府県]/).nil?
      redirect_to root_path, alert: '入力予測から選択してください'
    else
      address = address.match(/.*[都道府県]/).to_s
      period = address.match(/、/)
      if period
        prefecture = period.post_match
      else
        redirect_to root_path, alert: '日本語で入力してください'
      end
    end

    case prefecture
    when '北海道'
      redirect_to '/prefectures/2'
    when '東京都'
      redirect_to '/prefectures/14'
    when '石川県'
      redirect_to '/prefectures/18'
    when '広島県'
      redirect_to '/prefectures/35'
    when '福岡県'
      redirect_to '/prefectures/41'
    else
      @address = params[:search]
    end
  end

  private

  def set_cart
    @cart = current_cart
  end

  def move_to_index
    redirect_to root_path
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :cpp, if: :devise_controller?
  before_action :chef_caution, if: :devise_controller?
  before_action :user_caution, if: :devise_controller?

  private

  def cpp
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name zip_code prefecture_id district street phone_number])
  end

  def current_cart
    current_cart = Cart.find_by(id: session[:cart_id])
    current_cart = Cart.create unless current_cart
    session[:cart_id] = current_cart.id
    current_cart
  end
  
  def chef_caution
    if user_signed_in?
      flash[:notice] = "ユーザー用アカウントから一度ログアウトして、シェフ用アカウント作成に進んでください"
    end
  end
  
  def user_caution
    if chef_signed_in?
      flash[:notice] = "シェフ用アカウントから一度ログアウトして、サインアップに進んでください"
    end
  end

end

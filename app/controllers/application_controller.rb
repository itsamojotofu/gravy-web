# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :cpp, if: :devise_controller?

  private

  def cpp
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :zip_code, :prefecture_id, :district, :street, :phone_number])
  end
end

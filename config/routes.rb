Rails.application.routes.draw do
  devise_for :users
  root to: 'dishes#index'

end

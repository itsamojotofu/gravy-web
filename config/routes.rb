# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  devise_for :chefs, controllers: {
    sessions: 'chefs/sessions',
    passwords: 'chefs/passwords',
    registrations: 'chefs/registrations'
  }

  devise_scope :chef do
    get 'profiles', to: 'chefs/registrations#new_profile'
    post 'profiles', to: 'chefs/registrations#create_profile'
  end

  root to: 'dishes#index'
end

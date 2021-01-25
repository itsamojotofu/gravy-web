# frozen_string_literal: true

Rails.application.routes.draw do
  get 'cards/new'
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

  resources :dishes do
    get :search, on: :collection
  end
  
  resources :chefs do
    get :search, on: :collection
  end

  resources :prefectures do
    get :search, on: :collection
  end


  resources :orders, only: [:new, :create, :index, :show]
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create, :show, :destroy]
  resources :profiles, only: %i[edit update]


  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  post 'favorite_chef/:id' => 'favorites_chefs#create', as: 'create_favorite'
  delete 'favorite_chef/:id' => 'favorites_chefs#destroy', as: 'destroy_favorite'

  resources :line_items

  resources :carts, only: %i[show update destroy] do
    collection do
      post 'add_item'
    end
  end

end

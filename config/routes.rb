Rails.application.routes.draw do
  devise_for :chefs, controllers: {
  sessions:      'chefs/sessions',
  passwords:     'chefs/passwords',
  registrations: 'chefs/registrations'
   }
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }

  root to: 'dishes#index'

end

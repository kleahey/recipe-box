Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#index'
end

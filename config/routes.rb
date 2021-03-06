Rails.application.routes.draw do
  get 'profile/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  scope ":user_name" do
    resources :recipes, as: 'user_recipes'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile

  root :to => 'home#index'
end

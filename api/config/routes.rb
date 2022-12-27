require 'sidekiq/web'
Rails.application.routes.draw do
  resources :weapons
  resources :homebrew_accesses
  mount Sidekiq::Web => '/sidekiq'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :equipament_categories
  resources :proficiencies
  resources :monsters
  resources :skills
  resources :features
  resources :feats
  resources :spells
  resources :dnd_classes
  resources :dnd_sub_classes
  resources :characters
  resources :sub_races
  resources :races
  resources :traits
  resources :languages
  resources :campaigns
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

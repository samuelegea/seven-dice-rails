Rails.application.routes.draw do
  resources :proficiencies
  resources :monsters
  resources :magic_items
  resources :skills
  resources :features
  resources :feats
  resources :spells
  resources :dnd_classes
  resources :dnd_sub_classes
  resources :equipaments
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

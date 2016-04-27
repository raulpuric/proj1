Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch 'home/:id' , to: 'pokemons#capture', as: :capture, path: 'capture'
  patch 'trainers/:id', to: 'pokemons#damage', as: :damage, path: 'damage'
  get "pokemons/new", to: 'pokemons#new', as: :new_pokemon
  post 'pokemons', to: 'pokemons#create'

end

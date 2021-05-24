Rails.application.routes.draw do
  resources :birds
  resources :cats
  resources :dogs
  resources :turtles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

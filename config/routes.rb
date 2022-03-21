Rails.application.routes.draw do
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  post "/dogs" => "dogs#create"
  patch "/dogs/:id" => "dogs#update"
  delete "/dogs/:id" => "dogs#destroy"
end
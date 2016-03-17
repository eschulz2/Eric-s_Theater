Rails.application.routes.draw do

  root 'visitors#index'
  resources :showings
  post "/tickets" => 'showings#make_ticket'
  
end

Rails.application.routes.draw do

  root 'visitors#index'
  resources :showings do
    member do
      get 'tickets_sold'
    end
  end
  get "/tickets" => 'tickets#index'
  get "/admin" => 'admins#index'
  post "/tickets" => 'showings#make_ticket'
  
end

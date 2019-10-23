Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/pokemon', to: 'pokemon#index'
  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  post '/signup', to: 'users#create'
end

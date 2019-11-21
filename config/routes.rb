Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/pokemon', to: 'pokemon#index'

  get '/:id/teams', to: 'users#get_teams'
  get '/:id/team/:team_id', to: 'users#get_team'
  post '/:id/team/new', to: 'users#create_team'
  post '/:id/team/:team_id/add/:poke_id', to: 'users#add_pokemon'

  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  post '/signup', to: 'users#create'
end

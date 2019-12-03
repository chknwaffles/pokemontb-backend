class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.new(email: params[:user], password: params[:password])
        
        if user.save
            token = encode_token(user.id)
            render json: {user: UserSerializer.new(user), token: token}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def create_team
        user = User.find(params[:id])
        new_team = Team.create(user_id: user.id, name: params['_json'], pokemons: [])

        render json: user
    end

    def get_teams
        user = User.find(params[:id])

        render json: user.teams
    end

    def get_team
        user = User.find(params[:id])
        
        target_team_index = user.teams.find_index { |e| e.id == params[:team_id].to_i }
        byebug
        render json: user.teams[target_team_index]
    end

    def add_pokemon
        user = User.find(params[:id])

        # find user team that equals team_id 
        new_poke = Pokemon.find(params[:poke_id])
        
        # add new poke to team
        target_team = user.teams.find(params[:team_id])

        if target_team.pokemons.length >= 6
            render json: { errors: 'too many pokemon on one team'}
        else
            target_team.pokemons.push(new_poke)
            render json: user
        end
    end

    def remove_pokemon
        user = User.find(params[:id])

        target_team = user.teams.find(params[:team_id])

        target_team.pokemons.destroy(params[:poke_id])

        render json: user
    end
end

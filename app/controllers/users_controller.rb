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
        new_team = Team.create(user_id: user.id, name: params['_json'])

        render json: user
    end

    def get_teams
        user = User.find(params[:id])

        render json: user
    end

    def get_team
        user = User.find(params[:id])

        render json: user.teams
    end

    def add_pokemon
        user = User.find(params[:id])
        # find user team that equals team_id 
        new_poke = Pokemon.find(params[:poke_id])
        
        # add new poke to team

        render json: user
    end
end

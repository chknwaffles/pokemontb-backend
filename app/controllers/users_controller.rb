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
        user = User.new(email: params[:email], password: params[:password])
        # byebug
        if user.save
            token = encode_token(user.id)
            render json: {user: UserSerializer.new(user), token: token}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def create_team
        user = User.find(params[:id])
        new_team = Team.create(user_id: user.id)

        render json: user
    end

    def add_pokemon
        user = User.find(params[:id])

        
    end
end
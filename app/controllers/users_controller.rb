class UsersController < ApplicationController

    def login
        user = User.find_by(username: params[:username])
        render json: user
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json:  user
        else 
            render json: { error: "user already exists"}
        end
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def index
        users = User.all
        render json: users
    end

    def update
        user = User.find_by(id: params[:id])
        user.update(user_params)
    end

    private

    def user_params
        params.permit(:username, :eligible)
    end

end

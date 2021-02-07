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

    private

    def user_params
        params.permit(:username)
    end

end

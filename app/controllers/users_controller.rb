class UsersController < ApplicationController


    def login
        user = User.find_by(username: params[:username])
        render json: user
    end

    def create
        # user = User.create(user_params)

        if params[:profile_pic] === "undefined"
            user = User.create(username: params[:username], profile_pic: "https://www.xovi.com/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png", eligible: true, name: params[:name], email: params[:email], bio: params[:bio])

        else
            image = Cloudinary::Uploader.upload(params[:profile_pic])
            user = User.create(username: params[:username], profile_pic: image["url"], eligible: true, name: params[:name], email: params[:email], bio: params[:bio] )

        end

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
        params.permit(:user, :username, :eligible, :profile_pic, :name, :email, :bio)
    end

end
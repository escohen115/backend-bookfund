class SponsorsController < ApplicationController
    def create 
        sponsor = Sponsor.create(sponsor_params)
        if sponsor.valid?
            render json: sponsor
        else
            render json: {error: sponsor.errors.full_messages}
        end
    end

    private

    def sponsor_params
        params.permit(:user_id, :book_id)
    end

end

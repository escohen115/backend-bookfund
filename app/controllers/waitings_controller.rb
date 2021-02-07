class WaitingsController < ApplicationController

    def create 
        waiting = Waiting.create(waiting_params)
        if waiting.valid?
            render json: waiting
        else
            render json: {error: waiting.errors.full_messages}
        end
    end

    def index
        waitings = Waiting.all
        render json: waitings
    end

    def sponsor
        number_of_sponsors = (sponsor_params[:sponsors]).to_i
        book_index = (params[:id]).to_i
        waitings = Waiting.where(book_id: book_index)
        $i = 0
        while $i < number_of_sponsors
            waitings[$i].destroy
            $i += 1
        end
    end

    private

    def waiting_params
        params.permit(:user_id, :book_id)
    end

    def sponsor_params
        params.permit(:sponsors)
    end
    
end

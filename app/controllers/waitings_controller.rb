class WaitingsController < ApplicationController

    def create 
        waiting = Waiting.create(waiting_params)
        if waiting.valid?
            render json: waiting
        else
            render json: {error: "you've already joined the waitlist for this book"}
        end
    end

    def index
        waitings = Waiting.all
        render json: waitings
    end

    def sponsor
        
        number_of_sponsors = (sponsor_params[:num_books_funded]).to_i

        book_index = (params[:id]).to_i
        sponsor_id = sponsor_params[:sponsor_id].to_i

        waitings = Waiting.where(book_id: book_index, fulfilled: nil)
        $i = 0

        t = Time.now
        time = t.to_f * 1000

        while $i < number_of_sponsors
            
            if User.find_by(username: (waitings[$i].user.username)).eligible == true
                user = User.find_by(username: (waitings[$i].user.username))
                if user.id != sponsor_id
                    user.update(eligible: false)
                    byebug
                    waitings[$i].update(fulfilled: true, sponsor_id: sponsor_id, sponsor_date: time)
                    $i += 1
                end
            else
                $i += 1
                number_of_sponsors+=1
            end
        end

        render json: waitings
            
    end

    # def user_index
    #     waitings = Waiting.where(user_id: params[:id])
    #     render json: waitings
    # end

    private

    def waiting_params
        params.permit(:user_id, :book_id)
    end

    def sponsor_params
        params.permit(:num_books_funded, :sponsor_id, :fulfilled)
    end
    
end

class ReviewsController < ApplicationController
    def create 
        review = Review.create(review_params)
        if review.valid?
            render json: review
        else
            render json: {error: "you've already left a review for this book"}
        end
    end

    def index
        reviews = Review.all
        render json: reviews
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy

    end

    private

    def review_params
        params.permit(:user_id, :book_id, :text, :rating)
    end


end

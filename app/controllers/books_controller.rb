class BooksController < ApplicationController

    def create 
        book = Book.create(book_params)
    
        if book.valid?
            render json:  book
        else
            book = Book.find_by(api_id: book_params[:api_id])
            render json:  book
        end
    end
    
    def index
        books = Book.all
        render json: books
    end

    private

    def book_params
        
        params.permit(:title, :subtitle, :authors, :publisher, :publishedDate, :description, :image_url, :api_id)
        # byebug
    end



end

require 'nokogiri'
require 'httparty'


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

    def scrape
       
        url = "https://booksrun.com/search/#{params[:id]}?"
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page)
        price = parsed_page.xpath('/html/body/main/div/section/div[1]/div/div[2]/div/a')
        price_parsed = price.text[47..51]
        render json: price_parsed
        byebug

    end

    private

    def book_params
        params.permit(:title, :subtitle, :authors, :publisher, :publishedDate, :description, :image_url, :api_id)
    end



end

require 'nokogiri'
require 'httparty'


class BooksController < ApplicationController

    def create 
        book = Book.create(book_params)
        if book.valid?
            render json: book
        else
            book = Book.find_by(api_id: book_params[:api_id])
            render json: book
        end
    end
    
    def index
        books = Book.all
        render json: books
    end

    def show
        book = book.find_by(id: params[:id])
        render json: book
    end


    def scrape
       
        url = "https://booksrun.com/search/#{params[:id]}?"
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page)
        price = parsed_page.xpath('/html/body')

        endpoint = price.at('a')['href']
        base_url = "https://booksrun.com"        
        to_be_returned = base_url + endpoint


        render json: to_be_returned
        
    end

    private

    def book_params
        params.permit(:title, :subtitle, :authors, :publisher, :publishedDate, :description, :image_url, :api_id)
    end



end

require 'net/http'
require 'uri'
require 'json'
include ApplicationHelper

class BooksController < ApplicationController
    def show
        @book = Book.find(params[:id])
    end

    def index
        @books = Book.all
    end

    def create
        isbn = params[:book][:isbn]
        result = get_book_information(isbn)

        @book = Book.new()
        @book.title = result['title']
        @book.isbn_10 = result['isbn_10']
        @book.isbn_13 = result['isbn_13']
        @book.subtitle = result['subtitle']
        @book.authors = result['authors']
        begin
            @book.image_link = URI.parse(result['image_link']).read
        rescue
        end
        if @book.save
            redirect_to @book
        else
            render 'new'
        end
    end

    def destroy
        Book.find(params[:id]).destroy
        redirect_to Book
    end

    def new
        @book = Book.new
    end
end

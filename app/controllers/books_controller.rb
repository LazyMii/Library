require 'net/http'
require 'uri'
require 'json'

class BooksController < ApplicationController
  def show
      @book = Book.find(params[:id])
  end

  def create
      result = get_json
      title = result['items'][0]['volumeInfo']['title']
      isbn = params[:book][:isbn]
      @book = Book.new()
      @book.title = title
      @book.isbn = isbn
      if @book.save
          redirect_to @book
      else
          render 'new'
      end
  end

  def new
      @book = Book.new
  end

  private
    def get_json
        url = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + params[:book][:isbn]
        uri = URI.parse(url)
        json = Net::HTTP.get(uri)
        return JSON.parse(json)
    end
end

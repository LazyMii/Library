include ApplicationHelper

class LoansController < ApplicationController
  def show
      @loan = Loan.find(params[:id])
  end

  def index
      @my_loans = Loan.where(:user_id => current_user.id.to_s)
  end

  def create
      @loan = Loan.new
      @loan.user_id = current_user.id.to_s
      isbn = params[:loan][:book_id]
      if not is_isbn13(isbn)
          isbn = isbn10_to_13(isbn)
      end
      Book.where(:isbn_13 => isbn).find_each do |book|
        if Loan.find_by(book_id: book.id).nil?
            @loan.book_id = book.id
            @loan.check_in = Date.today.to_time
        end
      end
      if @loan.save
        redirect_to @loan
      else
          render 'new'
      end
  end

  def new
      @loan = Loan.new
  end

  def destroy
    Loan.find(params[:id]).destroy
    redirect_to Loan
  end
end

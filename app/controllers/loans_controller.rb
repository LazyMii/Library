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
      Book.where(:isbn => isbn).find_each do |book|
        if Loan.find_by(book_id: book.id).nil?
            @loan.book_id = book.id
        end
      end
      if @loan.save
        redirect_to @loan
      else
          render :template => "static_pages/loan"
      end
  end

  def destroy
    Loan.find(params[:id]).destroy
    redirect_to current_user
  end
end

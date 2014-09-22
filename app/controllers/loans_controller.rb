class LoansController < ApplicationController
  def show
      @loan = Loan.find(params[:id])
  end

  def create
      @loan = Loan.new
      @loan.user_id = current_user.id.to_s
      isbn = params[:loan][:book_id]
      Book.where(:isbn => isbn).find_each do |book|
        puts book.id
        if Loan.find_by(book_id: book.id).nil?
            puts "hello"
            @loan.book_id = book.id
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
end

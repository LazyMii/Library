class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def purchase_request

  end

  def loan
      @loan = Loan.new
  end

  def return
      @return = Loan.new
  end
end

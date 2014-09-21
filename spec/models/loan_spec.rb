require 'rails_helper'

describe Loan do
    before { @loan = Loan.new(book_id: 8, user_id: 1) }

    subject { @loan }

    it { should respond_to(:book_id) }
    it { should respond_to(:user_id) }

    it { should be_valid }

    describe "when book_id is not present" do
        before { @loan.book_id = " " }
        it { should_not be_valid }
    end
end

require 'spec_helper'
require 'support/utilities.rb'

describe "Loan pages" do
    subject { page }

    describe "Loaning page" do
        before { visit loaning_path }

        it { should have_content('Loaning') }
        it { should have_title(full_title('Loaning')) }
    end

    describe "Loaning" do
        before { visit loaning_path }
        let(:submit){ "Loaning book" }

        describe "with invalid information" do
            expect{ click_button submit }.not_to change(Loan, :count)
        end

        describe "with valid information" do
            before do
                fill_in "Isbn",     with: "9784873116976"
            end

            it "should create a loan" do
                expect{ click_button submit }.to change(Loan, :count).by(1)
            end
        end

    end

    describe "profile page" do
        let (:loan) { FactoryGirl.create(:loan)}
        before { visit loan_path(loan) }

        it { should have_content(loan.book_id) }
        it { should have_content(loan.book_id) }
    end

end

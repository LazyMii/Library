require 'rails_helper'
require 'support/utilities'
include  ApplicationHelper

describe "Book pages" do
    subject { page }

    describe "Add Books" do
        before { visit adding_books_path }

        let(:submit) { "Adding book" }

        it { should have_content('Adding Books') }
        it { should have_title(full_title('Adding Books')) }

        describe "with invalid information" do
            it "should not add a book" do
                expect { click_button submit }.not_to change(Book, :count)
            end
        end

        describe "with valid information" do
            before do
                fill_in "Isbn", with: "9784105452018"
            end

            it "should add a book" do
                expect { click_button submit }.to change(Book, :count).by(1)
            end
        end
    end

    describe "profile page" do
        let(:book) { FactoryGirl.create(:book) }
        before { visit book_path(book) }

        it { should have_content(book.title) }
        it { should have_title(book.title) }
    end

end

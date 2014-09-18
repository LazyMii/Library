require 'rails_helper'
require 'support/utilities'
include  ApplicationHelper

describe "Book pages" do
    describe "Book pages" do
        subject { page }

        describe "Add Books page" do
            before { visit add_books_path }

            it { should have_content('Add Books') }
            it { should have_title(full_title('Add Books')) }
        end
    end
end

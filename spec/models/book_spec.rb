require 'rails_helper'

describe Book do
    before { @book = Book.new(title: "四色問題", isbn: "9784105452018") }

    subject { @book }

    it { should respond_to(:title) }
    it { should respond_to(:isbn) }

    it { should be_valid }

    describe "when title is not present" do
        before { @book.title = " " }
        it { should_not be_valid }
    end

    describe "when isbn is not present" do
        before { @book.isbn = " " }
        it { should_not be_valid }
    end
end

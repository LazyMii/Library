class Book < ActiveRecord::Base
    #def initialize(title, isbn)
    #    @title = title
    #    @isbn = isbn
    #end

    validates :title, presence: true
    validates :isbn,  presence: true
end

class Loan < ActiveRecord::Base
    validates :book_id, presence: true
    validates :user_id, presence: true
end

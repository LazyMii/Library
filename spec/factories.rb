FactoryGirl.define do
    factory :user do
        sequence(:name)  { |n| "Person #{n}" }
        sequence(:email) { |n| "person_#{n}@example.com" }
        password"foobar"
        password_confirmation "foobar"
    end

    factory :book do
        title "四色問題"
        isbn "9784105452018"
    end

    factory :loan do
        user_id "1"
        book_id "8"
        check_in Time.now
    end
end

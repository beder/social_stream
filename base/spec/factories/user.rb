FactoryGirl.define do
  sequence(:user_seq) { |n| n }
  sequence(:email) { |n| "user#{ n }@example.com" }

  factory :user do
    
    name { "User #{ generate(:user_seq) }" }
    email { "user#{ generate(:user_seq) }@example.com" }
    password "testing"
    password_confirmation "testing"
  end
end

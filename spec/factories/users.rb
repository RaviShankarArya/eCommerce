# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_name "MyString"
    first_name "MyString"
    last_name "MyString"
    password_digest "MyString"
    email "MyString"
    address "MyText"
    phone "MyString"
    auth_token "MyString"
  end
end

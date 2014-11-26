# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_detail do
    item_code "MyString"
    color "MyString"
    price 1.5
    stock 1
    product_type
  end
end

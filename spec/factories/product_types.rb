# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_type do
    product_type_name "MyString"
    product_category nil
  end
end

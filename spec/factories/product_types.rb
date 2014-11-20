# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_type do
    product_type_name "Shirt"
    # product_category {Faker::Number.digit}
  end
end

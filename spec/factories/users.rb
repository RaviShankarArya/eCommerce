# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_name "RaviShankar"
    first_name "Ravi"
    last_name "Shankar"
    password "Password_123@"
    password_confirmation "Password_123@"
    email "ABCDE@domain.com"
    address "fdsafs sdfsdgs  232 dsgsdgdsgss arwr awrggdsgrsae afasfafa"
    phone "990-191-6142"
    auth_token "xxxxxaaaaxxx"
  end
end

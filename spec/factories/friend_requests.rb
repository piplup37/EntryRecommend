# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friend_request do
    from_user nil
    to_user nil
    message "MyText"
    check false
    approval false
  end
end

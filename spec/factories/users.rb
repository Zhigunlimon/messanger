FactoryGirl.define do
  factory :user do
    email 'test@user.com'
    password 'password'
    dialect
  end
end

FactoryGirl.define do
  factory :user do
    username 'Test User'
    password 'testpassword'
    password_confirmation 'testpassword'
    email 'testemail@example.com'
  end
end

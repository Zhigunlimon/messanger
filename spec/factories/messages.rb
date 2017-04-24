FactoryGirl.define do
  factory :message do
    body 'Some message example'
    user
    chat_room
  end
end

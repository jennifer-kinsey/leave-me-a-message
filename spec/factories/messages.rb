FactoryGirl.define do
  factory :message do
    body 'hey, bud!'
    favorite true
    user_id 1
  end
end

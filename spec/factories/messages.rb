FactoryGirl.define do
  factory :message do
    body 'hey, bud!'
    favorite false
    user_id 1
    id 1
  end
end

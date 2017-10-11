FactoryGirl.define do
  factory :user do
    username 'K'
    email 'k@email.com'
    password 'password'
    password_confirmation 'password'
    admin false
    id 1
  end

  # factory :admin, class: User do
  #   username 'admin'
  #   email 'admin2@email.com'
  #   password 'password'
  #   password_confirmation 'password'
  #   admin true
  #   id 2
  # end

  factory :message do
    body 'hey, bud!'
    favorite true
    id 1
  end
end
